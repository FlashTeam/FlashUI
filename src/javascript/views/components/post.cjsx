React = require 'react'
moment     = require 'moment'
Row = require('react-bootstrap').Row
Col = require('react-bootstrap').Col
ResponsiveImage = require './responsiveImage.cjsx'
VoteButtons = require './voteButtons.cjsx'
AwesomeIcon = require './awesomeIcon.cjsx'
Paragraph = require './paragraph.cjsx'

Post = React.createClass
  displayName: 'Post'
  propTypes:
      model: React.PropTypes.object.isRequired

  componentWillMount: ->
    @postDate = moment(@props.model.get('time')).calendar()
    @expires = moment(@props.model.get('timeout')).from(moment())

  render: ->
    <Row className="post">
      <Col md={8} mdOffset={2}>
        <ResponsiveImage imageName={@props.model.get('image')} />
        <div className="post-body">
          <div className="header">
            <strong className="username">
              {@props.model.get('username')}
            </strong>

            <VoteButtons voteCount={@props.model.get('vote')} model={@props.model} />

            <small className="pull-right text-muted">
              <AwesomeIcon iconName="fa-clock-o" />
              {@postDate}
            </small>

          </div>
          <Paragraph text={@props.model.get('comment')} />
          <Paragraph text={"Expires #{@expires}"} />
        </div>
      </Col>
    </Row>


module.exports = Post
