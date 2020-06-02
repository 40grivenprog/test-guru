# frozen_string_literal: true

module TestPassagesHelper
  def succes?
    statistic = calculate_statistic
    statistic > 85
  end

  def calculate_statistic
    (@test_passage.correct_questions * 100) / @test_passage.test.questions.length
  end

  def calculate_question_number
    @test_passage.test.questions.index(@test_passage.current_question) + 1
  end
end
