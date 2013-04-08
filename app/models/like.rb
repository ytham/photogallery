class Like < ActiveRecord::Base
  attr_accessible :photo_id, :user_id
  
  belongs_to :user
  belongs_to :photo

  validates :user_id, presence: true
  validates :photo_id, presence: true
end
