_          = require 'underscore'
Backbone   = require 'backbone'
Backbone.$ = require 'jquery'

class Message extends Backbone.Model

  urlRoot: ->
    "http://localhost:8080/posts/"+@id

module.exports = Message
