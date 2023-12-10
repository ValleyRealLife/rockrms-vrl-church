# rock-vrl-church
Tim created this repository in order to contain all the things about VRL's Rock implementation that could be shared externally and collaborated on.

# Things that are helpful to the internal Rock Admin
1. [Button that navigates to the editor of the Current Page](./Button-GoToCurrentPageEditor/)
   - I got this from Drew Young, and then I added `target="_blank"`
1. [HTML for Forms](./Format-FormFields/)
   - [When I want to hide the Attriute Name, and use the Pre-HTML as the Field Label](./Format-FormFields/FormFields-Label.md)
   - [When I want to put two Attributes next to each other](./Format-FormFields/FormFields-SideToSide.md)
1. [Hide Certain Blocks from my Internal Rock users](./Format-HideBlock/)
1. [Lava that converts from Matrix to JSON](./Lava-FromMatrix-toJSON/)
   - This is what we intuitively thought Matrices would work like
1. [Lava that refreshes currentPage using JavaScript](./Lava-JS-RefreshCurrentPage/)
   - This one is janky
1. [LavaToPDF (reference)](./Workflow-LavaToPDF/)
1. [ShortCode that replicates a Workflow as a PDF](./ShortCode-ReplicateWorkflowAsForm/)
1. [Two ways to add IFTHEN to SQL in Rock](./SQL-IFTHEN/)
1. [Workflow Action that matches Person](./Workflow-PersonMatch/)
    - I was proud of this when I wrote it, but now I realize this is dangerous

# Things that are helpful to my Internal Rock users
1. [Badge: Same badge, different colors](./Badge-ExpirationColor/)
   - Rather than using different colors for different badges, we standardized what the colors mean
1. [Dynamic Data (reference)](./DynamicData-PageParam/)
   - DynamicData and PageParam allow me to write SQL in a way that my Internal Rock users can easily swap-in some variables
1. [Lava that improves the PrayerRequestList](./Lava-PrayerRequestList/)

# Some Templates
1. [Email Template for Background Check Consent](./EmailTemplates/Background%20Check%20Consent)
   - This is only necessary because I don't have the new PMM Rock Plugin yet 

<hr>
