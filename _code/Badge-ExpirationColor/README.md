# Lava Badges
- [Lava Badges](#lava-badges)
  - [About](#about)
  - [Index](#index)

## About
Currently, most of the Badges in our Rock instance are for the [Person] Entity. Therefore, the 'Type' column in the <a href="https://rock.vrl.church/admin/general/badges">Badge List</a> will say "Person". i only make note of this because i foresee VRL might find it useful to create some badges for the [Group] and [GroupMember] Entities too.

The [idea.lava](./idea.lava) is where i keep a general idea of a template, which is to standardize the colors to mean something: 'Gray' means requirements are blank, 'Red' means requirements failed, 'Green' means requirements succeeded, and 'Orange' means requirements were once successful but are now outdated.

## Index
That being said, here's a description of the Lava Badges that i created or modified thus far:
| Badge Name | Lava File | Description |
|---|---|---|
| Background Check | [ badge-backgroundcheck.lava ]( ./badge-backgroundcheck.lava ) | Shows whether the person has passed a Background Check |
| Cat Course | [ badge-cat.lava ]( ./badge-cat.lava ) | Shows whether the person has taken the Child Abuse Training course |
| DNA | [ badge-DNAcourse.lava ]( ./badge-DNAcourse.lava ) | Shows whether the person has taken the DNA course or the DNA Refresher course. |
| RDT | [ badge-rdt.lava ]( ./badge-rdt.lava ) | Shows whether the person has taken the Real Discipleship Training class. |
| Family Commitment | [ badge-FamilyCommitmentSigned.lava ]( ./badge-FamilyCommitmentSigned.lava ) | Shows whether the person has signed the Family Commitment Form. |
| ~~VRL Membership~~ | [badge-VRLmembership.lava](./badge-VRLmembership.lava) | ~~Shows whether the person has signed the Family Commitment Form provided to them at the end of the DNA Course.~~ |