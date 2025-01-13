# Show a Card for each Devotional Content
Querying [ContentChannelItem] where `ContentChannelId=360` (being smart enough to respect SlidingDateRange input from EndUser) and formatting the output so that it shows a card per Row, rather than a Grid.

Selecting a card must update the `Devotional` Parameter in the URL.