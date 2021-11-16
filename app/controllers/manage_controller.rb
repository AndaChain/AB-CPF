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

                @select_department = @current_user.departments
                @department = Department.find_by(code: code)
                @shiftInDepart = Department.shiftInDepart(@department)
				
                rescue

                redirect_to login_path
                
                end
                #@shiftInDepart = Department.shiftInDepart(@department)
	end

end
