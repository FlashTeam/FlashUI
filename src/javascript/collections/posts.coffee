_          = require 'underscore'
Backbone   = require 'backbone'
Backbone.$ = require 'jquery'
Post    = require '../models/post'

class Posts extends Backbone.Collection
  model: Post

  url: ->
    "http://localhost:8080/posts"

  initialize: (models, options) ->
    @options = options

  comparator: (post) ->
    -post.get('time')

module.exports = Posts
