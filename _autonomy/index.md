---
layout: series_index
permalink: /autonomy/
seo:
  type: website

series: "On Autonomy"
kind: index
sort_index: 0
nav_title:
tags:

title: "On Autonomy"
deck: |

---
{%- assign entries = site[page.collection]
     | where_exp: "item", "item.sort_index != 0"
     | sort: "sort_index" -%}
{%- include index_list.html entries=entries
-%}
