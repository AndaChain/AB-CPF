class Employee < ApplicationRecord
    validates :password, :presence => true
    validates :id_e, :presence => true

    belongs_to :department, primary_key: 'code', foreign_key: 'code', optional: true

    #has_secure_password
    #self.primary_key = %i[id_e shifter_code]

    #has_many :ShiftTime
    #self.primary_key = 'shifter_code'
    has_many :shift_times, primary_key: 'shifter_code', foreign_key: 'shifter_code', dependent: :nullify

    has_many :TimeRecode
    self.primary_key = 'id_e'
    has_many :time_recodes, primary_key: 'id_e', foreign_key: 'id_e'
    
    def self.emInshift(em, de)
			shifter = Employee.where(shifter_code: em.keys, code: de)
			shifter
    end

    def self.shiftNil(de)
        shifter = Employee.where(shifter_code: nil, code: de)
        shifter
    end
    
end
