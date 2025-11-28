---
layout: default
permalink: /trinity/
title: Universe's Trinity of Forces
description: A multi-part series exploring the foundational forces — entropy, scarcity, and recursion — that give rise to the Trinity Effect, meta-power, societal vectors, and the structural patterns shaping human civilization.
seo:
  type: website
---

<section class="series-index">
  <ul>
    {%- assign essays = site.trinity | sort: "date" -%}

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
