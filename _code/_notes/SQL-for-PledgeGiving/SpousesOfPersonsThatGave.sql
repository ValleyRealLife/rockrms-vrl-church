/********************************************************************************************************************************************
    
    DECLARE some variables up top.
    
********************************************************************************************************************************************/

DECLARE @StartDate date = '12/1/2024'
;
DECLARE @EndDate date = '2/28/2025'
;
DECLARE @SoftCreditAttributeId int = (SELECT TOP 1 [Id] FROM [Attribute] WHERE [EntityTypeId] = 85 AND [Key] LIKE '%SoftCredit%')
;

DECLARE @ExcludedPersonIds TABLE(
    [Id] int NOT NULL
);

DECLARE @CurrentPledges TABLE (
    [GivingLeaderId] int
  , [PledgeTotal] decimal (12,2)
  , [AccountId] int
  , [StartDate] date
  , [EndDate] date
  , [PledgeTypeValueId] int
  , [AgeClassification] tinyint
);

DECLARE @SoftCreditGiving TABLE (
    [GivingLeaderId] int
  , [AccountId] int
  , [GivingTotal] decimal(12,2)
);

DECLARE @PledgeGiving TABLE (
    [GivingLeaderId] int
  , [AccountId] int
  , [GivingTotal] decimal(12,2)
);

/********************************************************************************************************************************************
    
    Populate the TABLE variables.
    
********************************************************************************************************************************************/

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

INSERT INTO @CurrentPledges (
    [GivingLeaderId]
  , [PledgeTotal]
  , [AccountId]
  , [StartDate]
  , [EndDate]
  , [PledgeTypeValueId]
)
SELECT
    CASE WHEN pp.[AgeClassification] = 2 THEN pp.[Id] ELSE pp.[GivingLeaderId] END AS 'GivingLeaderId'
    , SUM(fp.[TotalAmount]) AS 'PledgeTotal'
    , fp.[AccountId]
    , MIN(fp.[StartDate]) AS 'StartDate'
    , MAX(fp.[EndDate]) AS 'EndDate'
    , cdv.[Id] AS 'PledgeTypeValueId'
FROM
    [Person] pp
    INNER JOIN [PersonAlias] pa ON pa.[PersonId] = pp.[Id]
    INNER JOIN [FinancialPledge] fp ON fp.[PersonAliasId] = pa.[Id]
    INNER JOIN [AttributeValue] av ON av.[EntityId] = fp.[Id] AND av.[AttributeId] = 16804
    INNER JOIN [DefinedValue] cdv ON cdv.[Guid] = CAST(av.[Value] AS uniqueidentifier)
WHERE 
    av.[Value] IS NOT NULL        
    AND cdv.[Id] IN (2004, 2005)
    AND fp.[StartDate] >= '11/1/2024'
    AND fp.[AccountId] IN (37,38)
GROUP BY
    CASE WHEN pp.[AgeClassification] = 2 THEN pp.[Id] ELSE pp.[GivingLeaderId] END
  , fp.[AccountId]
  , cdv.[Id]
;


INSERT INTO @SoftCreditGiving (
    [GivingLeaderId]
  , [AccountId]
  , [GivingTotal]
)
SELECT
    scp.[GivingLeaderId]
  , ftd.[AccountId]
  , SUM(ftd.[Amount])
FROM
    [FinancialTransactionDetail] ftd
    INNER JOIN [FinancialTransaction] ft ON ft.[Id] = ftd.[TransactionId]
    INNER JOIN [AttributeValue] scav ON scav.[EntityId] = ftd.[Id] AND scav.[AttributeId] = @SoftCreditAttributeId
    INNER JOIN [Person] scp ON scp.[Id] = scav.[ValueAsPersonId]
    LEFT JOIN @CurrentPledges cp ON cp.[GivingLeaderId] = scp.[GivingLeaderId] 
        AND cp.[AccountId] = ftd.[AccountId] 
        AND ft.[TransactionDateTime] >= cp.[StartDate]
        AND ft.[TransactionDateTime] <= cp.[EndDate]
WHERE
    ftd.[AccountId] IN (37,38)
    AND ft.[TransactionDateTime] BETWEEN @StartDate and @EndDate
GROUP BY
    scp.[GivingLeaderId]
  , ftd.[AccountId]
;


INSERT INTO @PledgeGiving (
    [GivingLeaderId]
  , [AccountId]
  , [GivingTotal]
)
SELECT
    CASE WHEN p.[AgeClassification] = 2 THEN p.[Id] ELSE p.[GivingLeaderId] END
  , ftd.[AccountId]
  , SUM(ftd.[Amount])
FROM
    [FinancialTransactionDetail] ftd
    INNER JOIN [FinancialTransaction] ft ON ft.[Id] = ftd.[TransactionId]
    INNER JOIN [PersonAlias] pa ON pa.[Id] = ft.[AuthorizedPersonAliasId]
    INNER JOIN [Person] p ON p.[Id] = pa.[PersonId]
WHERE
    ftd.[AccountId] IN (37,38)
    AND ft.[TransactionDateTime] BETWEEN @StartDate AND @EndDate
GROUP BY
    CASE WHEN p.[AgeClassification] = 2 THEN p.[Id] ELSE p.[GivingLeaderId] END
  , ftd.[AccountId]
;

/********************************************************************************************************************************************
    
    Now we get to the point.
    
********************************************************************************************************************************************/

SELECT
    p.[Id], p.[RecordTypeValueId], p.[RecordStatusValueId], p.[FirstName], p.[NickName], p.[LastName], p.[Age], p.[MaritalStatusValueId], p.[IsEmailActive], p.[PrimaryFamilyId], p.[GivingLeaderId]
FROM
    [Person] p
    LEFT JOIN [Person] spouse ON spouse.[PrimaryFamilyId] = p.[PrimaryFamilyId]
        AND spouse.[Id] <> p.[Id]
        AND spouse.[MaritalStatusValueId] = 143 --Married
        AND p.[MaritalStatusValueId] = 143 --Married
        AND spouse.[AgeClassification] <> 2
WHERE
    spouse.[Id] NOT IN (SELECT [Id] FROM @ExcludedPersonIds)
    AND
    spouse.[RecordTypeValueId] = 1
    AND
    (
    spouse.[Id] IN (SELECT [GivingLeaderId] FROM @SoftCreditGiving)
    OR
    spouse.[Id] IN (SELECT [GivingLeaderId] FROM @PledgeGiving)
    )
ORDER BY
    p.[LastName] ASC
;