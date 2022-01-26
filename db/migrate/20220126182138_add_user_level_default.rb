class AddUserLevelDefault < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:users, :level, 0)
    change_column_default(:users, :points, 0)
  end
end
