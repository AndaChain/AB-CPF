class ApplicationController < ActionController::Base
    before_action :set_current_user
  protected # prevents method from being invoked by a route
  def set_current_user
    @current_user = Manager.find_by(id_m: session[:user_id]) || Employee.find_by(id_e: session[:user_id])
  end
end
