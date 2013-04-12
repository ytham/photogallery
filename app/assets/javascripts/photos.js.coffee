# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/  

$(document).ready ->
  $(".nav_elem").fadeTo("slow",0.6)
  $(".nav_elem").hover (->
    $(this).fadeTo("fast",1)
  ), ->
    $(this).fadeTo("slow",0.6)
    
  $(".quicknav_image").fadeTo("slow", 0.6)
  $(".quicknav_image").hover (->
    $(this).fadeTo("fast",1)
  ), ->
    $(this).fadeTo("slow",0.6)
    
  $(".show_all").fadeTo(0, 0.7)
  $(".show_all").hover (->
    $(this).fadeTo("fast",1)
  ), ->
    $(this).fadeTo("slow",0.7)
    

  $(".leftarrow").fadeTo(1000,0.0)
  $(".rightarrow").fadeTo(1000,0.0) 

    
  $(".leftarrow").hover (->
    $(this).stop().fadeTo("fast",0.8)
  ), ->
    $(this).stop().fadeTo("slow",0.0)
    
  $(".rightarrow").hover (->
    $(this).stop().fadeTo("fast",0.8)
  ), ->
    $(this).stop().fadeTo("slow",0.0)

  #$("#leftarrow").click ->
  #  $("main").fadeOut "fast"
  #$("#rightarrow").click ->
  #  $("main").fadeOut "fast"

  $("body").click ->
    $("#success_messages").fadeOut "slow"