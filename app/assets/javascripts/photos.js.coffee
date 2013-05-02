# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/  

$(document).ready ->
  #$("#upload_tabs").tabs()

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
    $(this).stop().fadeTo("fast",1.0)
  ), ->
    $(this).stop().fadeTo("slow",0.0)
    
  $("#galleryimage").hover (->
    $(".rightarrow").stop().fadeTo("fast",1.0)
  ), ->
    $(".rightarrow").stop().fadeTo("slow",0.0)

  $(".rightarrow").hover (->
    $(this).stop().fadeTo("fast",1.0)
  ), ->
    $(this).stop().fadeTo("slow",0.0)

  #$("#leftarrow").click ->
  #  $("main").fadeOut "fast"
  #$("#rightarrow").click ->
  #  $("main").fadeOut "fast"

  $("body").click ->
    $("#success_messages").fadeOut "slow"

  #upload_value = $(".upload_image_field").val()
  #paste_value = $(".paste_url_field").val()
  #$(".upload_photo_button").click ->
  #  alert(upload_value)
    #if upload_value? && paste_value?
    #  $(".paste_url_field").val ""



