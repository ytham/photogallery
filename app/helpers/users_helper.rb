module UsersHelper

  def list_all_photos(user_id)
    list = Photos.find_all_by_user_id(user_id)
  end
  
  def show_avatar
    if !@user.avatar.blank?
      @user.avatar_url
    else
      'default_avatar.jpg'
    end
  end
  
end
