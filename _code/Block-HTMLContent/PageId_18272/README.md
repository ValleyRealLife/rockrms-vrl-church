# Reporting Dashboard
Alex Fehr created this Dashboard during 2024-2025 at the request of Tim Seo to:
- Provide a centralized view of all reports and dataviews.
- Make reports and dataviews searchable and filterable by name, type, and department.
- Allow users to favorite reports and dataviews for quick access.
- Keep track of recently visited reports and dataviews for the user.
It is based on this recipe: https://community.rockrms.com/recipes/397/reporting-dashboard

## Setup
1. Go to **CMS Configuration > Pages**.
2. Under **Internal Homepage > Dashboards**, create a blank page to serve as a new category under **Dashboards**. Call it something like "Reporting".
3. Under this new category page, create another page called "Reporting Dashboard" or similar. Use a **Full Width** layout. This is the page that will actually contain the dashboard.
4. Add an **HTML Content** block to the page.
5. On the HTML Content block, click on **Edit HTML** and add the contents of **BlockId_13662.lava**.
6. On the HTML Content block, click on **Block Properties** and enable the **Sql** and **Rock Entity** Lava commands.

**HEADS UP:** To make full use of this feature, also set up the "Favorite Button" Lava in the **Pre-HTML** of the **Report Detail (Report Detail)** and **Data Views (Data View Detail)** blocks.