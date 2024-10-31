# Persons By Home Address
Querying Persons by their Home Address is a bit tricky, filtering them by their ZipCode is a little bit extra tricky.

On top of those obstacles, the Groups Team also wanted to answer the question, "of the people living in xyz zip codes, which of them are members of which life groups?"

i had to do some tricks in order to overcome these tricky obstacles.

PageId 1798 has a PageParameterFilter Block with a multi-select attribute that i named `ZipCode`, and it has a DynamicData block that has some SQL joins that take into consideration the `ZipCode` if it's not null and not blank.