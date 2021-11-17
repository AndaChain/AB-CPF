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
            puts "***************************show***************************"
            @select_department = @current_user.departments
            @department = Department.find_by(code: code)

            shiftInDepart = Department.shiftInDepart(@department)
            #@emp = Employee.emInshift(shiftInDepart, @department.code)
            ##@emp = Employee.emInshift( params[:id].split('/')[0], @department.code)
            @all_emp_temp = @department.employees
            @all_emp = Employee.fillerNil(@all_emp_temp)
            @shiftNil = Employee.shiftNil(@department.code)
            
        rescue
            #puts "***************************shitshitshitshitshitshit***************************"
        
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
        
        id_es = params[:id_es]
        id_es.each do |id_e|
			Employee.find_by(id_e: id_e).update(ot_plan: params[:ot_plan].to_i)
        end
    
    end

    def create
		# add employee to department
        puts "***************************create***************************"
		puts params

        params[:id_es].each do |em_id|

            new_shift_code = ShiftTime.check_shift_time(params[:start_plan],params[:end_plan])
            unless new_shift_code
            else
                puts new_shift_code
                if ShiftTime.find_by(shifter_code: new_shift_code) != nil
                    puts "________________________ change 1 ___________________________________"
                    puts Employee.find_by(id_e: em_id).id_e
                    Employee.find_by(id_e: em_id).update(shifter_code: new_shift_code)
                else
                    puts "________________________ change 2 ___________________________________"
                    puts Employee.find_by(id_e: em_id).id_e
                    Employee.find_by(id_e: em_id).update(shifter_code: new_shift_code)
                    ShiftTime.create!(shifter_code: new_shift_code, start_plan: params[:start_plan], end_plan: params[:end_plan])
                end
            end
        end
        #Employee.find_by(id_e: params[:id_e]).shift_times.update(  start_plan: params[:start_plan], end_plan: params[:end_plan]  )
        #puts Employee.find_by(id_e: params[:id_e]).update(shifter_code:)
=begin
        check_time = ShiftTime.find_by( start_plan: params[:start_plan], end_plan: params[:end_plan] )
        if check_time
            if params[:start_plan] == "" ||  params[:end_plan] == ""
                puts "+++++++",check_time.shifter_code,"+++++++1"
            else
                puts "+++++++",check_time.shifter_code,"+++++++2"
                Employee.find_by( id_e: params[:id_e]).update( shifter_code: check_time.shifter_code )
            end
        else
            #max_shift_time = ShiftTime.maximum(:shifter_code).split("s")[1].to_i
            shifter_code = ShiftTime.gen_shifter_code
            puts shifter_code
            
            ShiftTime.create!( start_plan: params[:start_plan], end_plan: params[:end_plan], shifter_code: shifter_code )
            Employee.find_by(id_e: params[:id_e]).update(shifter_code: shifter_code)
        end
=end
    end
    
    def destroy
		# delete employee from department
		puts "***************************destroy***************************"
        puts params
        Employee.find_by(id_e: params[:id_e]).update(shifter_code: nil)
    end
    
    
    
end