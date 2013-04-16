$(".comments").html("<%= escape_javascript(render 'comments/comments') %>")
$(".comment_content").val ""