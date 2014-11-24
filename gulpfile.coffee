gulp = require 'gulp'
gutil = require 'gulp-util'
coffee = require 'gulp-coffee'
browserify = require 'gulp-browserify'
del = require 'del'

paths = {
	src: './src/**/*.coffee',
	build: './build/',
	bundle: './build/public/client/main.js',
	bundleBuild: './build/public/client/',
	public: './public/**/*.*',
}

gulp.task('clean', (cb) ->
	del([paths.build], cb);
)

gulp.task('public', ['clean'], ->
	gulp.src(paths.public, { base: './' })
		.pipe(gulp.dest(paths.build))
)

gulp.task('coffee', ['public'], ->
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
	gulp.watch(paths.src, ['browserify'])
)

gulp.task('default', ->
	gulp.start 'watch'
)