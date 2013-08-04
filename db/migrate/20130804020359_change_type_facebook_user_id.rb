class ChangeTypeFacebookUserId < ActiveRecord::Migration
  def up
    remove_index :users, [:event_date, :facebook_user_id]
    
    change_column :users, :facebook_user_id, :string
    
    add_index :users, [:event_date, :facebook_user_id], :unique => true    
  end

  def down
    change_column :users, :facebook_user_id, :integer
    
    add_index :users, [:event_date, :facebook_user_id], :unique => true    
  end
end
