class RemoveAvatarFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :avatar
    add_attachment :users, :avatar
  end

  def down
  end
end
