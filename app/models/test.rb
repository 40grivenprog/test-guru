# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users
  belongs_to :creator, class_name: 'User'

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :test_by_category, ->(category_name) { joins('JOIN categories on tests.category_id = categories.id').where('categories.title = ?', category_name) }

  validates :title, presence: true,
                    uniqueness: { scope: :level }
  validates :level, numericality: { greater_than_or_equal_to: 0 }
end
