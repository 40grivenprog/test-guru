# frozen_string_literal: true

class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests,  class_name: 'Test', foreign_key: :creator_id

  validates :email, presence: true

  def test_by_level(level)
    Test.joins('JOIN tests_users ON tests.id = tests_users.test_id').where('tests_users.user_id = ? and tests.level = ?', id, level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
