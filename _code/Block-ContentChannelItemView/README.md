# Content Channel Item View

This BlockType is similar to the [Content Channel View](../Block-ContentChannelView/) Block, but rather than showing a list of all ContentChannelItems within a ContentChannel, it's moreso designed for showing the CONTENT of the ContentChannelItem(s).

(The Block Configuration looks like it can also show all CONTENT of all ContentChannelItems in the specified ContentChannel, kinda like browsing a one-long page of bunch of posts in Twitter or Instagram. For right now, the only use case is to show the CONTENT of one specific ContentChannelItem)

The Block Configuration allows us to write some custom Lava in the 'Lava Template' field, which will be applied to the ContentChannelItem specified in the URL. (This sounds very similar to what we can achieve using an HTMLContent BlockType, but there is a reason why we are using this BlockType instead of the HTMLContent BlockType)

The ContentChannelItemView BlockType allows us to pass either a `ContentChannelItem.Id`, or `ContentChannelItem.Slug`, or `ContentChannelItem.Guid` in order to specify the ContentChannelItem that would be passed through the 'Lava Template' (whereas the HTMLBlock would require some fancy entity commands in the first few lines in order to identify the CCI from Id or Slug)