# frozen_string_literal: true

class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :title, presence: true
  validates :image, presence: true
  validates :badge_type, presence: true
  validates :value, presence: true

  def self.set_value(badge_params, additional)
    case badge_params[:badge_type]
    when 'Success Passing'
      additional[:additional_title]
    when 'Success Passing Category'
      additional[:additional_category]
    when 'Success Passing by Level'
      additional[:additional_level]
    end
   end
end
