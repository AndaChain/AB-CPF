class ManageController < ApplicationController

	#before_action :check_date, only: [:show]

	def index
	puts "***************************index***************************"
        begin
                @select_department = @current_user.departments
                @all_department = Department.AllEmployee(@select_department)

        rescue NoMethodError
                redirect_to login_path
        end

	end

	def show
        code = params[:id]
        self.check_date(params[:format])
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
                if  ((TimeRecode.check_record(emp.id_e, params[:format])[0].to_s.split)[1] != nil) && ((TimeRecode.check_record(emp.id_e, params[:format])[1].to_s.split)[1] == nil)
                    @check_enter[emp.id_e] = true
                else
                    @check_enter[emp.id_e] = false
                end
                
            end
            @check_enter = @check_enter.to_json
            #@hash = Employee.all[0].keep_shifts[0].keep_shift[DateTime.parse(params[:format])]
			@date = params[:format]
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
        check_date_update(params[:date])
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
        check_date_update(params[:date])
    end
    
    def destroy
		# delete employee from department
		puts "***************************destroy***************************"
        puts params
        Employee.find_by(id_e: params[:id_e]).update(shifter_code: nil)
        check_date_update(params[:format])
        redirect_to manage_path(id: params[:id])
        #redirect_to :back
		#redirect_back(fallback_location: manage_path(id: params[:id]))
    end
    
    def check_date(select_date)
				Employee.all.each do |emp|
					if emp.keep_shifts == []
						# new one will create empty infor
						emp.keep_shifts.create!(keep_shift: {select_date => [nil,0]})
					end
					begin
								# Who has infor in that date will not go to "rescue NoMethodError"
																	
								hash_exist = emp.keep_shifts[0].keep_shift  # this is hash
																	
								#take hash in that select date to update them or create new one
								shifter_code_keep = hash_exist[select_date][0] 
								ot_plan_keep = hash_exist[select_date][1]
							
								emp.update(shifter_code: shifter_code_keep, ot_plan: ot_plan_keep)
					rescue NoMethodError
								# not found date that select from calendar
								hash_temp = emp.keep_shifts[0].keep_shift
								hash_temp[select_date] = [nil,0]
								emp.keep_shifts[0].update(keep_shift: hash_temp)
					end
				end
    end
    
    def check_date_update(select_date)
					Employee.all.each do |emp|
								begin
											if emp.keep_shifts == []
												# new one will create empty infor
												emp.keep_shifts.create!(keep_shift: {date => [nil,0]})
											end
											# Who has infor in that date will not go to "rescue NoMethodError"
											
											hash_exist = emp.keep_shifts[0].keep_shift  # this is hash
											
											#take hash in that select date to update them or create new one
											shifter_code_keep = hash_exist[select_date][0] 
											ot_plan_keep = hash_exist[select_date][1]
											
											shifter_code = emp.shifter_code
											ot_plan = emp.ot_plan
											
											change_ot = 0
											change_shifter = ''
											
											puts "#{shifter_code_keep}==#{shifter_code}==#{ot_plan_keep}==#{ot_plan}"
											
											#XY = shifter_code case|ot case
											if( (shifter_code != shifter_code_keep) && (ot_plan != ot_plan_keep) ) # 00
												hash_exist[select_date] = [shifter_code, ot_plan]
												puts "00"
												change_ot = ot_plan
												change_shifter = shifter_code
												
											elsif ( (shifter_code != shifter_code_keep) && (ot_plan == ot_plan_keep) )#01
												hash_exist[select_date] = [shifter_code, ot_plan]
												puts "01"
												change_ot = ot_plan_keep
												change_shifter = shifter_code
												
											elsif ( (shifter_code == shifter_code_keep) && (ot_plan != ot_plan_keep) ) #10
												hash_exist[select_date] = [shifter_code, ot_plan]
												puts "10"
												change_ot = ot_plan
												change_shifter = shifter_code_keep
												
											elsif ( (shifter_code == shifter_code_keep) && (ot_plan == ot_plan_keep) ) #11
												hash_exist[select_date] = [shifter_code, ot_plan]
												puts "11"
												change_ot = ot_plan_keep
												change_shifter = shifter_code_keep
												
											end
											
											puts "================== shifter_code=>#{change_shifter}, ot_plan=>#{change_ot} =================="
											emp.keep_shifts[0].update(keep_shift: hash_exist)
											#emp.update(shifter_code: change_shifter, ot_plan: change_ot)
								rescue NoMethodError
											# not found date that select from calendar
											hash_temp = emp.keep_shifts[0].keep_shift
											hash_temp[select_date] = [nil,0]
											emp.keep_shifts[0].update(keep_shift: hash_temp)
								end
					end
    end
    
end
