class AddValueToBadge < ActiveRecord::Migration[6.0]
  def change
  	add_column :badges, :value, :string
  end
end
