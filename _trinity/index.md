---
layout: default
permalink: /trinity/
title: Universe's Trinity
description: |
  An exploration of how a minimal three-part grammar helps explain persistent
  patterns in ecosystems, institutions, markets, geopolitics, and other complex systems.

seo:
  type: website
---

**Recommended reading order: top-down**
<section class="series-index">
  <ul>
    {%- assign essays = site.trinity | sort: "sort_index" -%}

    {%- for essay in essays -%}
      {%- unless essay.path contains 'index.md' -%}
        <li>
          <h2><a href="{{ essay.url | relative_url }}">{{ essay.title }}</a></h2>
          <p>{{ essay.description | default: essay.excerpt }}</p>
        </li>
      {%- endunless -%}
    {%- endfor -%}
  </ul>
</section>
