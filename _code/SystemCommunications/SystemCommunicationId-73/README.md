# Confirmation Email for Christmas Volunteer Signup
i didn't know of a native way to send a ConfirmationEmail to the `Requester` of a ConnectionRequest upon creation.

Therefore, i configured a WorkflowType that would send the ConfirmationEmail, and linked that WorkflowType to the "Request Started" trigger at the ConnectionType-level.

Now, this is the intended flow:
1. [This externalPage](#) contains a **ConnectionOpportunitySignup** Block,
2. Submission of that form should create a ConnectionRequest in [this ConnectionOpportunity](#)
3. At the [ConnectionType](#)-level, it's configured such that the creation of a ConnectionRequest should instantiate [this WorkflowType](#)
4. That WorkflowType is set to send [this SystemCommunication](./SystemCommunicationId73-EmailBody.lava) to the `Requester` of the ConnectionRequest.

This Communication will be saved to the Person Profile, under 'History'