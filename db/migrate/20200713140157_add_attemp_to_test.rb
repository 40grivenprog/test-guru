class AddAttempToTest < ActiveRecord::Migration[6.0]
  def change
  	add_column :test_passages, :attemp, :integer
  end
end
