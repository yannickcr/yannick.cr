<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0"
	xmlns:content="http://purl.org/rss/1.0/modules/content/"
	xmlns:wfw="http://wellformedweb.org/CommentAPI/"
	xmlns:dc="http://purl.org/dc/elements/1.1/"
	xmlns:atom="http://www.w3.org/2005/Atom"
	xmlns:sy="http://purl.org/rss/1.0/modules/syndication/"
	xmlns:slash="http://purl.org/rss/1.0/modules/slash/"
	xmlns:georss="http://www.georss.org/georss" xmlns:geo="http://www.w3.org/2003/01/geo/wgs84_pos#" xmlns:media="http://search.yahoo.com/mrss/"
	>
	<channel>
		<title>{{ site.title }}</title>
		<atom:link href="https://yannick.cr/feeds/posts.xml" rel="self" type="application/rss+xml" />
		<link>https://yannick.cr</link>
		<description>Code &amp; Stuff</description>
		{% set query = "getFilesAtPath('posts').findAllLive({extension:'md',ignored:{ $ne: true }},[{date:1}]).toJSON()" %}
		{% set result = query|exec %}
		<lastBuildDate>{{ result[0].date|date('r') }}</lastBuildDate>
		<language>en</language>
		<sy:updatePeriod>weekly</sy:updatePeriod>
		<sy:updateFrequency>1</sy:updateFrequency>
		{% block content %}{{ content }}{% endblock %}
	</channel>
</rss>
