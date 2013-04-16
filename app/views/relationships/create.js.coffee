$(".follow_link").html "<%= escape_javascript(render 'follow') %>"
$(".followers_number").html "<%= @user.followers.count %>"
