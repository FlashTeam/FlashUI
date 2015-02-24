_          = require 'underscore'
Backbone   = require 'backbone'
Backbone.$ = require 'jquery'
Photo      = require './photo'

class Message extends Backbone.Model

  urlRoot: ->
    "http://localhost:8080/posts/"+@id

  parse: (json) ->
    json.time = parseInt(json.time, 10)
    json.id = parseInt(json.id, 10)
    json

module.exports = Message
