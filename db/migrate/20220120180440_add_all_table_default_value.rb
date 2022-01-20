class AddAllTableDefaultValue < ActiveRecord::Migration[7.0]
  def change
    add_column(:answers, :correct, :boolean)
    change_column_default(:tests, :level, 0)
    change_column_default(:answers, :correct, false)
  end
end
