# DataView Id 962
## Audit - RoomReservation 25 days
This is a DataView that shows the rows in [_com_bemaservices_RoomManagement_Reservation] that:
1. Have been created 25 days (or more) ago,
2. (ReservationType is "Placeholder") OR (ReservationType is not "Placeholder", but the ApprovalState is not "Approved")

This might change in the future, but right now i'm only using this DataView ([quicklink](https://rock.vrl.church/reporting/dataviews?DataViewId=962)) in [SystemJobId:210](https://rock.vrl.church/admin/system/jobs/210) in order to send a warning email to [RoomManagement_Reservation].[AdministrativeContactEmaill] that contains a CTA button linking them to [Drafts and Placeholders](https://rock.vrl.church/page/7109)

## Useful references
1. [WorkflowTypeId 323](../../WorkflowTypes/WorkflowTypeId_323/README.md)