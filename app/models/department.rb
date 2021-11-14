class Department < ApplicationRecord
    belongs_to :manager, primary_key: 'parent_code', foreign_key: 'parent_code', optional: true

    #has_many :Employee
    #self.primary_key = 'code'
    has_many :employees, primary_key: 'code', foreign_key: 'code', dependent: :nullify
end
