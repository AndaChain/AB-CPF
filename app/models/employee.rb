class Employee < ApplicationRecord
    validates :password, :presence => true
    validates :id_e, :presence => true

    belongs_to :department, foreign_key: 'code'

    #has_secure_password
    #self.primary_key = %i[id_e shifter_code]

    #has_many :ShiftTime
    #self.primary_key = 'shifter_code'
    has_many :shift_times, primary_key: 'shifter_code', foreign_key: 'shifter_code'

    has_many :TimeRecode
    self.primary_key = 'id_e'
    has_many :time_recodes, primary_key: 'id_e', foreign_key: 'id_e'
end
