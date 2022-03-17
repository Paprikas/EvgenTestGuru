class DropTableTestUsers < ActiveRecord::Migration[7.0]
  def up
    drop_table :test_users, if_exists: true    
  end

  def down
  end  
end
