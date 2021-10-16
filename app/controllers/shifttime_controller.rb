class ShifttimeController < ApplicationController
	def show
        code = params[:manage_id]
        begin
        @department = Department.find_by(code: code)
        rescue
        end
    end
end
