# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :test
  has_many :answers
  validates :body, presence: true
  validate :valid_answers_number?
  validates_length_of :answers, minimum: 1, maximum: 4
end
