# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $("span").fadeTo("slow",0.6)
  $("span").hover (->
    $(this).fadeTo("fast",1)
  ), ->
    $(this).fadeTo("slow",0.6)
  $("#leftarrow").fadeTo("slow",0.5)
  $("#leftarrow").hover (->
    $(this).fadeTo("fast",1)
  ), ->
    $(this).fadeTo("slow",0.5)
  $("#rightarrow").fadeTo("slow",0.5) 
  $("#rightarrow").hover (->
    $(this).fadeTo("fast",1)
  ), ->
    $(this).fadeTo("slow",0.5)
