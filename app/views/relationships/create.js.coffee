$(".follow_link").html "<%= escape_javascript(render 'follow') %>"
$(".followers_number").change "<%= escape_javascript(@user.id) %>"