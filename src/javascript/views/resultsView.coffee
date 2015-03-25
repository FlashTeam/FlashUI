Backbone   = require 'backbone'
Backbone.$ = require 'jquery'
React      = require 'react'

Post = require './components/post.cjsx'

class ResultsView extends Backbone.View

  template: require '../templates/results.jade'

  initialize: (options) ->
    @options = options
    @posts = @options.posts
    @children = []
    @render()

    @listenTo @posts, 'add change', (post) ->
      @postRender()

    @interval = setInterval =>
      @posts.fetch({remove: false})
    , 60000

  getCtx: ->
    title: "Flash Posts"

  render: ->
    @$el.html(@template(@getCtx()))
    @postRender()

  postRender: ->
    posts = @posts.map (model) ->
      <Post model={model} key={model.id} />

    React.render(
      <div className="posts">
        {posts}
      </div>
      ,
      @$('.posts-container').get(0)
    )

  remove: ->
    super
    React.unmountComponentAtNode(@$('.posts-container').get(0))
    clearInterval(@interval)

module.exports = ResultsView
