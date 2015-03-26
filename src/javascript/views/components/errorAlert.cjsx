React = require 'react'
Alert = require('react-bootstrap').Alert

ErrorAlert = React.createClass
  displayName: 'ErrorAlert'
  propTypes:
      title: React.PropTypes.string.isRequired
      text: React.PropTypes.string.isRequired

  shouldComponentUpdate: (nextProps, nextState) ->
    @props.title isnt nextProps.title or @props.text isnt nextProps.text

  render: ->
    <Alert bsStyle='danger' onDismiss={this.handleAlertDismiss}>
      <h4>{@props.title}</h4>
      <p>{@props.text}</p>
    </Alert>


module.exports = ErrorAlert
