class AddNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string #add username to posts
  end
end
