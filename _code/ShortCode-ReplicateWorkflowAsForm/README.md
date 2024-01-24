# Shortcode | Generate a PDF copy of a Workflow Form

When I asked [this question](https://chat.rockrms.com/channel/lava?msg=7btqJnzqeSxMtEeZZ) on the Rock community chat, Kevin Rutledge shared with me ashortcode that creates a PDF by using SQL to identify the WorkflowType, WorkflowActivities, WorkflowAttributes, and WorkflowAttribute Values as needed.

It looked promising so I just copy+pasted it into our Rock Instance. These are the configurations:
| Configuration Setting | Configuration Value |
|-----------------------|---------------------|
| Name                  | (whatever)          |
| Tag Name              | createformlava      |
| Tag Type              | Inline              |
| Shortcode Markup      | [ReplicateWorkflowAsForm-ShortcodeMarkup.lava](../ShortCode-ReplicateWorkflowAsForm/ReplicateWorkflowAsForm-ShortcodeMarkup.lava) |
| Enabled Lava Commands | Sql                 |

These are the Parameters:
| Parameter Key           | Parameter Value |
|-------------------------|-----------------|
| workflowtypeid          | 0               |
| workflowactivitytypeids |                 |