# Retrieve Schedules corresponding to GroupLocationScheduleConfig that still have AvailableSlots

This is very niche, but when we configured a Workflow Form that would replace the **Sign-Up Entry** Block, we needed to be able to show a multi-select Field that displays "timeslots" that still have empty spots for volunteer sign-up.

This is the Lava/SQL that we used in the multi-select Field in order to populate those key^value pairs.