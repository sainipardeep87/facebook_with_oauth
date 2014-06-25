class Api::UsersController < ApplicationController


def create
	debugger
	@user =RegularUser.create(params[:user])

	if @user.save
		render json:{:status => true,:token=> @user.token,:message => "User created successfully"}
	else
		render json:{:status => false, :message => "errors"}
	end
end

  
end