class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.integer :level, default: 0
      t.integer :points, default: 0

      t.timestamps
    end
  end
end
