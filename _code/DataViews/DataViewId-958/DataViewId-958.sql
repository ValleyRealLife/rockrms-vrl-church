/****************************************************************************************
    This SQL is found in DataViewId:958
    Currently, this DataView is named "LG Coaches with overdue LG Leader Check-in"
    
    References:
    - This DataView is used in ServiceJobId:209
    
    Path:
    _code/DataViews/DataViewId-958/DataViewId-958.sql
****************************************************************************************/

DECLARE @CurrentDate DATETIME;
SET @CurrentDate = GETDATE()
;

DECLARE @OneMonthAgo DATETIME;
SET @OneMonthAgo = DATEADD(MONTH, -1, @CurrentDate)
;

DECLARE @MostRecentCoachCheckinForm TABLE (
    [Id] INT
  , [Title] NVARCHAR(255)
  , [GroupId] INT
  , [FormSubmissionDateTime] DATETIME
);

INSERT INTO @MostRecentCoachCheckinForm ([Id], [Title], [GroupId], [FormSubmissionDateTime])
SELECT
    cci.[Id]
  , cci.[Title]
  , cci_GroupId.[Value] AS 'GroupId'
  , cci.[StartDateTime] AS 'FormSubmissionDateTime'
FROM
    [ContentChannelItem] cci
    LEFT JOIN [AttributeValue] cci_GroupId ON cci_GroupId.[EntityId] = cci.[Id] AND cci_GroupId.[AttributeId] = 16514
WHERE
    cci.[ContentChannelId] = 351
    AND
    cci.[StartDateTime] = (
        SELECT MAX(inner_cci.[StartDateTime])
        FROM [ContentChannelItem] inner_cci
            LEFT JOIN [AttributeValue] inner_cci_GroupId ON inner_cci_GroupId.[EntityId] = inner_cci.[Id] AND inner_cci_GroupId.[AttributeId] = 16514
        WHERE
            inner_cci_GroupId.[Value] = cci_GroupId.[Value]
            AND
            inner_cci.[ContentChannelId] = 351
        )
;

SELECT
    pa2.[PersonId] AS 'Id' --CoachPersonId
FROM
    @MostRecentCoachCheckinForm CoachCheckinForm
    LEFT JOIN [Group] g ON g.[Id] = CoachCheckinForm.[GroupId]
    LEFT JOIN [TaggedItem] ti ON ti.[EntityGuid] = g.[Guid] AND ti.[EntityTypeId] = 16 AND ti.[TagId] = 20
    LEFT JOIN [AttributeValue] AS av_GroupCoach ON av_GroupCoach.[EntityId] = g.[Id] AND av_GroupCoach.[AttributeId] = 8975 --Coach
    LEFT JOIN [PersonAlias] pa2 ON pa2.[Guid] = TRY_CAST(av_GroupCoach.[Value] AS uniqueidentifier)
WHERE
    g.[IsActive] = 1 AND g.[IsArchived] = 0
    AND
    ti.[TagId] = 20
    AND
    CoachCheckinForm.[FormSubmissionDateTime] <= @OneMonthAgo
ORDER BY
    CoachCheckinForm.[FormSubmissionDateTime] DESC
;