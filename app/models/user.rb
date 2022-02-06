class User < ApplicationRecord
  has_many :test_users
  has_many :tests, through: :test_users
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id

  validates :name, :email, presence: true

  def user_level_tests(level)
    tests.where(level: level)
  end

end
