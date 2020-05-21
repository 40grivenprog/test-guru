# frozen_string_literal: true

class FixColumns < ActiveRecord::Migration[6.0]
  def change
    rename_column :tests, :categories_id, :category_id
    rename_column :questions, :tests_id, :test_id
    rename_column :answers, :questions_id, :question_id
  end
end
