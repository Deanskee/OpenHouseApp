class SessionsController < ApplicationController
  def new
  	@users = User.new
  end

  def create
  	# cookies[:token] = @user.token
  	@user = User.where(:email => params[:session][:email]).first
  	if @user && @user.authenticate(params[:session][:password])
  		# params session password is what the user puts into password. passing into authenticate
  		flash[:success] = "HELLO " + @user.full_name + " You have logged in"
  		cookies[:token] = @user.token
      @current_user = @user
  		redirect_to user_path(@user)
  	  else
  		flash[:error] = "Invalid email/password combination"
  		render 'new'
  	  end
  	end

  def destroy
    reset_session
  	cookies.delete(:token)
  	redirect_to root_path
    # kills the cookie after logging out
  end

end
