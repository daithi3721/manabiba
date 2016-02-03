favorite_icon = ->
  $("#favorite-link").click -> 
    $(this).children('i').toggleClass('glyphicon glyphicon-heart-empty')
    
$(document).on('page:change', favorite_icon)