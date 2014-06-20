class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include ApplicationHelper

 private
 	def current_user
 		current_user ||= User.find_by(token: cookies[:token]) if cookies[:token].present?
 	end 
 	# sets the user to equal a token
 	def signed_in?
 		!!current_user
 	end

 	helper_method :current_user, :signed_in?

 	def authorize
 		redirect_to root_url, alert: "Not authorized." if current_user.nil?
 	end
end
