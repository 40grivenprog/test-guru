class AddCreatorIdToTests < ActiveRecord::Migration[6.0]
  def change
  	add_column :tests, :creator_id, :integer
  end
end
