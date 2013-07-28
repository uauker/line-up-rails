class CreateUser < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.date      :event_date
      t.integer   :facebook_user_id
      t.string    :facebook_name
      t.datetime  :created_at
    end
    
    add_index :users, :event_date
    add_index :users, :facebook_user_id    
    add_index :users, [:event_date, :facebook_user_id], :unique => true
  end

  def down
    drop_table :users
  end
end
