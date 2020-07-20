class RemoveAttemp < ActiveRecord::Migration[6.0]
  def change
  	add_column :test_passages, :created_at, :datetime
    add_column :test_passages, :updated_at, :datetime
    remove_column :test_passages, :attemp
  end
end
