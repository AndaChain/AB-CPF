class InforController < ApplicationController
  def index

    select_user = @current_user
    if select_user == nil
      redirect_to login_path
    else
      begin
        check_user_employee = Employee.find_by(id_e: select_user.id_e ,password: select_user.password)
        if check_user_employee == nil
          redirect_to login_path
        end
        okstart =  ShiftTime.find_by(shifter_code: @current_user.shifter_code).start_plan.to_s.split
        okend =  ShiftTime.find_by(shifter_code: @current_user.shifter_code).end_plan.to_s.split
        @time = okstart + ' - ' +  okend

      rescue NoMethodError #=> miss_method
        redirect_to login_path
      end
    end

  end

end
