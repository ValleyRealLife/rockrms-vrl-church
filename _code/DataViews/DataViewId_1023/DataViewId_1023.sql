/******************************************************************************************************************************************************
    
    This SQL is found in DataViewId:1023
    Currently, this DataView is named "LG Leaders, No RDT"
    
    References:
    - This SQL is used to sync GroupMembers of GroupId: 131747
    
    Path:
    _code/DataViews/DataViewId_1023/DataViewId_1023.sql
    
******************************************************************************************************************************************************/

-- Declare some variables
DECLARE @GroupType_LifeGroup TABLE (
    [Id] int NOT NULL
);

DECLARE @LifeGroups TABLE (
    [Id] int NOT NULL
);

DECLARE @GroupTypeRole_Leader TABLE (
    [Id] int NOT NULL
);

DECLARE @Step_RDT TABLE (
    [PersonAliasId] int NOT NULL
  , [CompletedDateTime] datetime
);

-- Insert rows into TABLE variables
INSERT INTO @GroupType_LifeGroup ([Id])
VALUES
    (25) --This is "LifeGroup"
  , (45) --This is "MensLifeGroup"
  , (46) --This is "WomensLifeGroup"
  , (59) --This is "RecoveryLifeGroup"
;

INSERT INTO @LifeGroups ([Id])
SELECT
    [Id]
FROM
    [Group]
WHERE 
    [IsActive] = 1 AND [IsArchived] = 0
    AND
    [GroupTypeId] IN (SELECT [Id] FROM @GroupType_LifeGroup)
;

INSERT INTO @GroupTypeRole_Leader ([Id])
SELECT
    [Id]
FROM
    [GroupTypeRole]
WHERE
    [GroupTypeId] IN (SELECT [Id] FROM @GroupType_LifeGroup)
    AND
    [IsLeader] = 1
;

INSERT INTO @Step_RDT ([PersonAliasId], [CompletedDateTime])
SELECT
    [PersonAliasId]
  , MAX([CompletedDateTime])
FROM
    [Step]
WHERE
    [StepTypeId] = 7
GROUP BY
    [PersonAliasId]
;

-- Now do the actual Query that we're here to do
SELECT
    p.[Id] AS 'Id'
FROM
    [GroupMember] gm
    INNER JOIN [GroupType] gt ON gt.[Id] = gm.[GroupTypeId]
    INNER JOIN [Group] g ON g.[Id] = gm.[GroupId]
    INNER JOIN [Person] p ON p.[Id] = gm.[PersonId]
    INNER JOIN [PersonAlias] pa ON pa.[PersonId] = p.[Id] AND pa.[PersonId] = pa.[AliasPersonId]
    INNER JOIN [GroupTypeRole] gtr ON gtr.[Id] = gm.[GroupRoleId]
    LEFT JOIN @Step_RDT s7 ON s7.[PersonAliasId] = pa.[Id]
WHERE
    gm.[IsArchived] = 0
    AND
    gm.[GroupMemberStatus] <> 0
    AND
    gm.[GroupId] IN (SELECT [Id] FROM @LifeGroups)
    AND
    gm.[GroupRoleId] IN (SELECT [Id] FROM @GroupTypeRole_Leader)
    AND
    s7.[CompletedDateTime] IS NULL