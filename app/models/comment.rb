class Comment < ActiveRecord::Base
  attr_accessible :content, :photo_id, :user_id

  belongs_to :user
  belongs_to :photo

  validates_presence_of :user_id
  validates_presence_of :photo_id
  validates_presence_of :content
end
