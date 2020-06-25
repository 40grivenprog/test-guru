# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_locale

  def default_url_options
    locale = I18n.locale == I18n.default_locale ? nil : I18n.locale
    { lang: locale }
  end

  private

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end
