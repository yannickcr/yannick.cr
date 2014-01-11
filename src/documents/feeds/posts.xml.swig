---
title: "Welcome!"
layout: "feed"
isPage: true
---

{% set query = "getFilesAtPath('posts').findAllLive({extension:'md',ignored:{ $ne: true }},[{date:-1}]).toJSON()" %}
{% for post in query|exec %}
	<item>
		<title>{{ post.title }}</title>
		<link>https://yannick.cr{{ post.url }}</link>
		<pubDate>{{ post.date|date('r') }}</pubDate>
		<guid isPermaLink="true">https://yannick.cr{{ post.url }}</guid>
		<description><![CDATA[{{ post.contentRenderedWithoutLayouts }}]]></description>
		<content:encoded><![CDATA[{{ post.contentRenderedWithoutLayouts }}]]></content:encoded>
	</item>
{% endfor %}
