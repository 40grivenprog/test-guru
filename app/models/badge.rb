# frozen_string_literal: true

class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :title, presence: true
  validates :image, presence: true
  validates :badge_type, presence: true

  def self.set_title(badge_params, additional)
    case badge_params[:badge_type]
    when 'Success Passing'
      'You succesfully passed test: ' + additional[:additional_title]
    when 'Success Passing Category'
      'You succesfully passed all tests from category: ' + additional[:additional_category]
    when 'Success Passing by Level'
      'You succesfully passed all tests by level: ' + additional[:additional_level]
    end
   end
end
