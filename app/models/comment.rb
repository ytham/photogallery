class Comment < ActiveRecord::Base
  attr_accessible :content, :photo_id, :user_id

  belongs_to :user
  belongs_to :photo

  validates_presence_of :user_id
  validates_presence_of :photo_id
  validates_presence_of :content

  validates :content, length: { 
    minimum: 2,
    maximum: 1024,
    too_short: "is too short.",
    too_long: "is more than 1024 characters" 
  }
end
