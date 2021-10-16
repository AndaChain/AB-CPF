class ManageController < ApplicationController
	def index
        
        begin
                @select_department = @current_user.departments

        rescue NoMethodError
                redirect_to login_path
        end

	end

	def show
                code = params[:id]
                begin
                @department = Department.find_by(code: code)
                rescue
                end
	end

end
