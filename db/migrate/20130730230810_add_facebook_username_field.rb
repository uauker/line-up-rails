class AddFacebookUsernameField < ActiveRecord::Migration
  def up
    add_column :users, :facebook_username, :string
  end

  def down
    remove_column :users, :facebook_username    
  end
end
