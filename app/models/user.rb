class User < ApplicationRecord
  has_many :test_users
  has_many :tests, through: :test_users
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id

  scope :user_level_tests, -> (level, user_id)  {joins(:tests).where('tests.level = ? and test_users.user_id = ?', level, user_id )}

  validates :name, :email, presence: true

end
