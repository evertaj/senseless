$(document).ready () ->
  $(document).on 'click', '.likes_counter', () ->
    $like = $(@).find('.likes_val')
    $img = $(@).find('.like_img')
    id = $like.data('id')
    $.ajax
      type: "GET",
      url: '/posts/'+id+'/like',
      dataType: 'json'
      error: (jqXHR, textStatus, errorThrown) ->
        console.log "AJAX Error: #{textStatus}"
      success: (data, textStatus, jqXHR) ->
          if $img.hasClass("not_liked")
            $img.removeClass("not_liked")
            $('.current_like_avatar').fadeToggle("fast")
          else
            $img.addClass("not_liked")
            $('.current_like_avatar').fadeToggle("fast")
          $like.text("#{data.likes_count}")
          $('.likes_counter').blur()

  $('.hover_this').mouseenter () ->
    $(@).find('.who_likes').fadeToggle("fast")

  $('.hover_this').mouseleave () ->
    $(@).find('.who_likes').fadeToggle("fast")