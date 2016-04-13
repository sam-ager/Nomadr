class AddUserIdToPost < ActiveRecord::Migration
  def change
    add_column :posts, :user_id, :integer #add user.id to posts
  end
end
