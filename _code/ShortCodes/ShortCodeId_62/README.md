# Health Chart for Camp Nurse
This idea has evolved a lot over the past three years.

Currently, this ShortCode is essentially looping over every Person associated with a Registrant who's registered to a Registration Instance. (Therefore, this ShortCode requires 'reginsid' parameter)

And by looping over every Person, this Short Code uses SQL in order to render the 'Health' Page of the Person Profile for each of those Persons-- all in one page! ([reference](../../Block-HTMLContent/PageId_7392/README.md))