/**************************************************************************************************************
    
    This SQL is found in DataViewId:907
    Currently, this DataView is named "LG Members (joined in last seven days)"
    
    References:
    - This SQL is used to parametrize an entity command that feeds into a kpi shortcode in BlockId:6227
    
    Path:
    _code/DataViews/DataViewId_907/DataViewId_907.sql
    
**************************************************************************************************************/

DECLARE @date_today date = GETDATE();
DECLARE @date_querystart date = DATEADD(DAY, -6, @date_today);
DECLARE @date_queryend date = @date_today;

DECLARE @FilteredGroupIds TABLE(
    [Id] int NOT NULL
);

DECLARE @Excluded_PersonIds TABLE(
    [Id] int NOT NULL
);

DECLARE @FilteredGroupMembers TABLE(
    [GroupMemberId] int NOT NULL
  , [PersonId] int NOT NULL
  , [GroupId] int NOT NULL
  , [GroupTypeId] int NOT NULL
  , [GroupRoleId] int NOT NULL
  , [DateTimeAdded] date NOT NULL
  , [AddedBy] int NOT NULL
);

INSERT INTO @Excluded_PersonIds ([Id])
SELECT p.[Id] FROM [TaggedItem] ti LEFT JOIN [Person] p ON p.[Guid] = ti.[EntityGuid] WHERE ti.[EntityTypeId] = 15 AND ti.[TagId] IN (14, 17)
--The EntityTypeId:15 is the [Person] Entity
--The TagId:14 is 'REST Key' Person
--The TagId:17 is 'Test' Person
;

INSERT INTO @FilteredGroupIds ([Id])
SELECT
    g.[Id]
FROM
    [Group] g
    INNER JOIN [TaggedItem] ti ON ti.[EntityGuid] = g.[Guid] AND ti.[TagId] = 20
;

INSERT INTO @FilteredGroupMembers ([GroupMemberId], [PersonId], [GroupId], [GroupTypeId], [GroupRoleId], [DateTimeAdded], [AddedBy])
SELECT
    gm.[Id]
  , gm.[PersonId]
  , gm.[GroupId]
  , gm.[GroupTypeId]
  , gm.[GroupRoleId]
  , gm.[DateTimeAdded]
  , CASE WHEN gm.[CreatedByPersonAliasId] IS NULL THEN '1' ELSE '2' END AS 'AddedBy'
FROM
    [GroupMember] gm
WHERE
    gm.[GroupTypeId] = 25
    AND gm.[IsArchived] = 0
    AND gm.[GroupRoleId] IN (23, 58)
    AND gm.[DateTimeAdded] >= @date_querystart
    AND gm.[DateTimeAdded] <= @date_queryend
    AND gm.[GroupId] IN (SELECT [Id] FROM @FilteredGroupIds)
;

INSERT INTO @FilteredGroupMembers ([GroupMemberId], [PersonId], [GroupId], [GroupTypeId], [GroupRoleId], [DateTimeAdded], [AddedBy])
SELECT
    gm.[Id]
  , gm.[PersonId]
  , gm.[GroupId]
  , gm.[GroupTypeId]
  , gm.[GroupRoleId]
  , gm.[DateTimeAdded]
  , CASE WHEN gm.[CreatedByPersonAliasId] IS NULL THEN '1' ELSE '2' END AS 'AddedBy'
FROM
    [GroupMember] gm
WHERE
    gm.[GroupTypeId] = 25
    AND gm.[IsArchived] = 1
    AND gm.[GroupRoleId] IN (23, 58)
    AND gm.[ArchivedDateTime] > @date_queryend
    AND gm.[DateTimeAdded] >= @date_querystart
    AND gm.[DateTimeAdded] <= @date_queryend
    AND gm.[GroupId] IN (SELECT [Id] FROM @FilteredGroupIds)
;

SELECT
    fgm.[PersonId]
FROM
    @FilteredGroupMembers fgm
WHERE
    fgm.[PersonId] NOT IN (SELECT [Id] FROM @Excluded_PersonIds)
;