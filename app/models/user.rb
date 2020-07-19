# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable

  has_many :gists
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests,  class_name: 'Test', foreign_key: :creator_id
  has_many :user_badges
  has_many :badges, through: :user_badges

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  def set_type
    raiser 'You must override this method in each model inheriting from Product!'
  end

  def admin?
    is_a?(Admin)
  end

  def test_by_level(level)
    Test.joins('JOIN tests_users ON tests.id = tests_users.test_id').where('tests_users.user_id = ? and tests.level = ?', id, level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
