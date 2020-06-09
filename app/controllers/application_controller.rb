# frozen_string_literal: true

class ApplicationController < ActionController::Base

helper_method :logged_in?

private

 def authenticate_user!
 	unless current_user
 		session[:path] = request.env['PATH_INFO']
 		redirect_to login_path, alert: 'Are you a Guru?'
 	end
 end

 def current_user
 	@current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
 end

 def logged_in?
 	@current_user.present?
 end

end
