---
layout: trinity_index
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
description: |
  An exploration of how a minimal three-part grammar helps explain persistent
  patterns in ecosystems, institutions, markets, geopolitics, and other complex systems.

---

**Recommended reading order: top-down**
<section class="series-index">
  <ul class="trinity-list">
    {%- assign essays = site.trinity | sort: "sort_index" -%}

    {%- for essay in essays -%}
      {%- unless essay.path contains 'index.md' -%}
        <li class="entry">
          <a href="{{ essay.url | relative_url }}" class="entry-link">
            <span class="entry-kind">{{ essay.kind }}</span>
            <h2 class="entry-title">{{ essay.title }}</h2>
            <p class="entry-desc">{{ essay.description | default: essay.excerpt }}</p>
          </a>
        </li>
      {%- endunless -%}
    {%- endfor -%}
  </ul>
</section>
