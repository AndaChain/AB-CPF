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
        puts "***************************show***************************"
        puts params
        @emp = Employee.emInshift(shiftInDepart, @department.code)
        @shiftNil = Employee.shiftNil(@department.code)
        
    end

    def update
        puts "***************************update***************************"
        puts params

        #Employee.find_by(id_e: params[:id_e])[0].update(shifter_code: nil)
    end

    def create
        puts "***************************create***************************"



        
    end
end
