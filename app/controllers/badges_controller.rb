# frozen_string_literal: true

class BadgesController < ApplicationController
  def index
    @badges = current_user.badges
  end

  def availiable
    @badges = Badge.all
  end
end
