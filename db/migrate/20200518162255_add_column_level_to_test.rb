class AddColumnLevelToTest < ActiveRecord::Migration[6.0]
  def change
  	add_column(:tests, :level, :string)
  	change_column_null(:tests, :title, false)
  	change_column_default(:tests, :level, 1)
  end
end
