React = require 'react'
_ = require 'underscore'

Paragraph = React.createClass
  displayName: 'Paragraph'
  propTypes:
      text: React.PropTypes.string.isRequired
      extraClasses: React.PropTypes.array

  componentWillMount: ->
    @classes = ""
    for extraClass in @props.extraClasses?
      @classes += " #{extraClass}"

  shouldComponentUpdate: (nextProps, nextState) ->
    @props.text isnt nextProps.text or _.difference(@props.extraClasses, nextProps.extraClasses).length > 0

  render: ->
    <p className={@classes}>
      {@props.text}
    </p>

module.exports = Paragraph
