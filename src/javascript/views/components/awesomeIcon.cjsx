React = require 'react'
_ = require 'underscore'

AwesomeIcon = React.createClass
  displayName: 'AwesomeIcon'
  propTypes:
      iconName: React.PropTypes.string.isRequired
      extraClasses: React.PropTypes.array

  componentWillMount: ->
    @classes = "fa #{@props.iconName}"
    for extraClass in @props.extraClasses?
      @classes += " #{extraClass}"

  shouldComponentUpdate: (nextProps, nextState) ->
    @props.iconName isnt nextProps.iconName or _.difference(@props.extraClasses, nextProps.extraClasses).length > 0

  render: ->
    <i className={@classes}></i>

module.exports = AwesomeIcon
