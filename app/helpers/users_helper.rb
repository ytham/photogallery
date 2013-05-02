module UsersHelper

  def list_all_photos(user_id)
    list = Photos.find_all_by_user_id(user_id)
  end
  
  def show_avatar(u)
    if u.avatar.present?
      u.avatar_url
    else
      'default_avatar.jpg'
    end
  end

  def show_avatar_thumb(u)
    if u.avatar.present?
      u.avatar_url(:thumb)
    else
      'default_avatar_thumb.jpg'
    end
  end

  def likes?(photo)
    likes.find_by_photo(photo.id)
  end

  def like!(photo)
    likes.create!(photo_id: photo.id)
  end

  def unlike!(photo)
    likes.find_by_photo(photo.id).destroy
  end
  
end
