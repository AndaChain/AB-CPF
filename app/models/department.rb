class Department < ApplicationRecord
    belongs_to :manager, primary_key: 'parent_code', foreign_key: 'parent_code', optional: true

    #has_many :Employee
    #self.primary_key = 'code'
    has_many :employees, primary_key: 'code', foreign_key: 'code', dependent: :nullify
    
    
    def self.shiftInDepart(depart)
			check = {}
			depart.employees.each do |d|
				if check[d.shifter_code]
					check[d.shifter_code] += 1
				elsif(d.shifter_code == nil)
					
				else
					check[d.shifter_code] = 1
				end
				
			end
			check
	end

	def self.AllEmployee(depart)
		employ_per_depart = {}
		depart.each do |d|
			employ_per_depart[d.code] = d.employees.count
		end
		employ_per_depart
	end
		
    
end
