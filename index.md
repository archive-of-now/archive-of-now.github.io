---
layout: default
title: Home
---

{% assign featured = site.essays | where: "featured", true | first %}
{% if featured %}
# Featured Essay
## [{{ featured.title }}]({{ featured.url | relative_url }})
{{ featured.content }}
{% endif %}

---

# All Essays

<ul>
{% assign essays = site.essays | sort: "date" | reverse | where_exp: "item", "item.featured != true" %}
{% for essay in essays %}
  <li>
    <a href="{{ essay.url | relative_url }}">{{ essay.title }}</a>
    {% if essay.date %}<small>({{ essay.date | date: "%b %Y" }})</small>{% endif %}
  </li>
{% endfor %}
</ul>
