class ApplicationController < ActionController::Base
	before_action :set_init
	def set_init
		@current_user = true
	end


end
