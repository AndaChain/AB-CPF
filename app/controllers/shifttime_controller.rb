class ShifttimeController < ApplicationController
	def show

        code = params[:manage_id]
        begin
        
            @select_department = @current_user.departments
            @department = Department.find_by(code: code)
            
        rescue
        
            redirect_to login_path
            
        end
        
        shiftInDepart = Department.shiftInDepart(@department)
        @emp = Employee.emInshift(shiftInDepart, @department.code)
        
    end
end
