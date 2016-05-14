/**
 * The gulp file configures the gulp build setup
 * Run "gulp build" to built project and compile CoffeeScript
 * Run "gulp test" to run Mocha unit tests and Istanbul coverage tests
 * Run "gulp" to clean, build, test and watch for changes during development
 */


/* Require the node modules */
var gulp    = require('gulp');
var coffee  = require('gulp-coffee');
var lint    = require('gulp-coffeelint');
var del     = require('del');
var footer  = require('gulp-footer');
var mocha   = require('gulp-mocha');
var istanbul= require('gulp-istanbul');
var watch   = require('gulp-watch');
var brfs    = require('gulp-brfs');

require('coffee-script/register');

var footerTxt = "\/* (C) Alicia Sykes <alicia@aliciasykes.com> 2015           " +
    "*\\\r\n\\* MIT License. Read full license at: https:\/\/goo.gl\/IL4lQJ *\/";

/* Delete the files currently in finished directory */
gulp.task('clean', function () {
    return del([ './index.js' ]);
});


/* Lint, compile and minify CoffeeScript */
gulp.task('build', ['clean'],  function(){
    return gulp.src('./index.coffee')
        .pipe(lint())
        .pipe(lint.reporter())
        .pipe(coffee())
        .pipe(brfs())
        // .pipe(uglify())
        .pipe(footer(footerTxt))
        .pipe(gulp.dest('./'));
});

/* Run unit tests and generate coverage report */
gulp.task('test', function (cb) {
    gulp.src(['./index.js'])
        .pipe(istanbul())
        .pipe(istanbul.hookRequire())
        .on('finish', function () {
            gulp.src('./test/**/*.coffee', {read: false})
                .pipe(mocha({ reporter: 'spec' }))
                .pipe(istanbul.writeReports({reporters: ['text-summary', 'lcov']}))
                //.pipe(istanbul.enforceThresholds({ thresholds: { global: 90 } }))
                .on('end', cb);
        });
});

/* Watch for changes and refresh */
gulp.task('watch', function(){
    gulp.watch('./**/*.coffee', ['test-after-build']);
    gulp.watch('./test/**/*.coffee', ['test']);
});

/* Don't test, until it has built, to avoid file not found errors */
gulp.task('test-after-build',['build'],function(){
    gulp.start('test')
});

/* Defualt gulp task, deletes old files, compiles source files and runs tests */
gulp.task('default', ['test-after-build', 'watch']);
