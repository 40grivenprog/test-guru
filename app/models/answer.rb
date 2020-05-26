# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :question_scope

  private

  def question_scope
    errors.messages[:question_scope] << 'Not uniq!' if question.answers.length >= 4
  end
end
