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
<ul class="series-list">
  {% if featured %}
  <li class="entry">
    <a href="{{ featured.url | relative_url }}"  class="entry-link {{ ' no-pill' }}">
    <h2 class="entry-title">{{ featured.title }}</h2>
    <p class="entry-desc">{{ featured.description | default: featured.excerpt }}</p>
    </a>
  </li>
  {% endif %}
  {% for essay in essays %}
    {% unless essay.path contains 'index.md' %}
      <li class="entry">
        <a href="{{ essay.url | relative_url }}"  class="entry-link {{ ' no-pill' }}">
        <h2 class="entry-title">{{ essay.title }}</h2>
        <p class="entry-desc">{{ essay.description | default: essay.excerpt }}</p>
        </a>
      </li>
    {% endunless %}
  {% endfor %}
</ul>
