---
title: "Welcome!"
layout: "default"
isPage: true
---

<ul>
	{% set query = "getFilesAtPath('posts').findAllLive({extension:'md',ignored:{ $ne: true }},[{date:-1}]).toJSON()" %}
	{% for post in query|exec %}
		<li>
			<article class="article">
				<header>
					<h1><a class="container" href="{{ post.url }}">{{ post.title }}</a></h1>
					<p class="date">{{ post.date|date('d F Y') }}</p>
				</header>
				<div class="content">
					{{ post.contentRenderedWithoutLayouts }}
				</div>
			</article>
		</li>
	{% endfor %}
</ul>
