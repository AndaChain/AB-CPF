class ShiftTime < ApplicationRecord
    belongs_to :employee, primary_key: 'shifter_code', foreign_key: 'shifter_code', optional: true
    #belongs_to :employee, foreign_key: 'shifter_code'

    def self.gen_shifter_code
        
        max = 0
        ShiftTime.all.each do |shf|
            temp = shf.shifter_code.split("s")[1].to_i
            if temp > max
                max = temp
            else
                max = max
            end
        end

        "s" + (max+1).to_s
    end


    def self.check_shift_time(st,en)
        result = ""
        if (st == "") || (en == "")
            result = false
        else
            ShiftTime.all.each do |shf|
                conditional_start = shf.start_plan.to_s.split[1][0..4]
                conditional_end = shf.end_plan.to_s.split[1][0..4]
                if (st == conditional_start) && (en == conditional_end)
                    result = shf.shifter_code
                    break
                elsif (st != conditional_start) || (en != conditional_end)
                    result = ShiftTime.gen_shifter_code
                end
            end
        end

        result
    end



end
