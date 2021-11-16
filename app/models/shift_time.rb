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



end
