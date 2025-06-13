# LifeGroupMembers - FromDataView_1052
This is a DataView that shows the Person records that:
- are associated with a [GroupMember] that is in a [Group] that is listed under DataViewId:1052 (regardless of whether they are a Leader or not)
- are not Tagged as a 'Test' person, or any other Tag that is designed to be excluded from these reports

Dev Note:
- DataViewId_1054 counts every [Person] who is associated with a [GroupMember] who [IsLeader] in a [Group] that's tagged as a "LifeGroup"
- IF the Groups Team want this DataView to count everybody who is NOT a LifeGroupLeader; THEN uncomment lines 58 and 59
- IF the Groups Team want this DataView to count everybody, regardless of being a LifeGroupLeader or not; THEN leave lines 58 and 59 commented-out

Note:
- It's possible that the SQL results will not be an exact match with the results in the DataView.
- That's because the DataView has extra logic that SparkDev hardcoded (such as filtering out inactive Person records).

This DataView is currently used as the source for MetricId:99