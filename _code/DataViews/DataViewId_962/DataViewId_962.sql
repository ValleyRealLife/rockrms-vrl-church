/****************************************************************************************
    
    This SQL is found in DataViewId:962
    Currently, this DataView is named "Audit - RoomReservation 25 days"
    
    References:
    - This DataView is used in ServiceJobId:210
    
    Path:
    _code/DataViews/DataViewId_962/DataViewId_962.sql
    
****************************************************************************************/

SELECT
    res.[Id]
FROM
    [_com_bemaservices_RoomManagement_Reservation] res
WHERE
    res.[CreatedDateTime] <= DATEADD(DAY, -25, GETDATE())
    AND
    (
        (res.[ReservationTypeId] <> 6 AND res.[ApprovalState] IN (0, 1, 6))
        OR
        (res.[ReservationTypeId] = 6 AND res.[ApprovalState] IN (0, 7))
    )
ORDER BY
    res.[CreatedDateTime] ASC
;