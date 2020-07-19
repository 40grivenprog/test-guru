57 # frozen_string_literal: true

class TestPassage < ApplicationRecord
  SUCCES_RESULT = 85

  attr_accessor :complete

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  default_scope { order(:id) }

  before_validation :set_first_question, on: :create
  # after_touch :set_next_question

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    self.current_question = next_question
    save
  end

  def restart
    set_first_question
    self.correct_questions = 0
    save!
  end

  def check_results
    self.success = true if success?
    attemp ? self.attemp += 1 : self.attemp = 1
    test_title = self.test.title
    test_level = self.test.level
    test_cat = self.test.category.title
    success_badge = Badge.find_by(title: "You succesfully passed test: #{test_title}")
    success_cat_badge = Badge.find_by(title: "You succesfully passed all tests from category: #{test_cat}")
    success_level_badge = Badge.find_by(title: "You succesfully passed all tests by level: #{test_level}")
    add_success_badge(success_badge) if success_badge
    add_success_cat_badge(success_cat_badge) if success_cat_badge
    add_success_level_badge(success_level_badge) if success_level_badge
    save!
  end

  def add_success_badge(success_badge)
    user.badges << success_badge if success? && self.attemp == 1
  end

  def add_success_cat_badge(success_cat_badge)
    if (user.test_passages.where(success: true).pluck(:test_id) - self.test.category.tests.pluck(:id)).empty?
      unless user.badges.include?(success_cat_badge)
        user.badges << success_cat_badge
      end
    else
      user.badges.destroy(success_cat_badge)
    end
  end

  def add_success_level_badge(success_level_badge)
    if (user.test_passages.where(success: true).pluck(:test_id) - Test.all.where(level: self.test.level).pluck(:id)).empty?
      unless user.badges.include?(success_level_badge)
        user.badges << success_level_badge
      end
    else
      user.badges.destroy(success_level_badge)
    end
  end

  def complete?
    current_question.nil?
  end

  def calculate_question_number
    self.test.questions.index(current_question) + 1
  end

  def success?
    calculate_statistic > SUCCES_RESULT
  end

  def calculate_statistic
    (self.correct_questions * 100) / self.test.questions.length
  end

  private

  def set_first_question
    self.time_started = Time.now.utc
    self.current_question = test.questions.first if test.present?
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def correct_answer?(answer_ids)
    correct_answer_ids = current_question.answers.correct.pluck(:id).sort
    answers = !answer_ids ? [] : answer_ids.map(&:to_i).sort
    correct_answer_ids == answers
  end
end
