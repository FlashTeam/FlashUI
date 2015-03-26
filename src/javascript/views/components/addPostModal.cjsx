React   = require 'react'
Row     = require('react-bootstrap').Row
Col     = require('react-bootstrap').Col
Modal   = require('react-bootstrap').Modal
Button = require('react-bootstrap').Button
Input = require('react-bootstrap').Input
ProgressBar = require('react-bootstrap').ProgressBar
Post    = require '../../models/post'
ErrorAlert = require './errorAlert.cjsx'

AddPostModal = React.createClass
  displayName: 'AddPostModal'

  getInitialState: ->
    file: ''
    comment: ''
    username: ''
    timeout: '60000'
    latitude: '0'
    longitude: '0'
    progress: 0
    error: false

  addPost: (evt) ->
    @setState(error: false)
    evt.preventDefault()
    formData = new FormData()
    formData.append("username", @state.username)
    formData.append("file",  @state.file)
    formData.append("comment",  @state.comment)
    formData.append("timeout",  @state.timeout)
    formData.append("latitude",  @state.latitude)
    formData.append("longitude",  @state.longitude)

    request = new XMLHttpRequest()
    request.upload.addEventListener("progress", @uploadProgress, false)
    request.addEventListener("load", @uploadComplete, false)
    request.addEventListener("error", @uploadFailed, false)
    request.addEventListener("abort", @uploadFailed, false)
    request.open("POST", "http://localhost:8080/posts");
    request.send(formData);


  uploadProgress: (evt) ->
    @setState(progress: Math.round(evt.loaded * 100 / evt.total))

  uploadComplete: (evt) ->
    response = JSON.parse(evt.target.responseText)
    if !response.status
      post = new Post(response)
      @props.posts.add(post)
      @props.onRequestHide()
    else
      @setState(error: true)
      @setState(progress: 0)

  uploadFailed: (evt) ->
    @setState(error: true)
    @setState(progress: 0)

  setFile: (evt) ->
    @setState(file: evt.target.files[0])

  setComment: (evt) ->
    @setState(comment: evt.target.value)

  setUsername: (evt) ->
    @setState(username: evt.target.value)

  setTimeout: (evt) ->
    @setState(timeout: evt.target.value)

  render: ->

    if @state.progress > 0
      progressBar = <ProgressBar active now={@state.progress} />
    else
      progressBar = ''

    if @state.error
     error = <ErrorAlert title="Something went wrong!" text="Please try again" />
    else
      error = ''

    <Modal {...this.props} bsStyle='primary' title='Add Post'>
      <div className="modal-body">
        <form className='form-horizontal' onSubmit={@addPost}>
          <Input type='file' onChange={@setFile} label='Image' labelClassName='col-xs-2' wrapperClassName='col-xs-10' />
          <Input type='textarea' onChange={@setComment} label='Comment' labelClassName='col-xs-2' wrapperClassName='col-xs-10' />
          <Input type='text' onChange={@setUsername} label='Username' labelClassName='col-xs-2' wrapperClassName='col-xs-10' />
          <Input type='select' onChange={@setTimeout} label='Expires in' labelClassName='col-xs-2' wrapperClassName='col-xs-10'>
            <option value='60000'>1 Minute</option>
            <option value='300000'>5 Minutes</option>
            <option value='600000'>10 Minutes</option>
            <option value='900000'>15 Minutes</option>
            <option value='1800000'>30 Minutes</option>
            <option value='3600000'>1 Hour</option>
            <option value='7200000'>2 Hour</option>
            <option value='21600000'>6 Hour</option>
            <option value='43200000'>12 Hour</option>
            <option value='86400000'>1 Day</option>
          </Input>
          <Input type="submit" className="pull-right" bsStyle="success" value="Add Post" wrapperClassName='col-xs-12' />
        </form>
        {progressBar}
        {error}
      </div>
    </Modal>


module.exports = AddPostModal
