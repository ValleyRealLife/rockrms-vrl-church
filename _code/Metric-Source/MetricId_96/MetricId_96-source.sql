/**************************************************************************************************************
    
    This SQL is the source for MetricId:96
    Currently, this Metric is named: 01--AverageAttendance
    
    Path:
    _code/Metric-Source/MetricId_96/MetricId_96-source.sql
    
**************************************************************************************************************/

DECLARE @MetricValues_PreviousMonth TABLE (
    [MetricValueDateTime] date NOT NULL
  , [MetricValueDateKey] nvarchar(250) NOT NULL
  , [TotalYValue] int NOT NULL
);

INSERT INTO @MetricValues_PreviousMonth ([MetricValueDateTime], [MetricValueDateKey], [TotalYValue])
SELECT
    metval.[MetricValueDateTime]
  , metval.[MetricValueDateKey]
  , SUM(metval.[YValue]) AS 'TotalYValue'
FROM
    [MetricValue] metval
WHERE
    metval.[MetricId] = 2
    AND
    metval.[MetricValueType] = 0 --These are hardcoded by SparkDev. '0' is "Measure" and '1' is "Goal"
    AND
    YEAR(metval.[MetricValueDateTime]) = YEAR(DATEADD(MONTH, -1, GETDATE()))
    AND
    MONTH(metval.[MetricValueDateTime]) = MONTH(DATEADD(MONTH, -1, GETDATE()))
GROUP BY
    metval.[MetricValueDateTime]
  , metval.[MetricValueDateKey]
ORDER BY
    metval.[MetricValueDateKey]
;

SELECT
    AVG([TotalYValue])
FROM
    @MetricValues_PreviousMonth
;