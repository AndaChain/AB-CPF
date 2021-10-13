class ManageController < ApplicationController
before_action :login_first
	def login_first
		if !@current_user
			redirect_to login_user_path
		end
	end
	
	def index
	end
end
