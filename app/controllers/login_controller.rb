class LoginController < ApplicationController
  def user
    user_id = params[:user_name]
    pass = params[:password]

    check_id = Manager.find_by(id_m: user_id)
    check_pass = Manager.find_by(id_m: user_id)

    if (check_id == nil) | (check_pass == nil)
      
    else
      redirect_to manage_index_path
    end
  end
end
