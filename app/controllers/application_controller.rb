class ApplicationController < ActionController::Base
  require 'json'
 protect_from_forgery with: :null_session
    before_action :set_current_user
  protected # prevents method from being invoked by a route
  def set_current_user
    @current_user = Manager.find_by(id_m: session[:user_id]) || Employee.find_by(id_e: session[:user_id])
  end
  def require_login

  end
end
