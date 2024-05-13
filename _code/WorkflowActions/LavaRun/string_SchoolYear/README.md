# The 'SchoolYear' String
Our Kids Camp and Students Camp Registrations rely on separating each kid/student by their GradeLevel.

Rock stores this information in the `GraduationYear` Property of the 'Person' Table.

Most parents don't know their child's Graduation Year off the top of their head; therefore, we want to show the question as "What grade was your child in this school year?"

To make the verbiage on these forms even more explicit, we want to show the question as "What grade was your child in the xxxx-xxxx school year?"

And in order to future-proof these forms, and not need to update the verbiage year-after-year, we want to dynamically generate the 'SchoolYear' string.

Please note that the Kids Camp shows a future SchoolYear (because they ask which grade level the child is going into), whereas the Student Camp shows a previous SchoolYear (because they ask which grade level the child just came out of).