gulp = require 'gulp'
gutil = require 'gulp-util'
coffee = require 'gulp-coffee'
browserify = require 'gulp-browserify'

gulp.task('coffee', ->
	gulp.src('./src/**/*.coffee')
	    .pipe(coffee({bare: true}).on('error', gutil.log))
	    .pipe(gulp.dest('./build/'))
)

gulp.task('browserify', ['coffee'], ->
    gulp.src('./build/bundle.js')
	    .pipe(browserify())
        .pipe(gulp.dest('./build/'))
)

gulp.task('default', ->
	gulp.start 'coffee', 'browserify'
)