---
layout: series_index
permalink: /technology/
seo:
  type: website

series: "Technology"
kind: index
sort_index: 0
nav_title:
tags:

title: "Technology"
description: |

---
{%- assign entries = site[page.collection]
     | where_exp: "item", "item.sort_index != 0"
     | sort: "sort_index" -%}
{%- include index_list.html entries=entries
-%}
