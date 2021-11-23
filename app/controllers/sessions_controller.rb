class SessionsController < ApplicationController
    def create
        user_id = params[:user_name]
        pass = params[:password]
        
        check_user_manager = Manager.find_by(id_m: user_id ,password: pass)
        check_user_employee = Employee.find_by(id_e: user_id ,password: pass)

        flash[:error] = 'Password Incorrect' 
        flash[:alert] = 'Please enter your UID or password'
        
        if (check_user_manager == nil) & (check_user_employee == nil)
            
            redirect_to login_path

          elsif check_user_manager == nil
            session[:user_id] = check_user_employee.id_e
            session[:password] = check_user_employee.password
            redirect_to infor_path(DateTime.now.strftime("%Y-%m-%d"))

          else
            session[:user_id] = check_user_manager.id_m
            session[:password] = check_user_manager.password
            redirect_to manage_index_path
          end
    end

    def destroy
      session.delete(:user_id)
      session.delete(:password)
      redirect_to login_path
    end

end
