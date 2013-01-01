<!DOCTYPE html>
<html lang="en-US">
	<head>
		<meta charset="utf-8">
		<title>{{ site.title }}</title>
		<link rel="stylesheet" href="/statics/css/dist/main.css" media="all" />
		<link href='http://fonts.googleapis.com/css?family=Share:700' rel='stylesheet' type='text/css'>
		<link href="/feeds/posts" rel="alternate" title="{{ title }}" type="application/atom+xml" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
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

			</footer>
		</div>
	</body>
</html>