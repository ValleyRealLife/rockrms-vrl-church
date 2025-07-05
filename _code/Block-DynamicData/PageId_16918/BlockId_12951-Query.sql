/********************************************************************************************************************************************
    
    This SQL is found in
    PageId:16918, BlockId:12951, [Dynamic Data] > Query
    
    This SQL is used in the Dynamic Data block
    
    Path:
    _code/Block-DynamicData/PageId_16918/BlockId_12951-Query.sql
    
********************************************************************************************************************************************/

DECLARE @PersonsInRegistrationInstance TABLE (
    [Id] int NOT NULL
);

DECLARE @PersonsInGroup TABLE (
    [Id] int NOT NULL
);

INSERT INTO @PersonsInRegistrationInstance ([Id])
SELECT
    pa.[PersonId]
FROM
    [RegistrationRegistrant] regreg
    INNER JOIN [PersonAlias] pa ON pa.[Id] = regreg.[PersonAliasId]
WHERE
    regreg.[RegistrationId] IN (SELECT [Id] FROM [Registration] WHERE [RegistrationInstanceId] = @RegInsId)
;

INSERT INTO @PersonsInGroup ([Id])
SELECT
    gm.[PersonId]
FROM
    [GroupMember] gm
WHERE
    gm.[GroupId] = @CheckinGroup
    AND
    gm.[IsArchived] = 0
    AND
    gm.[GroupMemberStatus] = 1
;

-- How many people are in BOTH tables?
SELECT
    *
FROM
    [Person] p
    INNER JOIN @PersonsInRegistrationInstance pri ON p.[Id] = pri.[Id]
    INNER JOIN @PersonsInGroup pig ON p.[Id] = pig.[Id]
;

-- How many people are ONLY in the registration instance?
SELECT
    *
FROM
    [Person] p
    INNER JOIN @PersonsInRegistrationInstance pri ON p.[Id] = pri.[Id]
WHERE
    p.[Id] NOT IN (SELECT [Id] FROM @PersonsInGroup)
;

-- How many people are ONLY in the group?
SELECT
    *
FROM
    [Person] p
    INNER JOIN @PersonsInGroup pig ON p.[Id] = pig.[Id]
WHERE
    p.[Id] NOT IN (SELECT [Id] FROM @PersonsInRegistrationInstance)
;