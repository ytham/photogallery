module PhotosHelper

  def remove_underscores(name)
    no_underscores = name.gsub("_", " ")
  end

  def make_title(name)
    title = remove_underscores(name).upcase
  end

  def add_extension(name)
    name_with_extension = name + ".jpg"
  end

  def quicknav_fn
    nav_array = []
    if @photos.count > 5      
      case
      when @photo == Photo.last # Leftmost photo
        nav_array = [@photo]
        nav_array += Photo.find(:all, conditions: ["id < ?", @photo.id], order: "id desc", limit: 4)
      when @photo.next == Photo.last # One from the left
        nav_array = [Photo.last, @photo] 
        nav_array += Photo.find(:all, conditions: ["id < ?", @photo.id], order: "id desc", limit: 3)
      when @photo.previous == Photo.first # One from the right
        nav_array = Photo.find(:all, conditions: ["id > ?", @photo.id], order: "id asc", limit: 3).reverse
        nav_array += [@photo, Photo.first]
      when @photo == Photo.first # Rightmost photo
        nav_array = Photo.find(:all, conditions: ["id > ?", @photo.id], order: "id asc", limit: 4).reverse
        nav_array += [@photo]
      else 
        nav_array = Photo.find(:all, conditions: ["id > ?", @photo.id], order: "id asc", limit: 2).reverse
        nav_array += [@photo]
        nav_array += Photo.find(:all, conditions: ["id < ?", @photo.id], order: "id desc", limit: 2)
      end  
    else
      nav_array = @photos.reverse
    end
    #nav_array.order("id desc")
  end
  
  def show_avatar_thumb
    if !@photo.user.avatar.blank?
      @photo.user.avatar_url(:thumb)
    else
      'default_avatar_thumb.jpg'
    end
  end

end
