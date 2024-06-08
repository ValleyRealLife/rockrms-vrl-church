# The 'RoundRobin_Connector' Script
Currently, Rock RMS only allows for configuring a Default Connector (individual Person), not Default Connectors (group of possible Persons)

Therefore, we created a WorkflowType that will be configured at the Opportunity-level with the 'Request Started' trigger; such that this WorkflowType will be instantiated each time a new Connection Request is entered into the corresponding Connection Opportunity.

This WorkflowType, at its very simplest form, is using the *Set Connection Request Connector* Action to set some Person as the Connector of the Connection Request in question.

In order to use that WorkflowActionType, we need a Person-type Attribute, an in order to set that AttributeValue to the correct Person, we are using this *Lava Run* Action.

# Necessary Lava Commands
[ ] All  
[ ] Cache  
[ ] Calendar Events  
[ ] Event Scheduled Instance  
[ ] Execute  
[ ] Interaction Content Channel Item Write  
[ ] Interaction Write  
[x] Rock Entity  
[ ] Search  
[ ] Sql  
[ ] Web Request  
[ ] Workflow Activate  