class SessionsController < ApplicationController
  def new
  	@users = User.new
  end

  def create
  	@user = User.where(:email => params[:session][:email]).first
  	if @user && @user.authenticate(params[:session][:password])
  		flash[:success] = "HELLO " + @user.full_name + " You have logged in"
  		session[:token] = @user.id
  		@current_user = @user
  		redirect_to users_path
  	  else
  		flash[:error] = "Invalid email/password combination"
  		render 'new'
  	  end
  	end

  def destroy
  	session.delete(:token)
  	redirect_to root_path
  end

end
