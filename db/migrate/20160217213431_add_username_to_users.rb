class AddUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string #add username to users collumn of database

    add_index :users, :username, unique: true #add username to index page
  	
  end
end
