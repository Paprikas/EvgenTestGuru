require 'digest/sha1'

class User < ApplicationRecord

  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id

  validates :email, presence: true,
                    format: { with: VALID_EMAIL },
                    uniqueness: { case_sensitive: false }

  has_secure_password

  def user_level_tests(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end 
  
end
