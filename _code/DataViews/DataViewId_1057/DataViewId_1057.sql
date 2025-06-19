/**************************************************************************************************************
    
    This SQL is found in DataViewId:1057
    Currently, this DataView is named: Persons whose GradeLevel is blank and must become Kindergarten
    
    Note:
    - It's possible that the SQL results will not be an exact match with the results in the DataView.
    - That's because the DataView has extra logic that SparkDev hardcoded (such as filtering out inactive Person records).
    
    Path:
    _code/DataViews/DataViewId_1057/DataViewId_1057.sql
    
**************************************************************************************************************/

-- Set cutoff date: Include children who turn 5 on or before this date
DECLARE @CutoffMonth int = 8;  -- August
DECLARE @CutoffDay int = 1;    -- 1st day of the month

-- You can ignore everything under this comment

/**********
    Query strategy:
    1. From [AttendanceOccurrence], return all rows the OccurrenceDate was in the current year.
    2. Get all the [Attendance] rows corresponding to Persons who checked into the '4 Year Olds' Group or the '5 Year Olds' Group in that range of OccurrenceDates.
    3. Store all the [Person] records corresponding to those [Attendance] rows.
    4. Store all the [Person] records corresponding to the Persons whose age is currently 5 or will become 5 by @CutoffMonth and @CutoffDay
    5. SELECT all [Persons] whose [Id] was in both of those result sets.
**********/

/********************************************************************************************************************************************
    
    DECLARE some variables up top.
    
********************************************************************************************************************************************/
DECLARE @AttOccs TABLE (
    [Id] int NOT NULL
);

DECLARE @ExcludedPersonIds TABLE (
    [Id] int NOT NULL
);

DECLARE @PersonsAgeFourFive TABLE (
    [Id] int NOT NULL
);

DECLARE @PersonsWhoCheckedIntoFourFive TABLE (
    [Id] int NOT NULL
);

/********************************************************************************************************************************************
    
    Populate the TABLE variables.
    
********************************************************************************************************************************************/
INSERT INTO @AttOccs ([Id])
SELECT
    [Id]
FROM
    [AttendanceOccurrence]
WHERE
    [GroupId] IN (82356, 82357) --'82356' is "4 Year Olds" and '82357' is "5 Year Olds"
    AND
    YEAR([OccurrenceDate]) = YEAR(GETDATE())
;

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

INSERT INTO @PersonsAgeFourFive ([Id])
SELECT
    p.[Id]
FROM
    [Person] p
WHERE
    p.[Id] NOT IN (SELECT [Id] FROM @ExcludedPersonIds)
    AND (
        p.[Age] = 5
        OR (
            p.[Age] = 4 
            AND p.[BirthMonth] <= @CutoffMonth 
            AND (p.[BirthMonth] < @CutoffMonth OR p.[BirthDay] <= @CutoffDay)
        )
    )
    AND p.[AgeClassification] <> 1 --Hardcoded Values: '0' is "Unknown", '1' is "Adult", '2' is "Child"
    AND p.[GraduationYear] IS NULL
;

INSERT INTO @PersonsWhoCheckedIntoFourFive ([Id])
SELECT
    pa0.[PersonId]
FROM
    [Attendance] att
    INNER JOIN [PersonAlias] pa0 ON pa0.[Id] = att.[PersonAliasId]
WHERE
    pa0.[PersonId] NOT IN (SELECT [Id] FROM @ExcludedPersonIds)
    AND
    att.[OccurrenceId] IN (SELECT [Id] FROM @AttOccs)
;

/********************************************************************************************************************************************
    
    Now we get to the point.
    
********************************************************************************************************************************************/
SELECT
    [Id]
FROM
    [Person]
WHERE
    [Id] IN (SELECT [Id] FROM @PersonsAgeFourFive)
    AND
    [Id] IN (SELECT [Id] FROM @PersonsWhoCheckedIntoFourFive)
;