FlashUI
============



### Testing
```
cd build
```

Python v2.7
```
python -m SimpleHTTPServer
```

Python v3.2
```
python -m http.server
```

Then head to
```
http://localhost:8000
```




### Setting Up Dev

If you've never used Node or npm before, you'll need to install Node.
If you use homebrew, do:

```
brew install node
```

Otherwise, you can download and install from [here](http://nodejs.org/download/).

### Install Gulp Globally

Gulp must be installed globally in order to use the command line tools. *You may need to use `sudo`*


```
npm install -g gulp
```

Alternatively, you can run the version of gulp installed local to the project instead with


```
./node_modules/.bin/gulp
```

### Install Sass and Compass (if you haven't already)


The gulp-compass module relies on Compass already being installed on your system.

If you have bundler installed, simply run bundle to install dependencies from the `Gemfile`


```
bundle
```

Otherwise,


```
gem install sass
gem install compass --pre
```

### Install npm dependencies

```
npm install
```

This runs through all dependencies listed in `package.json` and downloads them
to a `node_modules` folder in your project directory.

### Run gulp and be amazed.

```
gulp
```

This will run the `default` gulp task defined in `gulp/tasks/default.js`, which does the following:
- Run 'watch', which has 2 task dependencies, `['setWatch', 'browserSync']`
- `setWatch` sets a variable that tells the browserify task whether or not to use watchify.
- `browserSync` has `build` as a task dependecy, so that all your assets will be processed before browserSync tries to serve them to you in the browser.
- `build` includes the following tasks: `['browserify', 'sass', 'images', 'markup']`
