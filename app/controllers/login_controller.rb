class LoginController < ApplicationController

  #def has_password
  #  unless :password
  #  flash[:warning] = 'Password incorrect'
  #  redirect_to login_user_path
  #  end
  #end

  def user

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
