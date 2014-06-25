class SessionsController < ApplicationController
  def create
  	if request.env["omniauth.auth"].present?
  		user = User.from_omniauth(env["omniauth.auth"])
    	session[:user_id] = user.id
    	redirect_to root_url
    else
    	user = RegularUser.find_by_email(params[:session][:email])
      	if user && user.authenticate(params[:session][:password])
        	sign_in user
        	redirect_to root_url
      	else
        	flash.now[:error] = "Invalid login credentials."
        	render action: 'new'
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
