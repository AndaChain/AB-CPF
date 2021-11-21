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
            puts params
            @select_department = @current_user.departments
            @department = Department.find_by(code: code)

            shiftInDepart = Department.shiftInDepart(@department)
            @all_emp_temp = @department.employees
            @all_emp = Employee.fillerNil(code)
            @shiftNil = Employee.shiftNil(code)

            @check_enter = {}
            @all_emp.each do |emp|
                if  (emp.time_recodes[0].start_actual != nil) && (emp.time_recodes[0].end_actual == nil)
                    @check_enter[emp.id_e] = true
                else
                    @check_enter[emp.id_e] = false
                end
                
            end
            @check_enter = @check_enter.to_json
        rescue
            redirect_to login_path
        end
        
    end
    
    def update
		# update OT to each employess
        puts "***************************update***************************"
        puts params
        
        id_es = params[:id_es]
        id_es.each do |id_e|
			if params[:ot_plan]
				Employee.find_by(id_e: id_e).update(ot_plan: params[:ot_plan].to_i)
			else
				Employee.find_by(id_e: id_e).update(ot_plan: 0) # if input is null, it will be 0 hr.
			end
        end
    end

    def create
		# add employee to department
        puts "***************************create***************************"
		puts params
		
        params[:id_es].each do |em_id|
				new_shift_code = ShiftTime.check_shift_time(params[:start_plan],params[:end_plan])
				unless new_shift_code
					# pass
				else
					puts new_shift_code
					if ShiftTime.find_by(shifter_code: new_shift_code) != nil
						puts "________________________ NO create new shift code ___________________________________"
						puts Employee.find_by(id_e: em_id).id_e
						Employee.find_by(id_e: em_id).update(shifter_code: new_shift_code)
					else
						puts "________________________ create new shift code ___________________________________"
						puts Employee.find_by(id_e: em_id).id_e
						Employee.find_by(id_e: em_id).update(shifter_code: new_shift_code)
						ShiftTime.create!(shifter_code: new_shift_code, start_plan: params[:start_plan], end_plan: params[:end_plan])
					end
				end
        end
    end
    
    def destroy
		# delete employee from department
		puts "***************************destroy***************************"
        puts params
        Employee.find_by(id_e: params[:id_e]).update(shifter_code: nil)
        redirect_to manage_path(id: params[:id])
        #redirect_to :back
		#redirect_back(fallback_location: manage_path(id: params[:id]))
    end
    
    
    
end
