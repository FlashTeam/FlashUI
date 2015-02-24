_          = require 'underscore'
Backbone   = require 'backbone'
Backbone.$ = require 'jquery'
Results =  require './collections/results'
ResultsView =  require './views/results'

ONE_MINUTE = 6000

module.exports = Backbone.Router.extend

  routes:
    '(/)':                    'index'
    'results(/):query(/)':    'results'

  index: ->
    results = new Results([], {})
    results.fetch().done =>
      view = new ResultsView
        el: 'body'
        posts: results
