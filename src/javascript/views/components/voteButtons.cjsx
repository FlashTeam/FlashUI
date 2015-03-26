React = require 'react'
Button = require('react-bootstrap').Button
ButtonGroup = require('react-bootstrap').ButtonGroup
AwesomeIcon = require './awesomeIcon.cjsx'

VoteButtons = React.createClass
  displayName: 'VoteButtons'
  propTypes:
      voteCount: React.PropTypes.number.isRequired
      model: React.PropTypes.object.isRequired

  shouldComponentUpdate: (nextProps, nextState) ->
    @props.voteCount isnt nextProps.voteCount

  render: ->
    <ButtonGroup className="vote-group">
      <Button bsStyle="danger" onClick={@downVote}>
        <AwesomeIcon iconName="fa-thumbs-o-down" extraClasses={["vote"]} />
      </Button>
      <Button bsStyle="primary">
        {@props.voteCount}
      </Button>
      <Button bsStyle="success"onClick={@upVote}>
        <AwesomeIcon iconName="fa-thumbs-o-up" extraClasses={["vote"]} />
      </Button>
    </ButtonGroup>

  upVote: ->
    $.post "http://localhost:8080/posts/"+@props.model.get('id')+"/vote/up", ( data ) =>
      @props.model.set(data)

  downVote: ->
    $.post "http://localhost:8080/posts/"+@props.model.get('id')+"/vote/down", ( data ) =>
      @props.model.set(data)


module.exports = VoteButtons
