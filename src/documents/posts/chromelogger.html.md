---
layout: post
title: Chrome Logger for Node.js
date: 2013-04-24 00:00
ignored: false
---
[Chrome Logger](http://craig.is/writing/chrome-logger) is a Chrome extension that allows you to display your server side debugging messages in the Chrome console.

So, I made a simple implementation for Node.js to help you to debug your Node.js application directly in Chrome.

You can found [node-chromelogger on GitHub](https://github.com/yannickcr/node-chromelogger).

Juste make a

```javascript
npm install chromelogger
```

like any other npm package.

Then, use it in your application:

```javascript
var chromelogger = require('chromelogger');
var http = require('http');

var server = http.createServer();

server.on('request', chromelogger.middleware);

server.on('request', function(req, res) {
  res.chrome.log('Message from Node.js %s', process.version);
  res.end('Hello World');
});

server.listen(7357);
```

Node Chrome Logger provide several logging methods on the ServerResponse (res) object:

 * `res.chrome.log`
 * `res.chrome.warn`
 * `res.chrome.error`
 * `res.chrome.info`
 * `res.chrome.group`
 * `res.chrome.groupEnd`
 * `res.chrome.groupCollapse`

These methods matches the [Console API of the Chrome Developer Tools](https://developers.google.com/chrome-developer-tools/docs/console-api).

You can also use it as an ExpressJS middleware if you want (see Readme for more informations).

The main limitation is it uses the HTTP Headers to send the informations to the client, so if you started to send the body you can't send more debug messages to the client and it will trigger an error.

If you need a more advanced Node.js debug tool I suggest you to use the great [Node Inspector](https://github.com/dannycoates/node-inspector) package.