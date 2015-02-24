_          = require 'underscore'
Backbone   = require 'backbone'
Backbone.$ = require 'jquery'
MessageView = require './message'

module.exports = Backbone.View.extend

  template: require '../templates/results.jade'

  initialize: (options) ->
    @options = options
    @posts = @options.posts
    @render()

  getCtx: ->
    title: "Flash Posts"

  render: ->
    @$el.html(@template(@getCtx()))
    @postRender()

  postRender: ->
    for message in @posts.models
      if message.get('message') isnt "" or message.get('attachment') is "1"
        Message = new MessageView
          model: message

        $('.chat').append(Message.render())
        Message.postRender()

