# WorkflowTypeId 367
## PageParameterFilter for PageId16918

This WorkflowType is intended to be used in [Audit Check-in for KidsCamp](../../Block-HTMLContent/PageId_16918/README.md).
(Please note that there is some JavaScript that "moves" this Block to be "inside" another section, for the sake of visual clarity)

This WorkflowType serves a Form that asks EndUser to input a Kid's PersonId. From there, we query the Adults in the Kid's family, and any KnownRelationships for "can check-in" in order to return a Table that shows every Person who is able to check-in the selected Kid.

The Lava that i am backing-up in this directory is specifically the Lava/HTML that shows the final Table to the EndUser.
This Lava/HTML is found inside the "Show the Results** ActionType, which is inside the "Page 2" ActivityType.