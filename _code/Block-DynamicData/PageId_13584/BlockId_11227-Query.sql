/********************************************************************************************************************************************
    
    This Lava/SQL is found in
    PageId:13584, BlockId:11227, [Dynamic Data] > Query
    
    This SQL is used in the Dynamic Data block
    
    Path:
    _code/Block-DynamicDataPageId_13584/BlockId_11227-Query.sql
    
********************************************************************************************************************************************/

/**********
    Query strategy:
    1. From [MetricValue], return all rows where [MetricValueDateTime] goes back from today until three MinistryYears back.
    2. For each of these [MetricValue] rows, account for the fact that each [MetricValueDateTime] month corresponds to the metric from the month prior.
    3. For each of these [MetricValue] rows, also concatenate a 'MinistryYear' string by running a simple CASE statement on its month.
    4. Store these [MetricValue] rows in a CTE labeled 'ReportingData'
    5. SELECT from the 'ReportingData' CTE, but pivot on the 'ReportedMonth'
**********/

DECLARE @MetricId_AverageAttendance AS int = 96;
DECLARE @MetricId_HowMany_Adults_in_LifeGroups_All AS int = 97;
DECLARE @MetricId_HowMany_LifeGroups_All AS int = 98;
DECLARE @MetricId_HowMany_LifeGroupLeaders_All AS int = 99;
--DECLARE @MetricId_HowMany_LifeGroupCoaches_All AS int = 100; --Deprecated

/**********
    First Query: Average Attendance
**********/
WITH ReportingData AS (
    SELECT
        FORMAT([YValue], 'N0') AS 'MetricValue'
      , DATENAME(MONTH, DATEADD(MONTH, -1, [MetricValueDateTime])) AS 'ReportedMonth'
      , CONCAT(
            CASE 
                WHEN MONTH([MetricValueDateTime]) >= 10 
                    THEN YEAR([MetricValueDateTime]) 
                ELSE YEAR([MetricValueDateTime]) - 1 
            END
          , '-'
          , CASE 
                WHEN MONTH([MetricValueDateTime]) >= 10 
                    THEN YEAR([MetricValueDateTime]) + 1 
                ELSE YEAR([MetricValueDateTime]) 
            END
            ) AS 'MinistryYear'
    FROM
        [MetricValue]
    WHERE
        [MetricId] = @MetricId_AverageAttendance
        AND
        [MetricValueType] = 0 --These are hardcoded by SparkDev. '0' is "Measure" and '1' is "Goal"
        AND
        [MetricValueDateTime] >= DATEFROMPARTS(
            CASE
                WHEN MONTH(GETDATE()) >= 10
                    THEN YEAR(GETDATE()) - 2
                ELSE YEAR(GETDATE()) - 3
            END
          , 10
          , 1
            )
    )

SELECT
    *
FROM
    ReportingData
PIVOT (
    MAX([MetricValue])
    FOR [ReportedMonth] IN (
        [September], [October], [November], [December], 
        [January], [February], [March], [April], 
        [May], [June], [July], [August]
        )
    ) AS PivotTable
ORDER BY
    [MinistryYear] DESC
;

/**********
    Second Query: Adults in Any Life Group
**********/
WITH ReportingData AS (
    SELECT
        FORMAT([YValue], 'N0') AS 'MetricValue'
      , DATENAME(MONTH, DATEADD(MONTH, -1, [MetricValueDateTime])) AS 'ReportedMonth'
      , CONCAT(
            CASE 
                WHEN MONTH([MetricValueDateTime]) >= 10 
                    THEN YEAR([MetricValueDateTime]) 
                ELSE YEAR([MetricValueDateTime]) - 1 
            END
          , '-'
          , CASE 
                WHEN MONTH([MetricValueDateTime]) >= 10 
                    THEN YEAR([MetricValueDateTime]) + 1 
                ELSE YEAR([MetricValueDateTime]) 
            END
            ) AS 'MinistryYear'
    FROM
        [MetricValue]
    WHERE
        [MetricId] = @MetricId_HowMany_Adults_in_LifeGroups_All
        AND
        [MetricValueType] = 0 --These are hardcoded by SparkDev. '0' is "Measure" and '1' is "Goal"
        AND
        [MetricValueDateTime] >= DATEFROMPARTS(
            CASE
                WHEN MONTH(GETDATE()) >= 10
                    THEN YEAR(GETDATE()) - 2
                ELSE YEAR(GETDATE()) - 3
            END
          , 10
          , 1
            )
    )

SELECT
    *
FROM
    ReportingData
PIVOT (
    MAX([MetricValue])
    FOR [ReportedMonth] IN (
        [September], [October], [November], [December], 
        [January], [February], [March], [April], 
        [May], [June], [July], [August]
        )
    ) AS PivotTable
ORDER BY
    [MinistryYear] DESC
;

/**********
    Third Query: Ratio of Adults in All Groups
**********/
WITH CombinedData AS (
    SELECT
        [MetricId]
      , CAST([YValue] AS FLOAT) AS 'YValue'
      , DATENAME(MONTH, DATEADD(MONTH, -1, [MetricValueDateTime])) AS 'ReportedMonth'
      , CONCAT(
            CASE 
                WHEN MONTH([MetricValueDateTime]) >= 10 
                    THEN YEAR([MetricValueDateTime]) 
                ELSE YEAR([MetricValueDateTime]) - 1 
            END
          , '-'
          , CASE 
                WHEN MONTH([MetricValueDateTime]) >= 10 
                    THEN YEAR([MetricValueDateTime]) + 1 
                ELSE YEAR([MetricValueDateTime]) 
            END
            ) AS 'MinistryYear'
    FROM
        [MetricValue]
    WHERE 
        [MetricId] IN (@MetricId_AverageAttendance, @MetricId_HowMany_Adults_in_LifeGroups_All)
        AND
        [MetricValueDateTime] >= DATEFROMPARTS(
            CASE
                WHEN MONTH(GETDATE()) >= 10
                    THEN YEAR(GETDATE()) - 2
                ELSE YEAR(GETDATE()) - 3
            END
          , 10
          , 1
            )
    ),
Pivoted AS (
    SELECT
        [MinistryYear]
      , [ReportedMonth]
      , MAX(CASE WHEN MetricId = @MetricId_AverageAttendance THEN [YValue] END) AS 'MetricAverageAttendance'
      , MAX(CASE WHEN MetricId = @MetricId_HowMany_Adults_in_LifeGroups_All THEN [YValue] END) AS 'MetricAdultsInLifeGroups'
    FROM
        CombinedData
    GROUP BY
        [MinistryYear]
      , [ReportedMonth]
    ),
RatioData AS (
    SELECT
        [MinistryYear]
      , [ReportedMonth]
      , CASE 
            WHEN [MetricAverageAttendance] IS NULL OR [MetricAdultsInLifeGroups] IS NULL
                THEN NULL
            ELSE FORMAT(([MetricAdultsInLifeGroups] / [MetricAverageAttendance]) * 100, 'N1')
        END AS 'Ratio'
    FROM
        Pivoted
    ),
FinalPivot AS (
    SELECT
        *
    FROM
        RatioData
    PIVOT (
        MAX([Ratio])
        FOR ReportedMonth IN (
            [September], [October], [November], [December], 
            [January], [February], [March], [April], 
            [May], [June], [July], [August]
            )
        ) AS PivotTable
    )

SELECT
    *
FROM
    FinalPivot
ORDER BY
    [MinistryYear] DESC
;


/**********
    Fourth Query: How Many Life Groups
**********/
WITH ReportingData AS (
    SELECT
        FORMAT([YValue], 'N0') AS 'MetricValue'
      , DATENAME(MONTH, DATEADD(MONTH, -1, [MetricValueDateTime])) AS 'ReportedMonth'
      , CONCAT(
            CASE 
                WHEN MONTH([MetricValueDateTime]) >= 10 
                    THEN YEAR([MetricValueDateTime]) 
                ELSE YEAR([MetricValueDateTime]) - 1 
            END
          , '-'
          , CASE 
                WHEN MONTH([MetricValueDateTime]) >= 10 
                    THEN YEAR([MetricValueDateTime]) + 1 
                ELSE YEAR([MetricValueDateTime]) 
            END
            ) AS 'MinistryYear'
    FROM
        [MetricValue]
    WHERE
        [MetricId] = @MetricId_HowMany_LifeGroups_All
        AND
        [MetricValueType] = 0 --These are hardcoded by SparkDev. '0' is "Measure" and '1' is "Goal"
        AND
        [MetricValueDateTime] >= DATEFROMPARTS(
            CASE
                WHEN MONTH(GETDATE()) >= 10
                    THEN YEAR(GETDATE()) - 2
                ELSE YEAR(GETDATE()) - 3
            END
          , 10
          , 1
            )
    )

SELECT
    *
FROM
    ReportingData
PIVOT (
    MAX([MetricValue])
    FOR [ReportedMonth] IN (
        [September], [October], [November], [December], 
        [January], [February], [March], [April], 
        [May], [June], [July], [August]
        )
    ) AS PivotTable
ORDER BY
    [MinistryYear] DESC
;

/**********
    Fifth Query: How Many Life Group Leaders
**********/
WITH ReportingData AS (
    SELECT
        FORMAT([YValue], 'N0') AS 'MetricValue'
      , DATENAME(MONTH, DATEADD(MONTH, -1, [MetricValueDateTime])) AS 'ReportedMonth'
      , CONCAT(
            CASE 
                WHEN MONTH([MetricValueDateTime]) >= 10 
                    THEN YEAR([MetricValueDateTime]) 
                ELSE YEAR([MetricValueDateTime]) - 1 
            END
          , '-'
          , CASE 
                WHEN MONTH([MetricValueDateTime]) >= 10 
                    THEN YEAR([MetricValueDateTime]) + 1 
                ELSE YEAR([MetricValueDateTime]) 
            END
            ) AS 'MinistryYear'
    FROM
        [MetricValue]
    WHERE
        [MetricId] = @MetricId_HowMany_LifeGroupLeaders_All
        AND
        [MetricValueType] = 0 --These are hardcoded by SparkDev. '0' is "Measure" and '1' is "Goal"
        AND
        [MetricValueDateTime] >= DATEFROMPARTS(
            CASE
                WHEN MONTH(GETDATE()) >= 10
                    THEN YEAR(GETDATE()) - 2
                ELSE YEAR(GETDATE()) - 3
            END
          , 10
          , 1
            )
    )

SELECT
    *
FROM
    ReportingData
PIVOT (
    MAX([MetricValue])
    FOR [ReportedMonth] IN (
        [September], [October], [November], [December], 
        [January], [February], [March], [April], 
        [May], [June], [July], [August]
        )
    ) AS PivotTable
ORDER BY
    [MinistryYear] DESC
;

/**********
    Deprecated Query: How Many Life Group Coaches

WITH ReportingData AS (
    SELECT
        FORMAT([YValue], 'N0') AS 'MetricValue'
      , DATENAME(MONTH, DATEADD(MONTH, -1, [MetricValueDateTime])) AS 'ReportedMonth'
      , CONCAT(
            CASE 
                WHEN MONTH([MetricValueDateTime]) >= 10 
                    THEN YEAR([MetricValueDateTime]) 
                ELSE YEAR([MetricValueDateTime]) - 1 
            END
          , '-'
          , CASE 
                WHEN MONTH([MetricValueDateTime]) >= 10 
                    THEN YEAR([MetricValueDateTime]) + 1 
                ELSE YEAR([MetricValueDateTime]) 
            END
            ) AS 'MinistryYear'
    FROM
        [MetricValue]
    WHERE
        [MetricId] = @MetricId_HowMany_LifeGroupCoaches_All
        AND
        [MetricValueType] = 0 --These are hardcoded by SparkDev. '0' is "Measure" and '1' is "Goal"
        AND
        [MetricValueDateTime] >= DATEFROMPARTS(
            CASE
                WHEN MONTH(GETDATE()) >= 10
                    THEN YEAR(GETDATE()) - 2
                ELSE YEAR(GETDATE()) - 3
            END
          , 10
          , 1
            )
    )

SELECT
    *
FROM
    ReportingData
PIVOT (
    MAX([MetricValue])
    FOR [ReportedMonth] IN (
        [September], [October], [November], [December], 
        [January], [February], [March], [April], 
        [May], [June], [July], [August]
        )
    ) AS PivotTable
ORDER BY
    [MinistryYear] DESC
;
**********/