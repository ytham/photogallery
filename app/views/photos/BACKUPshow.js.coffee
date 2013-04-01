ajaxload = (file) ->
  $.get file, (data) ->
    $("#mainSection").fadeOut "slow", ->
      $(this).html(data).fadeIn "slow"

$(document).ready ->
#  $(".rightclick").mouseover ->
#    $("main").html "<%= escape_javascript(render partial: 'photo') %>"

  $("#rightclick").on "click", "div", (event) ->
    event.preventDefault()
    $("#mainSection").fadeOut "fast", ->
      $("main").html "<%= j(render partial: 'photo') %>"
      false
  
  $("#leftclick").on "mouseover", "div", (event) ->
    $("main").prepend "Prepend."
    #$("#mainSection").fadeOut "fast", ->
    #  $("main").html("<%= j(render partial: 'photo') %>")      
    #  false
      

#  $(".rightclick").click ->
#    $("main").ajaxload("<%= escape_javascript(render partial: 'photo') %>")
#    false

#  $("#leftclick").click ->
#    $("main").html("<%= escape_javascript(render partial: 'photo', locals: { id: @photo.next }) %>")
#    false
