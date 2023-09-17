# Hide a Block if Irrelevant

## Drew's idea:
> Imagine we have a Block that shows Person Attributes, call it "Employee Attributes"
> Rather than have this Block show on all Person Profiles, wouldn't it be neat if it only showed in Person Profiles where the Person is an employee?

## Initial Concept:
- The Person Profile page already has `PersonId` as an available Page Parameter
- In the block, check the PersonId, and check whether the Person belongs in a certain Group
- If Person belongs in the group, show; Else, hide.

## Ideas for making it better:
- Right now, this is just using some HTML for `<style>` and Lava for the logic. It would be better if I could use `<script>` to control the `$("#some-custom-id").css("display", "none");`