# Person Profile (PageId=93)
I am creating this directory because I think it's likely for us to add/remove more *HTML Content* Blocks to this page for specific needs.
## QuickView of Person Details
### Context
This *HTML Content* Block was born of a very niche need.  
During a meeting of AdministrativeAssistants, it was brought to my attention that some admins (who have smaller screens) find the "new" layout of the Rock Person Profile to be time-consuming and annoying because they need to scroll down in order to see Person Details and Family Details. (In our current Rock version, these details are laid out vertically on the left-side of the page lay out. It sounds like the previous version of Rock had these details available horizontally, therefore not needing to scroll down)  
It's worth noting that this is not a problem for staff members to whom we have assigned a screen with a higher resolution.

### Solution
Whether this be permanent or temporary, the quickest solution was to include an *HTML Content* Block in the Person Profile page, have some lava that checks whether this is relevant to the CurrentPerson or not, and conditionally show the details.  
I am controlling this condition through the SecurityRole labeled, 'Administrative Assistant', which is GroupId=119108