var changed    = require('gulp-changed');
var gulp       = require('gulp');
var imagemin   = require('gulp-imagemin');
var sftp = require('gulp-sftp');

gulp.task('images', function() {
  var dest = './build/images';

  return gulp.src('./src/images/**')
    .pipe(changed(dest)) // Ignore unchanged files
    .pipe(imagemin()) // Optimize
    .pipe(gulp.dest(dest))
    // .pipe(sftp({
    //         host: 'friss.me',
    //         user: 'root',
    //         pass: 'Dr3amsUnlimit3d',
    //         port: '55555',
    //         remotePath: '/var/www/friss.me/web/dev/chat/images'
    // }))
    ;
});
