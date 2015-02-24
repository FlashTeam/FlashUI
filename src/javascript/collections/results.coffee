_          = require 'underscore'
Backbone   = require 'backbone'
Backbone.$ = require 'jquery'
Message    = require '../models/message'

class Results extends Backbone.Collection
  model: Message

  url: ->
    "http://localhost:8080/posts"

  initialize: (models, options) ->
    @options = options

  comparator: (message) ->
    -message.get('time')

module.exports = Results
