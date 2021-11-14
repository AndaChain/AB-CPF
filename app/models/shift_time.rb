class ShiftTime < ApplicationRecord
    belongs_to :employee, primary_key: 'shifter_code', foreign_key: 'shifter_code'
end
