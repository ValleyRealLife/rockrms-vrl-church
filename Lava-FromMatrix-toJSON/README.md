# Lava that transforms Matrix-type Attribute Value to a Text-type Attribute Value (JSON)

If you assign the `var` in Line 1 to be the AttributeMatrix GUID, then the `{{ jsonString }}` at the end will be a JSON representation of the "columns" and "rows" of the AttributeMatrix.

You can then use the [FromJSON](https://community.rockrms.com/lava/filters/other-filters#fromjson) filter as demonstrated in the Lava documentation.