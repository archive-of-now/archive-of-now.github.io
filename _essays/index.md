---
permalink: /
series: "Home"
sort_index: 0
kind: index

layout: series_index
title: Archive of Now
---
{% assign essays = site.essays | sort: "date" | reverse | where_exp: "item", "item.featured != true" %}
{% assign featured = site.essays | where: "featured", true | first %}
<ul class="essay-list">
  {% if featured %}
  <li>
    <h2><a href="{{ featured.url | relative_url }}">{{ featured.title }}</a></h2>
    <p>{{ featured.description | default: featured.excerpt }}</p>
  </li>
  {% endif %}
  {% for essay in essays %}
    {% unless essay.path contains 'index.md' %}
      <li>
        <h2><a href="{{ essay.url | relative_url }}">{{ essay.title }}</a></h2>
        <p>{{ essay.description | default: essay.excerpt }}</p>
      </li>
    {% endunless %}
  {% endfor %}
</ul>
