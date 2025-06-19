/**************************************************************************************************************
    
    This SQL is found in DataViewId:1053
    Currently, this DataView is named: LifeGroupLeaders - FromDataView_1052
    
    Note:
    - It's possible that the SQL results will not be an exact match with the results in the DataView.
    - That's because the DataView has extra logic that SparkDev hardcoded (such as filtering out inactive Person records).
    
    Path:
    _code/DataViews/DataViewId_1053/DataViewId_1053.sql
    
**************************************************************************************************************/

DECLARE @Excluded_PersonIds TABLE(
    [Id] int NOT NULL
);

DECLARE @Filtered_GroupIds TABLE(
    [Id] int NOT NULL
);

INSERT INTO @Excluded_PersonIds ([Id])
SELECT p.[Id] FROM [TaggedItem] ti LEFT JOIN [Person] p ON p.[Guid] = ti.[EntityGuid] WHERE ti.[EntityTypeId] = 15 AND ti.[TagId] IN (14, 17)
--The EntityTypeId:15 is the [Person] Entity
--The TagId:14 is 'REST Key' Person
--The TagId:17 is 'Test' Person
;

INSERT INTO @Filtered_GroupIds ([Id])
SELECT
    g.[Id]
FROM
    [Group] g
    INNER JOIN [TaggedItem] ti ON ti.[EntityGuid] = g.[Guid] AND ti.[TagId] = 20 --This is the "LifeGroup" Tag
WHERE
    g.[GroupTypeId] IN (25, 45, 46) --These are "LifeGroup", "MensGroup" and "WomensGroup", respectively
    AND
    g.[IsActive] = 1 AND g.[IsArchived] = 0 --These are the default criteria for a Group being "Active"
;

SELECT
    gm.[PersonId]
FROM
    [GroupMember] gm
    INNER JOIN [GroupTypeRole] gtr ON gtr.[Id] = gm.[GroupRoleId]
WHERE
    gm.[GroupId] IN (SELECT [Id] FROM @Filtered_GroupIds)
    AND
    gm.[GroupMemberStatus] = 1 --This is GroupMemberStatus 'Active', hard-coded in Rock by SparkDev
    AND
    gm.[IsArchived] = 0
    AND
    gtr.[IsLeader] = 1
    AND
    gm.[PersonId] NOT IN (SELECT [Id] FROM @Excluded_PersonIds)
;
