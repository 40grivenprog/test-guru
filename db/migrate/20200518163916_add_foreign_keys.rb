class AddForeignKeys < ActiveRecord::Migration[6.0]
  def change
  	add_column(:tests, :category_id, :integer)
  	add_column(:questions, :test_id, :integer)
  	add_column(:answers, :question_id, :integer)
  	add_foreign_key(:tests, :categories)
  	add_foreign_key(:questions, :tests)
  	add_foreign_key(:answers, :questions)
  end
end
