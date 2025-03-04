/****************************************************************************************
    
    This SQL is found in DataViewId:964
    Currently, this DataView is named "Audit - RoomReservation 30 days"
    
    References:
    - This DataView is used in ServiceJobId:211
    
    Path:
    _code/DataViews/DataViewId_964/DataViewId_964.sql
    
****************************************************************************************/

SELECT
    res.[Id]
FROM
    [_com_bemaservices_RoomManagement_Reservation] res
WHERE
    res.[CreatedDateTime] <= DATEADD(DAY, -30, GETDATE())
    AND
    (
        (res.[ReservationTypeId] <> 6 AND res.[ApprovalState] IN (0, 1, 6))
        OR
        (res.[ReservationTypeId] = 6 AND res.[ApprovalState] IN (0, 7))
    )
ORDER BY
    res.[CreatedDateTime] ASC
;