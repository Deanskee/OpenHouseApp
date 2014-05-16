module ApplicationHelper
def current_user
  # raise session[:remember_token]
  if session[:token]
  	@current_user ||= User.find(token: session[:token])
  else
  	@current_user = nil
  end
end

  

end
