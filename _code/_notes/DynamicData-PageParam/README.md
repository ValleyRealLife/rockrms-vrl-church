# Dynamic Data & Page Parameter

This implementation is somewhat related to Chris Rea's recipe titled, "[Better Reporting With Dynamic Data Blocks](https://community.rockrms.com/recipes/33/better-reporting-with-dynamic-data-blocks)"

When I asked Chip whether there were any Manuals (or sections within a Manual) that talked about Dynamic Data Blocks, Chip replied:
> Yes, according to the information in the knowledge base, there is a section in the "Master Class - Other Reporting Options" document within the "Class - Master Class" folder that discusses the Dynamic Data Block. It provides details on how to use the block, including providing a SQL query to retrieve specific data.
I don't think I have access to Master Class documents, so I can't confirm that.

---
---

### But the gist of it is:
- Page Parameter Filter allows me to pass a key-value pair to the URL,
- Dynamic Data takes a SQL query in the back, and shows the table to the user in the front.
    * Use a lava variable to grab the value from the URL,
    * Use the lava variable as one of the filters in the SQL

---
---

### Best order to view files in this folder:
1. [Settings of the Dynamic Data Block](/DynamicData-PageParam/DynamicData-Settings.md)
2. [Query for the Dynamic Data Block](/DynamicData-PageParam/DynamicData-Query.lava)
3. [Settings of the Page Parameter Filter Block](/DynamicData-PageParam/PageParameterFilter-Settings.md)
4. [Filter for the Page Parameter Filter Block](/DynamicData-PageParam/PageParameterFilter-Filter1.sql)