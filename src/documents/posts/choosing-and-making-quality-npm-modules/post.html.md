---
layout: post
title: Choosing and making quality npm modules
date: 2014-01-11 17:00
ignored: false
---
Since its creation Node.js gained more and more attention and the size of its module repository ([NPM](http://npmjs.org)) increase [very rapidly](http://modulecounts.com).

But with near 55 000 available modules created by the community it can be very difficult to make the good choice for your own projects.

How to know if it's safe to use this tiny module on your billion pageviews/day project ?

Short answer: You can't.

Long answer: You really can't, but according to me there is two main criteria to consider:

- Quality
- Support

I made a list of tools/practices to help you to check npm modules. It can help you as a user to choose your modules but also as a module author to improve your code quality.

## Quality

### Tests

![Running tests with Mocha](/posts/choosing-and-making-quality-npm-modules/tests.png)

According to [Nodechecker](nodechecker.com) more than half of the npm modules do not have any tests, that's sad :(.

The presence of a complete test suite is very important to help you to see if the functionalities of the module were fully tested by the author. And combined with a continuous integration service like [Travis CI](https://travis-ci.org) you can easily check the module status at each commit.

Tests are a very powerful tool to prevent regressions between releases and they must not be neglected.

For Users:

- Check the module readme for a ["badge"](http://about.travis-ci.org/docs/user/status-images/) like this: ![Build status for travis-web](/posts/choosing-and-making-quality-npm-modules/passing.png). Most of online services provides some similar images to display the current status of the project.
- Search a `test` folder at the project root. The standard command to run the tests of a npm module is `npm test`.

For Authors:

- [Mocha](http://visionmedia.github.com/mocha)
- [Jasmine](http://pivotal.github.io/jasmine)
- [Codeship](https://www.codeship.io)
- [Travis CI](https://travis-ci.org)

### Code coverage

![Code coverage report with Blanket.js](/posts/choosing-and-making-quality-npm-modules/coverage.png)

Tests are great, but to be efficient they must cover a maximum of cases in your module.

A good way to ensure a good coverage of your code base is to use an automated tool to determine how many percents of your code were covered by your tests and what conditions were not tested.

Some tools like [Blanket.js](http://blanketjs.org) can analyze your code then output a report in HTML (or other format) that highlight the non-covered lines.

You can also send this report to a service like [Coveralls](https://coveralls.io) to keep an history of your code coverage and be warned if any commit decrease the percentage of covered code.

For Users:

- Check the module readme for a Coveralls "badge" like this: ![Coverage status for gitlabhq](/posts/choosing-and-making-quality-npm-modules/coverage-86.png)

For Authors:

- [Blanket.js](http://blanketjs.org)
- [Istanbul](https://github.com/gotwarlost/istanbul)
- [Coveralls](https://coveralls.io)

### Documentation

An undocumented module is useless for everyone except its author. What is the point to open-source something if you do not explain to the users what it does and how to use it ?

The minimal documentation is the Readme at the root of the project, it should at least contain:

- name of the module
- description of what it does
- how to install
- how to use (example)
- license

That's it. Some other sections can be nice to have too:

- how to run tests (important if it is different from the simple `npm test`)
- how to contribute
- where to get support
- how to contact the authors

Most of the npm modules are very simple so their documentation fits in the Readme, for bigger modules you can have a doc/documentation folder at the root of the project, a wiki in the GitHub repository or a dedicated website.

### Proper versioning

The Node.js userland is used to the [Semantic Versioning](http://semver.org) specification, so your modules must follow them.

This specifications can be summarized like this:

> Given a version number MAJOR.MINOR.PATCH, increment the:
>
> - MAJOR version when you make incompatible API changes,
> - MINOR version when you add functionality in a backwards-compatible manner, and
> - PATCH version when you make backwards-compatible bug fixes.
>
> Additional labels for pre-release and build metadata are available as extensions to the MAJOR.MINOR.PATCH format.

So upgrading from version 2.4.5 to 2.6.4 should be painless (backwards compatibility is preserved, only some patches and some new features). Breaking changes must only be introduced with a new MAJOR version.

A proper versioning is critical because it allows you to upgrade seamlessly your depencendices without any risks for your application.

For Users:

- [next-update](https://github.com/bahmutov/next-update): Tests if module's dependencies can be updated to newer / latest versions without breaking the tests.

For Authors:

- [semver](http://semver.org): The Semantic Versioning 2.0.0 specification

### Code quality

![Report with CodeClimate](/posts/choosing-and-making-quality-npm-modules/codeclimate.png)

Quality is a combination of many criteria: consistency, readability, maintainability, etc. It can be hard to evaluate, but some tools can help you in this task.

For example some tools like [JSHint](http://www.jshint.com/docs) can help you to spot very early some potential problems in your code (unused variables, missing var keyword, function in a loop, etc.) and [JSCS](https://github.com/mdevils/node-jscs) can enforce some coding rules in your team to keep code consistency.

There is also some tools to check your code maintainability like [Plato](https://github.com/es-analysis/plato) or [CodeClimate](https://codeclimate.com), they can generate some very useful reports to spot the quality problems in your project.

For Users:

- Check the module readme for a CodeClimate "badge" like this: ![CodeClimate status for jekyll](/posts/choosing-and-making-quality-npm-modules/codeclimate-3-4.png)
- Search a `.jshintrc` file (JSHint) and/or `.jscs.json` file (JSCS) at the project root.

For Authors:

- [Plato](https://github.com/es-analysis/plato)
- [JSHint](http://www.jshint.com/docs)
- [JSCS](https://github.com/mdevils/node-jscs)
- [CodeClimate](https://codeclimate.com)

But these tools does not make everything, and the best tool is still some regular code reviews with one of your peers.

## Support

Support is all about the future of the module. Non-fixed bugs or futures node.js version incompatibility can make a module broken and useless very quickly. It is hard to guess if a module will be well supported by its author(s) but there is some signs that can give us some indications.

Sadly, there is no magic tool for now.

### Repository activity

Most of the npm modules are hosted on GitHub and you can have a nice overview of the activity on the [pulse page](https://github.com/joyent/node/pulse). You can also check the date of the last commit, the number of open issues, the number of open pull requests, etc.

But an inactive project does not mean the project is abandoned, maybe the author is considering the module as "done" if it fits his needs and if there is no open issues or pull requests.

### Authors:

You can also check the author name. It can be a trusted company ([Nodejitsu](https://github.com/nodejitsu), [Walmart Labs](https://github.com/walmartlabs‎), [Yahoo](https://github.com/yahoo), etc.), a trusted developer ([John Resig](https://github.com/jeresig), [Isaac Z. Schlueter](https://github.com/isaacs), [Mikeal Rogers](https://github.com/mikeal‎), etc.) or a total stranger. In all cases the support of the past projects of the company/developer will indicate if they are used to maintain their open-source projects.

### Popularity

The popularity is not an indicator of the good health of a module, but it can indicate there is already a lot of people trusting this module and its authors. Chances are if there is a problem with the support and if the module is still widely used it will be forked and/or maintained by some other contributors (cross your fingers here).


I hope this tools and advices will help you to improve your project quality and solidity of your projects. I mentioned most of the tools I'm using on my personal and professional projects, if you know some other useful tools please post them in the comments, I'll update the list.
