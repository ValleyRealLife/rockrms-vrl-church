/****************************************************************************************
    
    This SQL is found in DataViewId:962
    Currently, this DataView is named "Audit - RoomReservation 25 days"
    
    References:
    - This DataView is used in ServiceJobId:210
    
    Note:
    The intention of this query is to identify all Placeholders that have been created 30 days ago (or older).
    ServiceJobId=211 will "remove" theese rows. (I wrote "remove" in quotations because we're not deleting those rows, we're just setting [ApprovalState] to "Cancelled")
    
    Path:
    _code/DataViews/DataViewId_962/DataViewId_962.sql
    
****************************************************************************************/

/**********
    Query strategy:
    1. From [_com_bemaservices_RoomManagement_Reservation], return all rows that have a future Ocurrence (in other words, it has not happened yet)
    2. From [_com_bemaservices_RoomManagement_Reservation], return all rows that have a ReservationType="PlaceHholder" and have been created 30 days ago (or older)
    3. SELECT rows that match both criteria
**********/

--Declare some TABLE variables
DECLARE @FutureRoomReservation TABLE (
    [Id] int NOT NULL
);

DECLARE @PlaceholderReservations TABLE (
    [Id] int NOT NULL
);

--Populate the TABLE variables
INSERT INTO @FutureRoomReservation ([Id])
SELECT
    [Id]
FROM
    [_com_bemaservices_RoomManagement_Reservation]
WHERE
    [FirstOccurrenceStartDateTime] > GETDATE()
    OR
    [LastOccurrenceEndDateTime] > GETDATE()
ORDER BY
    [CreatedDateTime] ASC
;

INSERT INTO @PlaceholderReservations ([Id])
SELECT
    [Id]
FROM
    [_com_bemaservices_RoomManagement_Reservation]
WHERE
    [CreatedDateTime] <= DATEADD(DAY, -30, GETDATE())
    AND
    [ReservationTypeId] = 6 --This means "Placeholder"
    AND
    [ApprovalState] <> 7 --This means "Not cancelled (yet)"
ORDER BY
    [CreatedDateTime] ASC
;

--Do the query for PlaceholderReservations that have not ocurred yet
SELECT
    [Id]
FROM
    [_com_bemaservices_RoomManagement_Reservation] res
WHERE
    res.[Id] IN (SELECT [Id] FROM @PlaceholderReservations)
    AND
    res.[Id] IN (SELECT [Id] FROM @FutureRoomReservation)
;