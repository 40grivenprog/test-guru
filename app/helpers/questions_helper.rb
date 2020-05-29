# frozen_string_literal: true

module QuestionsHelper
  def question_header(param, test_title)
    case param
    when 'edit'
      "Edit #{test_title} Question"
    when 'new'
      "Create New #{test_title} Question"
    end
  end
end
