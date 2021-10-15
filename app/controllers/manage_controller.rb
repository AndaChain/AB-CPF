class ManageController < ApplicationController
	def index
        #@user_id
	end

	def show
        code = params[:id]
        begin
            @department = Department.find_by(code: code)
        rescue
        end
	end
	
end
