# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $messages = $('messages')
  $messages.scrollTop $messages.prop('scrollHeight')
  $('#message_input').focus()

$(document).on 'keypress', '#message_input', (e) ->
  if e.keyCode == 13 and e.target.value
    App.room.speak(e.target.value)
    e.target.value = ''
    e.preventDefault()

$(document).on 'click', '.sticker_popup_btn', (e) ->
  $('.sticker_popup').fadeToggle()
  $('.sticker').on 'click', (e)  ->
    $st_url = $(@).find('img').attr('src')
    stick = "<img src='#{$st_url}' />"
    App.room.speak(stick)
    $('.sticker_popup').toggle()
    e.preventDefault()