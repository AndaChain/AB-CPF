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
    
    
    has_many :KeepShift
    has_many :keep_shifts, primary_key: 'id_e', foreign_key: 'id_e'

=begin
    scope :find_shift, lambda { |id_e, date|
	Employee.joins(:keep_times).where(id_e: id_e)

	}
=end

    def find_shift(id_e, date)
		keep = Employee.joins(:keep_times).find_by_id_e(id_e)
		puts keep.keep_shift
	end
    
    def self.emInshift(em, de)
			shifter = Employee.where(shifter_code: em, code: de)
			shifter
    end

    def self.shiftNil(de)
		# filter null Employees
        shifter = Employee.where(shifter_code: nil, code: de)
        shifter
    end

    def self.fillerNil(de_code)
        # filter out Null shifter_time Employees
        employee_array = Employee.where("code='#{de_code}' AND shifter_code IS NOT NULL") # It will filter out if shifter_code is null
        employee_array
        
=begin
        puts "-----------------------------------------------------------------------------------------------"
        employee_array = []
        de.each do |em|
            if em.shifter_code == nil

            else
                employee_array.append(em)
            end
        end
        puts "-----------------------------------------------------------------------------------------------"
        print employee_array
        employee_array
=end
		
		employee_array
    end
    
end
