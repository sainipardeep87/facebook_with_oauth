class RegularUsersController < ApplicationController
	
	def new
		@user = RegularUser.new	
	end

	def create
    debugger
	    @user = RegularUser.new(params[:regular_user])
    	if @user.save
      		sign_in @user
          redirect_to root_path
    	else
      		render 'new'
    	end
  	end
 
end