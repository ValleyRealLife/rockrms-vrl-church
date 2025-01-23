# DataView Id 964
## Audit - RoomReservation 30 days
This is a DataView that shows the rows in [_com_bemaservices_RoomManagement_Reservation] that:
1. Have been created 30 days (or more) ago,
2. (ReservationType is "Placeholder") OR (ReservationType is not "Placeholder", but the ApprovalState is not "Approved")

This might change in the future, but rght now i'm only using this DataView ([quicklink](https://rock.vrl.church/reporting/dataviews?DataViewId=964)) in [SystemJobId:211](https://rock.vrl.church/admin/system/jobs/211) in order to update the [RoomManagement_Reservation].[ApprovalState] value to `7`

## Useful references
1. [WorkflowTypeId 324](../../WorkflowTypes/WorkflowTypeId_324/README.md)