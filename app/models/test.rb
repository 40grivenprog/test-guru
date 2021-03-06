# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  has_many :test_passages, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :users, through: :test_passages
  belongs_to :creator, class_name: 'User'

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :test_category, -> { joins('JOIN categories on tests.category_id = categories.id') }

  validates :title, presence: true,
                    uniqueness: { scope: :level }
  validates :time_to_pass, presence: true
  validates :level, numericality: { greater_than_or_equal_to: 0 }

  private

  def self.test_by_categories(category_name)
    test_category.where('categories.title = ?', category_name).order(title: :desc).pluck(:title)
  end
end
