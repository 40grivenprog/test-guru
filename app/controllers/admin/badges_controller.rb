# frozen_string_literal: true

class Admin::BadgesController < Admin::BaseController
  before_action :get_badge, only: %i[destroy edit update]

  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      redirect_to admin_badges_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badges_path
    else
      render :edit
   end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path
  end

  private

  def get_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    badge_params = params.require(:badge).permit(:badge_type, :image)
    additional = params.require(:badge).permit(:additional_title, :additional_category, :additional_level)
    badge_params[:title] = Badge.set_title(badge_params, additional)
    if badge_params[:image]
      badge_params[:image] = badge_params[:image].original_filename
 end
    badge_params
  end
end
