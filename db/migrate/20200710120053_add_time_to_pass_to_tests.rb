class AddTimeToPassToTests < ActiveRecord::Migration[6.0]
  def change
  	add_column :tests, :time_to_pass, :string
  end
end
