class TimeRecode < ApplicationRecord
    belongs_to :employee, foreign_key: 'id_e'
    
    def self.check_record(id_e, date)
    
		some = TimeRecode.where(id_e: id_e)
		some.each do |d|
			check_date = (d.start_actual.to_s.split)[0] == date
			puts d.start_actual.to_s + date.to_s
			if check_date
				return [d.start_actual, d.end_actual]
			end
		end
		return ["",""]
    end
    
end
