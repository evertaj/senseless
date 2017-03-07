# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready () ->
  $("form").on "keypress", (e) ->
    if e.keyCode == 13
      false

  tinymce.remove()
  tinymce.init {
    selector:'textarea#post_body',
    plugins: "image emoticons",
    skin: "custom",
    toolbar: "undo redo | styleselect | alignleft aligncenter alignright alignjustify | bold italic | emoticons image",
    height : 400
  }

  setTimeout () ->
    $('#flash').remove()
  , 3000
