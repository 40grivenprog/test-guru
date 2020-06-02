# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :question_scope

  scope :correct, -> { where(correct: true) }

  private

  def question_scope
    if question.answers.length > 4
      errors.messages[:question_scope] << 'Can not be more then 4 answers for one question.'
    end
  end
end
