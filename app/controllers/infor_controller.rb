class InforController < ApplicationController
  def index

    select_user = @current_user
    if select_user == nil
      redirect_to login_path
    end

  end

end
