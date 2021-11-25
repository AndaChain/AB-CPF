class InforController < ApplicationController
  def index

    select_user = @current_user
    puts "============================================index employees================================="
    #puts self.datetime_ch(params[:format])
    
    @date = params[:format]

    if select_user == nil
      redirect_to login_path
    else
      begin
        check_user_employee = Employee.find_by(id_e: select_user.id_e ,password: select_user.password)
        if check_user_employee == nil
          redirect_to login_path
        end

        @time = self.datetime_ch(params[:format]) # show datetime
        @ot_plan = self.ot_ch(params[:format]) # show ot
        @actual_time = self.check_record(@current_user.id_e, params[:format])
      rescue NoMethodError #=> miss_method
        @time = self.datetime_ch(params[:format]) # show datetime
        @ot_plan = self.ot_ch(params[:format]) # show ot
        @actual_time = self.check_record(@current_user.id_e, params[:format])
        redirect_to login_path
      end
    end

  end

  def datetime_ch(time)
    begin
      user = @current_user.keep_shifts[0].keep_shift
      if  user[time] == nil || user[time][0] == [nil] 
        return 'No plan today'
      else
        return (ShiftTime.find_by(shifter_code: user[time][0]).start_plan.to_s.split)[1] + ' - ' + (ShiftTime.find_by(shifter_code: user[time][0]).end_plan.to_s.split)[1] 
      end
    rescue
      return 'No plan today'
    end
  end

  def ot_ch(time)
    begin
      user = @current_user.keep_shifts[0].keep_shift
      if  user[time] == nil
        return 0
      else
        return user[time][1]
      end
    rescue
      return 0
    end
  end

end
