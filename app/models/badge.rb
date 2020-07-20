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
    when 'first_attemp'
      additional[:additional_title]
    when 'category_success'
      additional[:additional_category]
    when 'level_success'
      additional[:additional_level]
    end
   end
end
