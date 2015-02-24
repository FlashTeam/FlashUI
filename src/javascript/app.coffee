_          = require 'underscore'
Backbone   = require 'backbone'
Router =  require './router'

router = new Router

Backbone.history.start
  pushState: true,
  root: '/'

router
