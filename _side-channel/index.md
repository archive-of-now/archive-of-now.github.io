---
permalink: /side-channel/
series: "Side Channel"
sort_index: 0
kind: index

layout: series_index
title: Side Channel
deck: |
  <code>cat /proc/mind > /dev/logger</code><br/>
  Unstructured observations emitted without guarantees.
---
{%- assign entries = site[page.collection]
     | where_exp: "item", "item.sort_index != 0"
     | sort: "date" | reverse -%}


<ul class="series-list">
  {%- for entry in entries -%}
    <li class="entry">
        <p class="entry-desc">{{ entry.description | default: entry.excerpt }}</p>
    </li>
  {%- endfor -%}
</ul>
