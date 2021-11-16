class LoginController < ApplicationController

  #def has_password
  #  unless :password
  #  flash[:warning] = 'Password incorrect'
  #  redirect_to login_user_path
  #  end
  #end

  def user
    select_user = @current_user
    if select_user != nil
      begin
        check_user_manager = Manager.find_by(id_m: select_user.id_m ,password: select_user.password)
        check_user_employee = Employee.find_by(id_e: select_user.id_e ,password: select_user.password)
      rescue NoMethodError => miss_method
        if miss_method == 'id_e'
          check_user_employee = nil
        elsif miss_method == 'id_m'
          check_user_manager = nil
        end
      #rescue undefined method {'id_m'}
        #check_user_manager = nil
      end

      if check_user_manager == nil
        redirect_to infor_path
      elsif check_user_employee == nil
        redirect_to manage_index_path
      end
    end
  end

  def submit
    #@user_id = params[:user_name]
    #pass = params[:password]

    #check_user_manager = Manager.find_by(id_m: @user_id ,password: pass)
    #check_user_employee = Employee.find_by(id_e: @user_id ,password: pass)
=begin
    if (@check_user_manager == nil) & (@check_user_employee == nil)
      flash[:warning] = 'Password incorrect'
      redirect_to login_path
    elsif @check_user_manager == nil
      flash[:warning] = 'Fuck you'
      redirect_to login_path
    else
      redirect_to manage_index_path
    end
=end
  end







end
