class ShifttimeController < ApplicationController
	def show

        code = params[:manage_id]
        begin
            puts "***************************show***************************"
            @select_department = @current_user.departments
            @department = Department.find_by(code: code)

            shiftInDepart = Department.shiftInDepart(@department)
            #@emp = Employee.emInshift(shiftInDepart, @department.code)
            ##@emp = Employee.emInshift( params[:id].split('/')[0], @department.code)
            @all_emp = @department.employees
            @shiftNil = Employee.shiftNil(@department.code)
            
        rescue
        
            redirect_to login_path
            
        end
        
        #puts "***************************show***************************"
        #puts params
        #@emp = Employee.emInshift( params[:id].split('/')[0], @department.code)
        #@shiftNil = Employee.shiftNil(@department.code)
        
    end

    def update
		# update OT to each employess
        puts "***************************update***************************"
        puts params
        
        if Employee.find_by(id_e: params[:id_e]).shifter_code != nil
			Employee.find_by(id_e: params[:id_e]).update(ot_plan: params[:ot_plan].to_i)
        else
			# add employee to shift-time
			puts "***************************create but update***************************"
			puts params
			Employee.find_by(id_e: params[:id_e]).update(shifter_code: params[:id].split('/')[0])
        end
        
    end

    def create
		# No use
        puts "***************************create***************************"
		puts params
    end
    
    def destroy
		# delete employee from shift-time
		puts "***************************destroy***************************"
        puts params
        Employee.find_by(id_e: params[:id_e]).update(shifter_code: nil)
    end
    
    
    
end
