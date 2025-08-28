DECLARE @ExcludedPersonIds TABLE (
    [Id] int NOT NULL
);

DECLARE @AllFamilyIds TABLE (
    [Id] int NOT NULL
);

/******************************
    Here's how I find all the "valid" Persons, and transform that into "valid Families"
******************************/

INSERT INTO @ExcludedPersonIds ([Id])
SELECT
    p.[Id]
FROM
    [TaggedItem] ti
    INNER JOIN [Person] p ON p.[Guid] = ti.[EntityGuid]
WHERE
    ti.[TagId] IN (14, 16, 17)
    --TagId:14 is 'REST Key'
    --TagId:16 is 'Rock Partner'
    --TagId:17 is 'Test'
;

INSERT INTO @AllFamilyIds ([Id])
SELECT
    p.[PrimaryFamilyId]
FROM
    [Person] p
WHERE
    p.[RecordStatusValueId] <> 4 --This means "not Inactive"
    AND
    p.[RecordTypeValueId] = 1 --This essentially means "is a Person, not a Business"
    AND
    p.[Id] NOT IN (SELECT [Id] FROM @ExcludedPersonIds)
    AND
    p.[PrimaryFamilyId] IS NOT NULL
;

/******************************
    Here's my actual query
******************************/

SELECT
    gm.[GroupId] AS 'FamilyId'
  , g.[Name] AS 'FamilyName'
  , COUNT(gm.[Id]) AS 'FamilyMembersCount'
FROM
    [Group] g
    INNER JOIN [GroupMember] gm ON gm.[GroupId] = g.[Id]
    INNER JOIN [Person] p ON p.[Id] = gm.[PersonId]
WHERE
    g.[Id] IN (SELECT [Id] FROM @AllFamilyIds)
    AND
    p.[AgeClassification] <> 2 --This means "not classified as a Child"
GROUP BY
    gm.[GroupId]
  , g.[Name]
ORDER BY
    [FamilyMembersCount] DESC
;