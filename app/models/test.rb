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
  scope :test_by_category, ->(category_name) { joins('JOIN categories on tests.category_id = categories.id').where('categories.title = ?', category_name).order(title: :desc).pluck(:title) }
  validates :title, presence: true
  validates :level, numericality: { greater_than_or_equal_to: 0 }
  validate :uniq_test?

  private

  def uniq_test?
    not_uniq_tests = Test.where('title = ? and level = ?', title, level)
    errors.messages[:test] << 'not uniq!' unless not_uniq_tests.empty?
  end
end
