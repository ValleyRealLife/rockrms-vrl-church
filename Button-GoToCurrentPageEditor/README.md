# Goto Page Editor for Current Page
I was told that this code snippet would add a button in the button-bar that lets me go to the Page Editor for the current page:
```
{% assign tempPage = CurrentPage %}
{% assign parentPageList = tempPage.ParentPage.Id %}

{% for x in (1..10) %} {% comment %} This loop will travel up the parent page tree building a parent Page Id list  {% endcomment %}
{% assign tempPage = tempPage.ParentPage %}
{% if tempPage.ParentPage.Id %}
  {% capture parentPageList %}{{parentPageList}},{{ tempPage.ParentPage.Id }}{% endcapture %}
{% else %} 
  {% comment %}If no parents remain exit the for loop  {% endcomment %}
  {% break %}
{% endif %}
{% endfor %}

{% javascript %}
$(function() {
    $('.button-bar').append('<a id="aPagesLink" class="btn pages-link" href="/page/103?Page={{ CurrentPage.Id }}&ExpandedIds={{parentPageList}}&Redirect=false" title="Pages Editor"><i class="fa fa-external-link-square"></i></a>');
});
{% endjavascript %}
```

I really liked this functionality, but I thought it'd be better if the button would open the Page Editor in a new tab, rather than redirect the tab that I'm currenlty on, so I added a `target="_blank"` to the `<href>`:
```
{% assign tempPage = CurrentPage %}
{% assign parentPageList = tempPage.ParentPage.Id %}

{% for x in (1..10) %} {% comment %} This loop will travel up the parent page tree building a parent Page Id list  {% endcomment %}
{% assign tempPage = tempPage.ParentPage %}
{% if tempPage.ParentPage.Id %}
  {% capture parentPageList %}{{parentPageList}},{{ tempPage.ParentPage.Id }}{% endcapture %}
{% else %} 
  {% comment %}If no parents remain exit the for loop  {% endcomment %}
  {% break %}
{% endif %}
{% endfor %}

{% javascript %}
$(function() {
    $('.button-bar').append('<a id="aPagesLink" class="btn pages-link" href="/page/103?Page={{ CurrentPage.Id }}&ExpandedIds={{parentPageList}}&Redirect=false" title="Pages Editor" target="_blank"><i class="fa fa-external-link-square"></i></a>');
});
{% endjavascript %}
```

I don't know where the original recipe is, so I can't add this as a comment.

But essentially, in the 'Footer' zone, at the Site level, add an HTML block and copy+paste the lava there.