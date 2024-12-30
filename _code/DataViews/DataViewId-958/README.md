# LG Coaches with overdue LG Leader Check-in
This is a DataView that shows the Person records that are:
1. Coach of a Life Group
   - a Group that is Tagged with TagId = 20
   - a Group that isActive=1
   - a Group that isArchied=0
2. That Life Group's most recent Check-in was 30 days (or more) ago.

This might change in the future, but right now i'm only using this DataView ([quicklink](https://rock.vrl.church/reporting/dataviews?DataViewId=958)) in order to send use [SystemJobId:209](https://rock.vrl.church/admin/system/jobs/209) in order to send [SystemCommunicationId:77](https://rock.vrl.church/Communications/System/77) every 1st and 15th of the month.