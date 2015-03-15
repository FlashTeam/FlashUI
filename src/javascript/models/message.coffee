_          = require 'underscore'
Backbone   = require 'backbone'
Backbone.$ = require 'jquery'
moment = require 'moment'

class Message extends Backbone.Model

  urlRoot: ->
    "http://localhost:8080/posts/"+@id

  parse: (json) ->
    json.formatedTime = moment(json.time).calendar()
    json

module.exports = Message
