# WorkflowTypes
i'm creating this Directory because i think it might make more sense to store my code in file-per-WorkflowActionTypes, grouped by WorkflowTypes.

In other words, if WorkflowTypeId=111 has 15 WorkflowActions, and
- 3 of them are WorkflowActionType **Run Lava**,
- 2 of them are WorkflowActionType **Send Email**, and
- 1 of them is WorkflowActionType **Form** which contains a chunk of Lava in the Pre-Form HTML;
Then this Directory would have a folder titled "WorkflowTypeId_111", and that folder would have 6 files.

it's also worth noting that i'm not deleting/reworking the [WorkflowActions](../WorkflowActions/) Directory yet because i'm not certain which structure will be more helpful/efficient/sensible going forward. i still think it's likely that i could keep both.