class AddUserIdAndPhotoIdToLikes < ActiveRecord::Migration
  def change
    add_column :likes, :user_id, :integer
    add_column :likes, :photo_id, :integer
  end
end
