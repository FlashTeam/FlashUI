_          = require 'underscore'
Backbone   = require 'backbone'
Backbone.$ = require 'jquery'
PostView = require './postView'

class ResultsView extends Backbone.View

  template: require '../templates/results.jade'

  initialize: (options) ->
    @options = options
    @posts = @options.posts
    @children = []
    @render()

    @listenTo @posts, 'add', (post) ->
      Post = new PostView
        model: post

      $('.posts').prepend(Post.render())
      Post.postRender()

    @interval = setInterval =>
      @posts.fetch({remove: false})
    , 60000

  getCtx: ->
    title: "Flash Posts"

  render: ->
    @$el.html(@template(@getCtx()))
    @postRender()

  postRender: ->
    for post in @posts.models
      Post = new PostView
        model: post

      $('.posts').append(Post.render())
      Post.postRender()
      @children.push(Post)

  remove: ->
    super
    for child in @children
      child.remove()
    clearInterval(@interval)

module.exports = ResultsView
