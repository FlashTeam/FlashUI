_          = require 'underscore'
Backbone   = require 'backbone'
Backbone.$ = require 'jquery'
moment     = require 'moment'

class PostView extends Backbone.View

  template: require '../templates/post.jade'
  events:
    'click .up': 'upVote'
    'click .down': 'downVote'

  initialize: (options) ->
    @model = options.model
    @options = options

    @listenTo @model, 'change', ->
      @render()

  getCtx: ->
    post: @model.toJSON()
    postDate: moment(@model.get('time')).calendar()
    expires: moment(@model.get('timeout')).from(moment())

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

module.exports = PostView
