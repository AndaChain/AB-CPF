class LoginController < ApplicationController
  def user
    user_id = params[:user_name]
    pass = params[:password]

    check_user = Manager.find_by(id_m: user_id ,password: pass)

    if (check_user == nil)

    else
      redirect_to manage_index_path
    end
  end
end
