class ApplicationController < ActionController::Base
  require 'json'
 protect_from_forgery with: :null_session
    before_action :set_current_user
  protected # prevents method from being invoked by a route
  def set_current_user
    @current_user = Manager.find_by(id_m: session[:user_id]) || Employee.find_by(id_e: session[:user_id])
  end
  
  def check_record(id_e, date)
			
			ot_actual = 0.0
			
			some = TimeRecode.where(id_e: id_e)
			some.each do |d|
				check_date = (d.start_actual.to_s.split)[0] == date
				#puts (d.start_actual.to_s.split)[0] + date
				if (d.end_actual == nil || d.end_actual == nil)
					ot_actual = 0
				else
					act = d.end_actual
					hour_act = act.hour*3600
					min_act = act.min*60
					act_sec = hour_act + min_act
					
					pl = d.employee.shift_times[0].end_plan
					hour_pl = pl.hour*3600
					min_pl = pl.min*60
					ot_actual = ( (act_sec - (hour_pl + min_pl))/3600 ).round(1)
					
					if ot_actual < 0
						ot_actual = 0
					end
				end
				if check_date
					if(d.ot_actual != ot_actual)
							d.update(ot_actual: ot_actual)
					end
					return [d.start_actual, d.end_actual, ot_actual]
				end
				
			end
			return ["","", 0.0]
		
   end
		
end
