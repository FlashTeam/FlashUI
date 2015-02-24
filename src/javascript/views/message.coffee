_          = require 'underscore'
Backbone   = require 'backbone'
Backbone.$ = require 'jquery'

module.exports = Backbone.View.extend

  template: require '../templates/message.jade'

  initialize: (options) ->
    @model = options.model
    @options = options

  getCtx: ->
    message: @model.toJSON()

  render: ->
    @$el.html(@template(@getCtx()))

  postRender: ->


