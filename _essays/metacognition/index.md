---
layout: default
permalink: /metacognition/
title: Metacognition
deck: |
  Part of the ongoing Metacognition series — exploring thought about thought,
  and how tools like AI reshape our ways of knowing.
seo:
  type: website
---

<section class="series-index">
  <ul>
    {%- assign essays = site.essays | where_exp: "e", "e.path contains '/metacognition/'" | sort: "date" -%}
    {%- assign featured = essays | where: "featured", true | first -%}

    {%- if featured and featured.path != page.path -%}
      <li class="featured">
        <h2><a href="{{ featured.url | relative_url }}">{{ featured.title }}</a></h2>
        <p>{{ featured.description | default: featured.excerpt }}</p>
      </li>
    {%- endif -%}

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
