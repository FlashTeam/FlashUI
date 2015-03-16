_          = require 'underscore'
Backbone   = require 'backbone'
Backbone.$ = require 'jquery'
Posts =  require './collections/posts'
ResultsView =  require './views/resultsView'

class Router extends Backbone.Router

  routes:
    '(/)':                    'index'

  index: ->
    posts = new Posts([], {})
    posts.fetch().done =>
      view = new ResultsView
        el: 'body'
        posts: posts

module.exports = Router
