module CommentsHelper

  def show_comments_avatar_thumb(c)
    if !c.user.avatar.blank?
      c.user.avatar_url(:thumb)
    else
      'default_avatar_thumb.jpg'
    end
  end

end
