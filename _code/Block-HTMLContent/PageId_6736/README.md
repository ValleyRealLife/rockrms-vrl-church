# Preview the selected Devotional Content
This Page also has a DynamicData block that shows a card for each ContentChannelItem in ContentChannelId=360

When the user selects one of the cards, it updates the corresponding PageParameter in the URL

This HTML Block then identifies the correct ContentChannelItem from the Id in the PageParameter, and shows a preview of what it would be shown in PageId=6645

In other words, the HTML written in this Page is a modified version of the HTML written in [BlockId 7426](../../Block-ContentChannelView/VRL_DailyDevos/BlockId7426-ContentChannelView-Format.lava)