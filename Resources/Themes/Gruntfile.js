module.exports = function (grunt) {
    grunt.option.init({
        shopId: 1
    });

    //TODO: works only for one custom Theme. Needs to be done for every child Custom Theme!
    // build path for font/img less variables
    var Glob = require("glob").Glob,
        baseVariablePath = '"../../custom/plugins/',
        srcPath = '',
        customThemePaths = new Glob('*CustomTheme/Resources/Themes/Frontend/**/frontend/_public/src/**/all.less', {sync: true, cwd: '../../..'});

    if (customThemePaths.found[0]) {
        var cleanThemePath = customThemePaths.found[0].split("frontend/_public/src");
        srcPath = baseVariablePath + cleanThemePath[0] + 'frontend/_public/src"';
    }

    var fs = require('fs'),
        shopwareRoot = '../../../../../',
        file = shopwareRoot + 'web/cache/config_' + grunt.option('shopId') + '.json',
        lessTargetFile = {},
        jsFiles = [],
        jsTargetFile = {},
        content = '',
        variables = {
            'fa-font-path': baseVariablePath + 'SwfBootstrapTheme/Resources/Themes/Frontend/BootstrapBare/frontend/_public/vendors/fonts"',
            'src-path': srcPath
        },
        allLess = shopwareRoot + 'web/cache/all.less',
        //phpBinary = '/usr/bin/php',               // default  
        phpBinary = '/opt/php-7.0.18/bin/php',      // TimmeHosting
        configDumpCmd = phpBinary + ' ' + shopwareRoot + 'bin/console sw:theme:dump:configuration';

    // display instructions if config doesn't exist
    if(!fs.existsSync(file)) {
        grunt.log.subhead(['Config JSON muss mit folgendem Befehl initial erzeugt werden:']);
        grunt.log.writeln([configDumpCmd]);
        return;
    }

    var config = grunt.file.readJSON(file);
    lessTargetFile[shopwareRoot + config.lessTarget] = allLess;
    config['js'].forEach(function (item) {
        jsFiles.push(shopwareRoot + item);
    });
    jsTargetFile[shopwareRoot + config.jsTarget] = jsFiles;

    config['less'].forEach(function (item) {
        content += '@import "'+ shopwareRoot + item + '";';
        content += "\n";
    });
    grunt.file.write(allLess, content);

    for (var key in config.config) {
        variables[key] = config.config[key];
    }

    // default options for grunt registerTask and initConfig functions
    var defaultTasks = ['less:development', 'uglify:development', 'watch'],
        productionTasks = ['jshint', 'less:production', 'uglify:production'],
        configOptions = {
            uglify: {
                production: {
                    options: {
                        compress: true,
                        preserveComments: false
                    },
                    files: jsTargetFile
                },
                development: {
                    options: {
                        mangle: false,
                        compress: false,
                        beautify: true,
                        preserveComments: 'all'
                    },
                    files: jsTargetFile
                }
            },
            less: {
                production: {
                    options: {
                        compress: true,
                        modifyVars: variables
                    },
                    files: lessTargetFile
                },
                development: {
                    options: {
                        modifyVars: variables,
                        dumpLineNumbers: 'all',
                        sourceMap: true,
                        sourceMapFileInline: true
                    },
                    files: lessTargetFile
                }
            },
            watch: {
                less: {
                    files: [
                        '../../**/_public/src/less/**/*.less',
                        shopwareRoot + 'custom/plugins/**/_public/src/less/**/*.less'   // new plugins
                    ],
                    tasks: ['less:development']
                },
                js: {
                    files: [
                        '../../**/_public/src/js/**/*.js',
                        shopwareRoot + 'custom/plugins/**/_public/src/js/**/*.js'       // new plugins
                    ],
                    tasks: ['uglify:development']
                }
            },
            jshint: {
                options: {
                    browser: true,
                    force: true,
                    globals: {
                        jQuery: true,
                        StateManager: true
                    }
                },
                src: [
                    'Gruntfile.js',
                    '../../**/src/js/**/*.js'
                ]
            }
        };

    // create new config JSON and add shell task
    grunt.log.subhead(['Config JSON wird neu generiert...']);
    grunt.loadNpmTasks('grunt-shell');

    configOptions['shell'] = {
        php: {
            command: configDumpCmd
        }
    };
    productionTasks.unshift('shell');
    defaultTasks.unshift('shell');

    grunt.initConfig(configOptions);

    grunt.loadNpmTasks('grunt-contrib-less');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-contrib-jshint');

    grunt.registerTask('production', productionTasks);
    grunt.registerTask('default', defaultTasks);
};
