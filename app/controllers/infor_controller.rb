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
      rescue NoMethodError #=> miss_method
        redirect_to login_path
      end
    end

  end

end
