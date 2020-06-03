# frozen_string_literal: true

class TestPassage < ApplicationRecord
  SUCCES_RESULT = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  default_scope { order(:id) }

  before_validation :set_first_question, on: :create
  after_touch :set_next_question

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def complete?
    next_question.nil?
  end

  def calculate_question_number
    self.test.questions.index(current_question) + 1
  end

  def succes?
    calculate_statistic > SUCCES_RESULT
  end

  def calculate_statistic
    (self.correct_questions * 100) / self.test.questions.length
  end

  private

  def set_next_question
    self.current_question = next_question
    save!
  end

  def set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def next_question
    test.questions.where('id > ?', current_question.id).first
  end

  def correct_answer?(answer_ids)
    correct_answer_ids = current_question.answers.correct.pluck(:id).sort
    answers = !answer_ids ? [] : answer_ids.map(&:to_i).sort
    correct_answer_ids == answers
  end
end
