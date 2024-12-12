# WorkflowType Info

Admin Tools > [General Settings](https://rock.vrl.church/admin/general) > [Workflow Configuration](https://rock.vrl.church/admin/general/workflows), the 'Main' Zone has an **HTML Content** Block titled, 'Workflowtype Info'.

i forget exactly where i got the Lava for this, but i know i didn't come up with it.
(This [Find Where Workflows Are Being Used](https://community.rockrms.com/recipes/401/find-where-workflows-are-being-used) is a recipe of the same idea, but different execution)

It uses the [{% sql %}](https://community.rockrms.com/lava/commands/sql-commands) command in order to query all the Pages, ConnectionRequests, and Registrations that could be referencing this particular Workflow Type, and shows them in a list of href elements. Pretty nifty.