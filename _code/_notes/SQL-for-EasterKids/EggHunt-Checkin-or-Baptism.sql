DECLARE @PersonsFromEggHunt TABLE(
    [PersonId] int NOT NULL
);

DECLARE @PersonsFromKidsCheckin TABLE(
    [PersonId] int NOT NULL
);

DECLARE @PersonsFromBaptism TABLE(
    [PersonId] int NOT NULL
);

INSERT INTO @PersonsFromEggHunt ([PersonId])
SELECT
    gm.[PersonId]
FROM
    [GroupMember] gm
WHERE
    gm.[GroupId] IN (131413)
;


INSERT INTO @PersonsFromKidsCheckin ([PersonId])
SELECT
    pa.[PersonId]
FROM
    [Attendance] att
    INNER JOIN [PersonAlias] pa ON pa.[Id] = att.[PersonAliasId]
WHERE
    att.[DidAttend] = 1
    AND
    att.[IsFirstTIme] = 1
    AND
    att.[OccurrenceId] IN (SELECT ao.[Id] FROM [AttendanceOccurrence] ao WHERE ao.[ScheduleId] IN (5363, 5364, 5365, 5368, 5369, 5366, 5367, 5362)) --These are Barker
    -- AND att.[OccurrenceId] IN (SELECT ao.[Id] FROM [AttendanceOccurrence] ao WHERE ao.[ScheduleId] IN (5370, 5372, 5371)) --These are Riverside
;

INSERT INTO @PersonsFromBaptism ([PersonId])
SELECT
    p.[Id]
FROM
    [ConnectionRequest] connreq
    INNER JOIN [PersonAlias] pa ON pa.[Id] = connreq.[PersonAliasId]
    INNER JOIN [Person] p ON p.[Id] = pa.[PersonId]
WHERE
    connreq.[ConnectionOpportunityId] = 110
    AND
    connreq.[CreatedDateTime] >= '2025-04-17'
    AND
    p.[CreatedDateTime] >= '2025-04-17'
    AND
    p.[CreatedDateTime] <= '2025-04-20'
;

SELECT
    COUNT(*)
FROM
    [Person] p
WHERE 
    p.[Id] IN (SELECT [PersonId] FROM @PersonsFromEggHunt)
    OR
    p.[Id] IN (SELECT [PersonId] FROM @PersonsFromKidsCheckin)
    OR
    p.[Id] IN (SELECT [PersonId] FROM @PersonsFromBaptism)
;