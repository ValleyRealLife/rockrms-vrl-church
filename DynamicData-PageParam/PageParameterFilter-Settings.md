These are the ones that I changed from the default settings:

### Settings:
| Setting                   | Value                                                                    |
|---------------------------|--------------------------------------------------------------------------|
| Block Title Text          | (choose whatever is appropriate)                                         |
| Filter Button Text        | (this one ended up not mattering because of 'Selection Action' later)    |
| Filter Button Size        | (this one ended up not mattering because of 'Section Action' later)      |
| Filters Per Row           | (this one did not matter in this context because I only have one Filter) |
| Show Filter Button        | FALSE                                                                    |
| Show Reset Filters Button | FALSE                                                                    |
| Selection Action          | Update Page                                                              |

---
---

### Filter 1:
| Filter Setting | Value                                           |
|----------------|-------------------------------------------------|
| Name           | (choose whatever is appropriate)                |
| Key            | This is what matters for the Dynamic Data Block |
| Field Type     | Single-Select                                   |
| Values:        | Noted in [PageParameterFilter-Filter1.sql](/DynamicData-PageParam/PageParameterFilter-Filter1.sql) Note that Line 1 and Lines3-14 are the same query, one is formatted as single-line, and the other one is formatted as multi-line.|