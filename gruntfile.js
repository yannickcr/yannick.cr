module.exports = function(grunt) {

	// Project configuration.
	grunt.initConfig({

		// Javascripts
		lint: {
			all: ['src/files/statics/js/src/*.js']
		},
		concat: {
			dist: {
				src: ['src/files/statics/js/src/*.js'],
				dest: 'src/files/statics/js/dist/lolz.js'
			}
		},
		min: {
			dist: {
				src: ['src/files/statics/js/src/*.js'],
				dest: 'src/files/statics/js/dist/lolz.min.js'
			}
		},

		// Stylesheets
		compass: {
			dev: {
				src: 'src/files/statics/css/src',
				dest: 'src/files/statics/css/dist',
				linecomments: true,
				forcecompile: true,
				debugsass: true,
				images: 'src/files/statics/img',
				relativeassets: true
			},
			prod: {
				src: 'src/files/statics/css/src',
				dest: 'src/files/statics/css/dist',
				outputstyle: 'compressed',
				linecomments: false,
				forcecompile: true,
				debugsass: false,
				images: 'src/files/statics/img',
				relativeassets: true
			}
		},

		// Watch
		watch: {
			scripts: {
				files: ['src/files/statics/js/src/**/*.js'],
				tasks: 'lint concat min'
			},
			compass: {
				files: ['src/files/statics/css/src/**/*.scss'],
				tasks: 'compass:prod'
			}
		},

		// Options
		jshint: {
			options: {
				browser: true
			}
		},
		uglify: {}

	});

	// Default
	grunt.registerTask('default', 'lint concat min');
	grunt.registerTask('compass', 'compass:prod');

	// Plugin tasks
	grunt.loadNpmTasks('grunt-compass');
	grunt.loadNpmTasks('grunt-contrib-watch');
};
