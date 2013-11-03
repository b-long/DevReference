'use strict';

// # Globbing
// for performance reasons we're only matching one level down:
// 'path/to/src/{,*/}*.js'
// use this form you want to recursively match all subfolders:
// 'path/to/src/**/*.js'

module.exports = function(grunt) {

    // Configure Grunt and the Grunt plugins
    grunt.initConfig({
        // Make the NodeJS/NPM configuration file available
        // Information on the package.json file:
        // https://npmjs.org/doc/json.html
        pkg: grunt.file.readJSON('package.json'),
        banner: '/*! <%= pkg.name %> - v<%= pkg.version %> - ' +
                '<%= grunt.template.today("yyyy-mm-dd") %>\n' +
                '<%= pkg.homepage ? "* " + pkg.homepage + "\\n" : "" %>' +
                '* Copyright (c) <%= grunt.template.today("yyyy") %> <%= pkg.author.name %>;' +
                ' Licensed <%= _.pluck(pkg.licenses, "type").join(", ") %> */\n',
        // Task (plugin) configuration.  NB, each
        // plugin must be loaded
        clean: {
            files: ['dist/{,*/}*.js']
        },
        // All JSHint standard options are available:
        // http://www.jshint.com/docs/options/
        jshint: {
            // Options to apply to all sub-tasks
            options: {
                // Require braces for  loops and conditionals
                curly: true,
                eqeqeq: true,
                // Prohibits the use of immediate function invocations
                // without wrapping them in parentheses
                immed: true,
                // Prohibits the use of a variable before it was defined
                latedef: true,
                // Require constructor functions to begin wiht a capital letter
                newcap: true,
                // Prohibits the use of arguments.caller and arguments.callee
                noarg: true,
                // Suppresses warnings about using [] notation when it can
                // be expressed in dot notation: person['name'] vs. person.name
                sub: true,
                // Prohibits the use of explicitly undeclared variables
                undef: true,
                // Warns when we define and never use functions/variables
                unused: true,
                eqnull: true
            },
            gruntfile: {
                // Options used only when linting the Gruntfile
                options: {
                    // Since Grunt runs in the Node runtime env.
                    node: true
                },
                src: 'Gruntfile.js'
            },
            app: {
                options: {
                    browser: true,
                    predef: ["require", "define", "alert"]
                },
                src: ['app/{,*/}*.js']
            },
            test: {
                options: {
                    predef: [
                        //"jQuery",
                        "QUnit",
                        "require",
                        "define",
                        "module",
                        "test",
                        "asyncTest",
                        "expect",
                        "start",
                        "stop",
                        "ok",
                        "equal",
                        "notEqual",
                        "deepEqual",
                        "notDeepEqual",
                        "strictEqual",
                        "notStrictEqual",
                        "throws"
                    ]
                },
                src: ['test/{,*/}*.js']
            }
        },
        requirejs: {
            // The requirejs:compile task is run by default
            compile: {
                options: {
                    // We must use either the "name", "include"
                    // or "modules" option to identify the start
                    // of our app.  NB: 'name' (et al.) are not
                    // simply used in a narrative / identifiction
                    // sense.  The module id here is relative
                    // to the baseUrl as declared in 'config.js'
                    include: 'main',
                    // Controls compilation
                    mainConfigFile: 'amd/config.js',
                    // To build a non-optimized site:
                    out: 'dist/<%= pkg.name %>-with-AMD.min.js',
                    optimize: 'none'

                    // To build an optimized site:
                    // out: 'dist/<%= pkg.name %>-with-AMD.min.js',
                    // optimize: 'uglify2'
                }
            }
        },
        connect: {
            server: {
                options: {
                    port: 9001,
                    base: '../',
                    directory: '**/*.*',
                    keepalive: true
                }
            }
        }
    });
    // Rather than loading every task by hand
    // e.g. grunt.loadNpmTasks('grunt-contrib-jshint');
    // We can do it all in one line.  More info:
    // https://github.com/tkellen/node-matchdep
    //
    // The plugins loaded provided the necessary build tasks
    require("matchdep").filterDev("grunt-contrib*", './package.json').forEach(grunt.loadNpmTasks);

    // Default task.
    grunt.registerTask('default', ['jshint', 'clean', 'requirejs']);
};
