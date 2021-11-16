class ManageController < ApplicationController
	def index
        begin
                @select_department = @current_user.departments
                @all_department = Department.AllEmployee(@select_department)

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
        
        def create
			# create shift time
			puts "***************************create shift time***************************"
			puts params
			start_plan = params[:start_plan]
			end_plan = params[:end_plan]
			shifter_code = start_plan+"_"+end_plan
			if ShiftTime.find_by( shifter_code: shifter_code )
			else
				ShiftTime.create!( shifter_code: shifter_code, start_plan: start_plan, end_plan: end_plan )
			end
			
        end

end
