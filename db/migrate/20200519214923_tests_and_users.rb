# frozen_string_literal: true

class TestsAndUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :tests_users do |t|
      t.references :user, foreign_key: true
      t.references :test, foreign_key: true
    end
end
end
