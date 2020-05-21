# frozen_string_literal: true

class Test < ApplicationRecord
  def self.test_by_categories(category_name)
    Test.joins('JOIN categories on tests.category_id = categories.id').where('categories.title = ?', category_name).order(title: :desc).pluck(:title)
  end
end
