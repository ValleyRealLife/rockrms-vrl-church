# Persons whose GradeLevel is blank and must become Kindergarten
This is a DataView that shows the Person records that:
- are associated with an [Attendance] that is in '4 Year Olds' or '5 Year Olds'
- are currently 5 years old or will become 5 years old by the CutoffDate (Currently set to Aug 1)
- are not Tagged as a 'Test' person, or any other Tag that is designed to be excluded from these reports

Note:
- It's possible that the SQL results will not be an exact match with the results in the DataView.
- That's because the DataView has extra logic that SparkDev hardcoded (such as filtering out inactive Person records).

This DataView is currently used as the source for WorkflowTypeId:365