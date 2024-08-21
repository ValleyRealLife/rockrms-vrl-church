# Report LavaColumn | DNA Attendance Date

This ShortCode was created because we wanted to add the 'DNA Attendance Date' column to a Report.

This required the use of a Lava Column.

Normally, lookups like these could be done via Entity Commands, however, because of the relationship between [Steps] and [Person] is through [PersonAlias], and because a [Person].[PrimaryAlias] does not always coincide, it was more reliable to write the lookup using SQL.

This means that the Lava would need to use a `{% sql %}` commmand.

However, when writing the Lava into the Report's Lava column, the output says that the 'sql' command is not enabled in this context.

i did not know how to enable the 'sql' command only in the context of Reports, and i did not want to enable it globally.

Therefore, in order to enable the 'sql' command to the execution of this particular Lava snippet, i chose to create it as a Short Code.

## Short Code Details
**Parameters**
| Key       | Value   |
|-----------|---------|
| person_id | (blank) |
|           |         |

**Enabled Lava Commands**
| Checkbox | Thing                                  |
|----------|----------------------------------------|
|          | All                                    |
|          | Cache                                  |
|          | Calendar Events                        |
|          | Event Scheduled Instance               |
|          | Execute                                |
|          | Interaction Content Channel Item Write |
|          | Interaction Write                      |
|          | Rock Entity                            |
|          | Search                                 |
| true     | Sql                                    |
|          | Web Request                            |
|          | Workflow Activate                      |
|          |                                        |