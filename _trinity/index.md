---
layout: series_index
permalink: /trinity/
seo:
  type: website

series: "Trinity Framework"
kind: index
sort_index: 0
nav_title:
tags:
  - trinity
  - systems
  - essays

title: Universe's Trinity
deck: |
  An exploration of how a minimal three-part grammar helps explain persistent
  patterns in ecosystems, institutions, markets, geopolitics, and other complex systems.

---

<p><i>Recommended reading order: top-down</i></p>
{%- assign entries = site[page.collection]
     | where_exp: "item", "item.sort_index != 0"
     | sort: "sort_index" -%}
{%- include index_list.html entries=entries -%}
