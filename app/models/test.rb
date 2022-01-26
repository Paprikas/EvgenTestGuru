class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :test_users
  has_many :users, through: :test_users

  def self.tests_by_category(name_category)
    joins(:category).where('category.title = ?', name_category).order(title: :desc).pluck(:title)
  end
end
