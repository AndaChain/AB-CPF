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
    @user_id = params[:user_name]
    pass = params[:password]

    check_user = Manager.find_by(id_m: @user_id ,password: pass)

    if (check_user == nil)
      flash[:warning] = 'Password incorrect'
      redirect_to login_path
    else
      redirect_to manage_index_path
    end
  end







end
