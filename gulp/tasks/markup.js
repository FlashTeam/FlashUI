var gulp = require('gulp');
var sftp = require('gulp-sftp');

gulp.task('markup', function() {
  return gulp.src('src/htdocs/**')
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
