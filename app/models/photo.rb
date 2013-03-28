class Photo < ActiveRecord::Base
  attr_accessible :caption, :name, :user_id

  belongs_to :user

  def next
    Photo.first(conditions: ["id > ?", id], order: "id asc")
  end

  def previous
    Photo.first(conditions: ["id < ?", id], order: "id desc")
  end

end
