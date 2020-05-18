class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email

      t.timestamps
    end
    change_column_null(:users, :email, false)
  end
end
