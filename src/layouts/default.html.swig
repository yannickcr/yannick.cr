<!DOCTYPE html>
<!--[if IE 7]><html class="ie7 ie" lang="en-US"><![endif]-->
<!--[if IE 8]><html class="ie8 ie" lang="en-US"><![endif]-->
<!--[if IE 9]><html class="ie9 ie" lang="en-US"><![endif]-->
<!--[if (gt IE 9)|!(IE)]>--><html lang="en-US"><!--<![endif]-->
	<head>
		<meta charset="utf-8">
		<title>{{ site.title }}</title>
		<link rel="stylesheet" href="/statics/css/dist/main.css" media="all" />
		<link href="/feeds/posts.xml" rel="alternate" title="{{ title }}" type="application/atom+xml" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<script>if(/*@cc_on!@*/false&&document.documentMode===10)document.documentElement.className+=' ie10 ie';</script>
	</head>
	<body>
		<div class="main-container">
			<header class="header">
					<h1><a rel="home" href="/">{{ site.title }}</a></h1>
					<h2>{{ site.sub_title }}</h2>
			</header>
			<div class="main-content-container">
				<div class="main-content">
					{% block content %}{{ content }}{% endblock %}
				</div>
			</div>
			<footer class="footer">
				<ul>
					<li><a data-icon="♯" href="https://github.com/yannickcr" title="GitHub">GitHub</a></li><!--
					--><li><a data-icon="☺" href="https://twitter.com/yannickc" title="Twitter">Twitter</a></li><!--
					--><li><a data-icon="✍" href="http://www.linkedin.com/in/yannickcroissant" title="LinkedIn">LinkedIn</a></li><!--
					--><li><a data-icon="⚐" href="http://lanyrd.com/profile/yannickc" title="Lanyrd">Lanyrd</a></li><!--
					--><li><a data-icon="⛪" href="https://secure.flickr.com/photos/yannick-croissant" title="Flickr">Flickr</a></li><!--
					--><li><a data-icon="♬" href="http://www.lastfm.fr/user/K1derCountry" title="Last.fm">Last.fm</a></li>
				</ul>
			</footer>
		</div>
	</body>
</html>