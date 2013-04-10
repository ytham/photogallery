class Photo < ActiveRecord::Base
  attr_accessible :caption, :name, :user_id, :image, :remote_image_url
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :user_id
  validates_presence_of :image or :remote_image_url # Fix this

  def next
    Photo.first(conditions: ["id > ?", id], order: "id asc")
  end

  def previous
    Photo.first(conditions: ["id < ?", id], order: "id desc")
  end

end
