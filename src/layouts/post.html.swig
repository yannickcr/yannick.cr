{% extends "default.html.swig" %}
{% block content %}
<article class="article">
	<header>
		<h1><a class="container" href="{{ document.url }}">{{ document.title }}</a></h1>
		<p class="date">{{ document.date|date('d F Y') }}</p>
	</header>
	<div class="content">
		{{ content }}
	</div>
	<footer>
		<p class="contribute">Want to contribute to this article? <a href="https://github.com/yannickcr/yannick.cr/blob/master/src/documents/{{ document.relativePath }}">Fork it on GitHub</a></p>
		<div id="disqus_thread"></div>
		<script>
			var disqus_shortname = 'yannickcr';
			(function() {
				var dsq = document.createElement('script'); dsq.async = true;
				dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
				(document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
			})();
		</script>
	</footer>
</article>
{% endblock %}
