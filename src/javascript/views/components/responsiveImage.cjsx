React = require 'react'

ResponsiveImage = React.createClass
  displayName: 'ResponsiveImage'
  propTypes:
      imageName: React.PropTypes.string.isRequired

  componentWillMount: ->
    @imageFile = "https://flashimg.s3.amazonaws.com/"+@props.imageName

  shouldComponentUpdate: (nextProps, nextState) ->
    @props.imageName isnt nextProps.imageName

  render: ->
    <div className="post-img">
      <img src={@imageFile} className="img-responsive" />
    </div>


module.exports = ResponsiveImage
