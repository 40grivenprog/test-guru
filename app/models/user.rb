# frozen_string_literal: true
require 'digest/sha1'
class User < ApplicationRecord

  include Auth

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests,  class_name: 'Test', foreign_key: :creator_id

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :name, presence: true
  validates :password, presence: true, if: Proc.new{ |u| u.password_digest.blank? }
  validates :password, confirmation: true

  def test_by_level(level)
    Test.joins('JOIN tests_users ON tests.id = tests_users.test_id').where('tests_users.user_id = ? and tests.level = ?', id, level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

end
