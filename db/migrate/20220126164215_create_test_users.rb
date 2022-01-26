class CreateTestUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :test_users do |t|
      t.references :test
      t.references :user
      t.timestamps
    end
  end
end
