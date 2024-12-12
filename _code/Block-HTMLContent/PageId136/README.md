# Workflow Configuration
This is one of Rock's default pages. It's also one of the pages that i visit most frequently and regularly. As such, i added a few QOL improvements for the sake of making my job a bit easier.
1. A PageParameterFilter Block that allows me to easily find a WorkflowType either by name or id
2. An HTMLContent Block that shows me a list of all the places that are referencing the current WorkflowType
3. An HTMLContent Block that injects a table of `Attribute_Id`, `Attribute_Key`, and `Attribute_FieldType_Name` for the sake of quick reference.

## 2. WorkflowType Info
Admin Tools > [General Settings](https://rock.vrl.church/admin/general) > [Workflow Configuration](https://rock.vrl.church/admin/general/workflows), the 'Main' Zone has an **HTML Content** Block titled, 'Workflowtype Info'.

i forget exactly where i got the Lava for this, but i know i didn't come up with it.
(This [Find Where Workflows Are Being Used](https://community.rockrms.com/recipes/401/find-where-workflows-are-being-used) is a recipe of the same idea, but different execution)

It uses the [{% sql %}](https://community.rockrms.com/lava/commands/sql-commands) command in order to query all the Pages, ConnectionRequests, and Registrations that could be referencing this particular Workflow Type, and shows them in a list of href elements. Pretty nifty.

## 3. WorkflowType Attributes
i got this Lava from [Recipe 203](https://community.rockrms.com/recipes/203/view-workflow-attributes-without-editing-workflow) from the RockCommunity, which was authored by Kevin Rutledge in 2020