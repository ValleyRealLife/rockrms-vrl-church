# The 'PersonMatch' script
Sometimes, the execution of a Workflow requires a Person object.

There are various ways of ensuring that the execution of a Workflow will be supplied its necessary Person object.

Sometimes, the Workflow will be a front-facing Form where the user may or may not be logged in.

For situations where the user is not logged in, we could potentially use the 'Person Attribute From Fields' WorkflowAction. However, in our experience, this WorkflowAction has two downsides:
1. It is prone to creating duplicates (especially if the matched Person has a 'High' Security Protection Profile)
2. It is confined to what the Rock Developers have allowed us to configure.

Therefore, I wrote a Lava script that takes advantage of the `{% sql %}` command in order to do our own PersonMatch.

# Necessary Lava Commands
[ ] All  
[ ] Cache  
[ ] Calendar Events  
[ ] Event Scheduled Instance  
[ ] Execute  
[ ] Interaction Content Channel Item Write  
[ ] Interaction Write  
[ ] Rock Entity  
[ ] Search  
[x] Sql  
[ ] Web Request  
[ ] Workflow Activate  