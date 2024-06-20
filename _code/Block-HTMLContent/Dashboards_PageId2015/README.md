# Dashboards PageId=2015

Dashboards > Executive Team > [Congregation Stats](https://rock.vrl.church/page/2015) has an **HTML Content** Block that shows some Data Visualization.

It's worth noting that this page currently requires a `ProgramId` Page Parameter which you can include in either of these two ways:
(1) `/page/2015?ProgramId=5/` or
(2) `/dashboards/executive-team/congregation-stats/5/`

I also added a little JavaScript as a safeguard that will append the ProgramId if it's missing upon page load.