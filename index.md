---
layout: default
title: Home
---

# Featured Essay

{% assign featured = site.essays | where_exp: "item", "item.featured == true" | first %}
{% if featured %}
## [{{ featured.title }}]({{ featured.url | relative_url }})
{{ featured.content }}
{% endif %}

---

# All Essays

<ul>
{% for essay in site.essays %}
  <li>
    <a href="{{ essay.url | relative_url }}">{{ essay.title }}</a>
    {% if essay.date %}<small>({{ essay.date | date: "%b %Y" }})</small>{% endif %}
  </li>
{% endfor %}
</ul>
