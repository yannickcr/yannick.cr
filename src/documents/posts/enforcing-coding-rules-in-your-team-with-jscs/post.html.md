---
layout: post
title: Enforcing coding rules in your team with JSCS
date: 2014-01-28 15:00
ignored: false
---

Enforcing coding rules in a team is hard, and most of the time it ends with a very long documentation lost on the company wiki which nobody reads. You can also check the coding rules during code reviews and make the apropriate corrections if needed but it can be very painful and time consuming.

According to me, the only solution is to rely on some tools to check the code and warn the developper if he do not follow the rules. It can be a simple warning as it can totally forbid him to push some code, it is up to you to choose how strict you want to be.

My tool of choice for this is [JSCS](https://github.com/mdevils/node-jscs) (for JavaScript Code Style checker). We'll see how to integrate it in your team tools and in your workflow.

## Installing JSCS

JSCS is a simple npm module to install globaly.

```javascript
npm install jscs -g
```

You have now the JSCS tool available globaly.

To check your code JSCS will need a configuration file named `.jscs.json` at the root of your project. This file will contain all the rules your code must follow.

As an example you can check the jQuery `.jscs.json` configuration file bellow:

```json
{
    "requireCurlyBraces": [ "if", "else", "for", "while", "do" ],
    "requireSpaceAfterKeywords": [ "if", "else", "for", "while", "do", "switch", "return" ],
    "requireSpacesInFunctionExpression": {
        "beforeOpeningCurlyBrace": true
    },
    "disallowSpacesInFunctionExpression": {
        "beforeOpeningRoundBrace": true
    },
    "requireMultipleVarDecl": true,
    "requireSpacesInsideObjectBrackets": "all",
    "requireSpacesInsideArrayBrackets": "all",
    "disallowLeftStickedOperators": [ "?", "-", "/", "*", "=", "==", "===", "!=", "!==", ">", ">=", "<", "<=" ],
    "disallowRightStickedOperators": [ "?", "/", "*", ":", "=", "==", "===", "!=", "!==", ">", ">=", "<", "<="],
    "requireSpaceBeforeBinaryOperators": ["+", "-", "/", "*", "=", "==", "===", "!=", "!=="],
    "disallowSpaceAfterPrefixUnaryOperators": ["++", "--", "+", "-"],
    "disallowSpaceBeforePostfixUnaryOperators": ["++", "--"],
    "requireRightStickedOperators": [ "!" ],
    "requireLeftStickedOperators": [ "," ],
    "disallowKeywords": [ "with" ],
    "disallowMultipleLineBreaks": true,
    "disallowKeywordsOnNewLine": [ "else" ],
    "requireLineFeedAtFileEnd": true,
    "disallowSpaceAfterObjectKeys": true,
    "validateLineBreaks": "LF"
}
```

These rules enforce curly braces after `if` statements, disallow the use of `with`, enforce Unix line ending and so on. You can found the rules list and their meaning in the [JSCS Readme](https://github.com/mdevils/node-jscs/blob/master/README.md).

When you have finished to play with the rules, put your `.jscs.json` configuration file at the root of your project.

You can already check your code by typing this command at the root of your project:

```javascript
jscs path/to/my/script.js
```

or

```javascript
jscs .
```

to check the whole project (`.` is the current directory).

You should get something like this:

![JSCS from the command line](/posts/enforcing-coding-rules-in-your-team-with-jscs/jscs-command-line.png)

Great ! You can now check your code with JSCS ! But for now this is not very convenient.

## Intregrating JSCS in Sublime Text

For this you will need [Sublime Text 3](http://www.sublimetext.com/3) with [Package Control](https://sublime.wbond.net).

First you will need to install [SublimeLinter](https://sublimelinter.readthedocs.org) using Package Control (follow the [SublimeLinter documentation](https://sublimelinter.readthedocs.org/en/latest/installation.html#installing-via-pc) if you are not sure about the procedure).

Then, the same way you've installed SublimeLinter, search for the package [SublimeLinter-jscs](https://sublime.wbond.net/packages/SublimeLinter-jscs) in Package Control and install it.

And... you've done ! Now if you try to open your project JavaScript files in Sublime Text you should have your errors highlighted by SublimeLinter.

![Highlighting coding style errors with SublimeLinter-jscs](/posts/enforcing-coding-rules-in-your-team-with-jscs/sublimelinter-jscs.png)

If you are not using Sublime Text as text editor (shame on you !) JSCS has also some plugins for [Vim](https://github.com/scrooloose/syntastic/blob/master/syntax_checkers/javascript/jscs.vim), [Brackets](https://github.com/globexdesigns/brackets-jscs) and [LightTable](https://github.com/deepak1556/lt-jscs).

If you are using none of those, keep reading ;)

## Adding JSCS as a Grunt task

The Sublime Text plugin is great but if you have some teamates that do not use an editor with a JSCS plugin and keep pushing some unchecked code all your hard work will be in vain.

Here's enter [Grunt](http://gruntjs.com).

If you are already using Grunt it will be a simple task to add to your tasklist.

Just install the [grunt-jscs-checker](https://github.com/gustavohenke/grunt-jscs-checker) npm package:

```javascript
npm install grunt-jscs-checker --save-dev
```

And add a `jscs` entry in your `Gruntfile.js`:

```javascript
jscs: {
  src: "path/to/my/*.js"
}
```

Read the [Readme](https://github.com/gustavohenke/grunt-jscs-checker/blob/master/README.md) for more options.

Then run the task to check the whole project:

![JSCS from Grunt](/posts/enforcing-coding-rules-in-your-team-with-jscs/jscs-grunt.png)

Not very different from the command line, but we can now configure Grunt to run it with other tasks, like your tests:

```javascript
grunt.registerTask('test', ['jscs', 'jasmine']);
```

This way you will check your project coding style besides to the tests compliance.

(If you are using Gulp instead of Grunt you can use the [gulp-jscs](https://github.com/sindresorhus/gulp-jscs) task)

## Adding JSCS as a Git pre-commit hook

Ok, now we need to be sure JSCS will be run before every commit. A way to do this is to use [grunt-githooks](https://github.com/rhumaric/grunt-githooks) that will easily bind your Grunt tasks to Git hooks.

Like before, install the [grunt-githooks](https://github.com/rhumaric/grunt-githooks) npm package:

```javascript
npm install grunt-githooks --save-dev
```

And add a `githooks` entry in your `Gruntfile.js`:

```javascript
githooks: {
  all: {
    'pre-commit': 'test'
  }
}
```

Run `grunt githooks` to bind the tasks and you're done.

From now, next time you will commit the `test` task will run and if it finish in error (error in the coding style or in the tests) the commit will be aborded.

![JSCS as a Git pre-commit hook](/posts/enforcing-coding-rules-in-your-team-with-jscs/jscs-git.png)
