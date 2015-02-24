var gulp = require('gulp');
var sass = require('gulp-ruby-sass');
var handleErrors = require('../util/handleErrors');
var browserSync  = require('browser-sync');
var sftp = require('gulp-sftp');

gulp.task('sass', ['images'], function () {
  return gulp.src('src/sass/*.{sass, scss}')
    .pipe(sass({
      compass: true,
      bundleExec: true,
      sourcemap: true,
      sourcemapPath: '../sass'
    }))
    .on('error', handleErrors)
    .pipe(gulp.dest('build'))
    // .pipe(sftp({
    //         host: 'friss.me',
    //         user: 'root',
    //         pass: 'Dr3amsUnlimit3d',
    //         port: '55555',
    //         remotePath: '/var/www/friss.me/web/dev/chat/'
    //     }))
    ;
});
