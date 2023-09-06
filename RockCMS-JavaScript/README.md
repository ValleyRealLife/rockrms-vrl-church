# Using JavaScript in the Context of Rock CMS

If I am writing JavaScript in a place that will render HTML, use `<script></script>` like:
``` javascript
<script>
    alert("Hello world!");
</script>
```

If I am using JavaScript in a place that will be processed and rendered by the Lava templating engine, use `{% javascript %}{% endjavascript %}` like:
```lava
{% javascript %}
    alert("Hello {{ CurrentPerson.NickName }}!");
{% endjavascript %}
```
(Rock Community / Lava / Commands / [JavaScript](https://community.rockrms.com/lava/commands/javascript-commands))