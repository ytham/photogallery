# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $("span").fadeTo("fast",0.5)
  $("span").hover (->
    $(this).fadeTo("fast",1)
  ), ->
    $(this).fadeTo("slow,",0.5)
  $("#leftarrow").click ->
    $("img").slideUp(400)    
