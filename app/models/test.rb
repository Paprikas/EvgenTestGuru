class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :test_users
  has_many :users, through: :test_users
  belongs_to :author, class_name: 'User'

  scope :easy, -> {where(level: 0..1)}
  scope :low, -> {where(level: 2..4)}
  scope :hard, -> {where(level:5..Float::INFINITY)}
  scope :tests_by_category, -> (name_category) {joins(:category).where('category.title = ?', name_category)}

  validates :title, presence: true
  validates :level, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :title, uniqueness: {scope: :level, messege: "A Test with the same title and level already exisis"}

  def self.sort_test_by_category(name_category)
    tests_by_category(name_category).order(title: :desc).pluck(:title)
  end

end
