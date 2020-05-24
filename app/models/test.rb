# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users
  belongs_to :creator, class_name: 'User'
  def self.test_by_categories(category_name)
    Test.joins('JOIN categories on tests.category_id = categories.id').where('categories.title = ?', category_name).order(title: :desc).pluck(:title)
  end
end
