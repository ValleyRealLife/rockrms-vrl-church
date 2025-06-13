# LifeGroupLeaders - FromDataView_1052
This is a DataView that shows the Person records that:
- are associated with a [GroupMember] that [IsLeader] in a [Group] that is listed under DataViewId:1052
- are not Tagged as a 'Test' person, or any other Tag that is designed to be excluded from these reports

Note:
- It's possible that the SQL results will not be an exact match with the results in the DataView.
- That's because the DataView has extra logic that SparkDev hardcoded (such as filtering out inactive Person records).

This DataView is currently used as the source for MetricId:99