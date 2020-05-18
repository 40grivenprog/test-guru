class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :body

      t.timestamps
    end
    change_column_null(:answers, :body, false)
  end
end
