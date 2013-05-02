class Photo < ActiveRecord::Base
  attr_accessible :caption, :name, :user_id, :image #, :remote_image_url
  mount_uploader :image, ImageUploader
  #before_validation :upload_and_remote

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :user_id
  validates_presence_of :image, unless: :remote_image_url

  def self.per_page
    30
  end

  def next
    Photo.first(conditions: ["id > ?", id], order: "id asc")
  end

  def previous
    Photo.first(conditions: ["id < ?", id], order: "id desc")
  end

  private

    def upload_and_remote
      if self.image.present? && self.remote_image_url.present?
        #self.remote_image_url = ""
        self.image = nil
        logger.debug "@@@@ image: #{image}"
        logger.debug "@@@@ riu: #{remote_image_url}"
      end
    end

end
