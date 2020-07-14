class AddTimeStartedToTestPassages < ActiveRecord::Migration[6.0]
  def change
  	add_column :test_passages, :time_started, :datetime
  end
end
