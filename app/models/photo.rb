class Photo < ActiveRecord::Base
  attr_accessible :caption, :name

  def next
    Photo.first(conditions: ["id > ?", id], order: "id asc")
  end

  def previous
    Photo.first(conditions: ["id < ?", id], order: "id desc")
  end

end
