class UsersController < ApplicationController
	
	def new
		debugger
		@user = User.new	
	end

	def create
		debugger
		puts params
	end
end
