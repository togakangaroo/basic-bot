#= require jquery
#= require bootstrap
#= require socket.io

$( ->
  # set up the socket.io
  socket = io.connect() 

  socket.on "connection", (msg) ->
    socket.emit "hello", "world"

  socket.on "feedback", (msg) ->
    $("#feedback").text msg

  $('.emitter').click (e)->
    $el = $(e.currentTarget)
    socket.emit $el.data('channel'), $el.data 'value'

)