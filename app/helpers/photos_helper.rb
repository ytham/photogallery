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

end
