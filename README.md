# rock-vrl-church
Tim created this repository in order to contain all the things about VRL's Rock implementation that could be shared externally and collaborated on.

I like the idea of [CodeTour](https://code.visualstudio.com/learn/educators/codetour), this is a VSC Extension that will allow the code author give you a "tour" of their code. Essentially, it's like adding comments to your code, but differently. I will try to get in the habit of creating CodeTours for codes that could be confusing without context/explanation. ([VSC Marketplace: CodeTour Extension](https://marketplace.visualstudio.com/items?itemName=vsls-contrib.codetour))

# Things that are helpful to the internal Rock Admin
1. [Button that navigates to the editor of the Current Page](./_code/Button-GoToCurrentPageEditor/)
   - I got this from Drew Young, and then I added `target="_blank"`
1. [HTML for Forms](./_code/Format-FormFields/)
   - [When I want to hide the Attriute Name, and use the Pre-HTML as the Field Label](./_code/Format-FormFields/FormFields-Label.md)
   - [When I want to put two Attributes next to each other](./_code/Format-FormFields/FormFields-SideToSide.md)
1. [Hide Certain Blocks from my Internal Rock users](./_code/Format-HideBlock/)
1. [Lava that converts from Matrix to JSON](./_code/Lava-FromMatrix-toJSON/)
   - This is what we intuitively thought Matrices would work like
1. [Lava that refreshes currentPage using JavaScript](./_code/Lava-JS-RefreshCurrentPage/)
   - This one is janky
1. [LavaToPDF (reference)](./_code/Workflow-LavaToPDF/)
1. [ShortCode that replicates a Workflow as a PDF](./_code/ShortCode-ReplicateWorkflowAsForm/)
1. [Two ways to add IFTHEN to SQL in Rock](./_code/ShortCode-SQL-IFTHEN/)
1. [Workflow Action that matches Person](./_code/Workflow-PersonMatch/)
    - I was proud of this when I wrote it, but now I realize this is dangerous

# Things that are helpful to my Internal Rock users
1. [Badge: Same badge, different colors](./_code/Badge-ExpirationColor/)
   - Rather than using different colors for different badges, we standardized what the colors mean
1. [Dynamic Data (reference)](./_code/DynamicData-PageParam/)
   - DynamicData and PageParam allow me to write SQL in a way that my Internal Rock users can easily swap-in some variables
1. [Lava that improves the PrayerRequestList](./_code/Lava-PrayerRequestList/)

# Some Templates
1. [Email Template for Background Check Consent](./_code/EmailTemplates/Background%20Check%20Consent)
   - This is only necessary because I don't have the new PMM Rock Plugin yet
1. [Email Template for notifying LG Leaders that they have a new Pending GroupMember](./_code/EmailTemplates/Pending%20Group%20Members%20Notification.lava)
   - i created this in order to keep version control over how our Email Template is different from Core Rock's template.

<hr>
