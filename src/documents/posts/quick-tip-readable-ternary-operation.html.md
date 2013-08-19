---
layout: post
title: Quick tip - Readable ternary operation
date: 2013-04-28 22:30
ignored: false
---

You are certainly used to ternary operations in JavaScript, you know, those things you frequently use as a shortcut instead of a `if` statement:

```javascript
var sky = summer ? 'blue' : 'grey';
```

Short, readable. Good.

But what if we got more complex conditions ?

```javascript
var sky = spring ? 'lightblue' : summer ? 'blue' : fall ? 'lightgrey' : 'grey';
```

Still short, but it start to be much less readable and difficult to understand at first sight.

So, we can indent our code to keep this readable.

```javascript
var sky =
	spring ? 'lightblue' :
	summer ? 'blue'      :
	fall   ? 'lightgrey' :
	'grey'
;
```

Haaaa, much better. We can easily see here our conditions and values while keeping the code quite short.

Has a general rule:

```javascript
var [variable] =
	[condition 1] ? [value 1] :
	[condition 2] ? [value 2] :
	[fallback value]
;
```

But, do you really need to do a complex ternary operation ? ;)
