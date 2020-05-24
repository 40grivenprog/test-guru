# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :test
  has_many :answers
  validates :body, presence: true
  validate :valid_answers_number?

  private

  def valid_answers_number?
    number_of_answers = answers.length
    errors.add(:answers) if number_of_answers < 1 || number_of_answers > 4
  end
end
