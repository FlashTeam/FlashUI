_          = require 'underscore'
Backbone   = require 'backbone'
Backbone.$ = require 'jquery'

module.exports = Backbone.View.extend

  template: require '../templates/message.jade'
  events:
    'click .up': 'upVote'
    'click .down': 'downVote'

  initialize: (options) ->
    @model = options.model
    @options = options

    @listenTo @model, 'change', ->
      @render()

  getCtx: ->
    message: @model.toJSON()

  render: ->
    @$el.html(@template(@getCtx()))

  postRender: ->
    @

  upVote: ->
    $.post "http://localhost:8080/posts/"+@model.get('id')+"/vote/up", ( data ) =>
      @model.set(data)

  downVote: ->
    $.post "http://localhost:8080/posts/"+@model.get('id')+"/vote/down", ( data ) =>
      @model.set(data)

