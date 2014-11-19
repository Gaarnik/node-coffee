gulp = require 'gulp'
gutil = require 'gulp-util'
coffee = require 'gulp-coffee'
browserify = require 'gulp-browserify'

paths = {
	src: './src/**/*.coffee',
	build: './build/',
	bundle: './build/client/main.js',
	bundleBuild: './build/client/'
}

gulp.task('coffee', ->
	gulp.src(paths.src)
	    .pipe(coffee({bare: true}).on('error', gutil.log))
	    .pipe(gulp.dest(paths.build))
)

gulp.task('browserify', ['coffee'], ->
    gulp.src(paths.bundle)
	    .pipe(browserify())
        .pipe(gulp.dest(paths.bundleBuild))
)

gulp.task('watch', ->
	gulp.watch(paths.src, ['default'])
)

gulp.task('default', ->
	gulp.start 'watch', 'coffee', 'browserify'
)