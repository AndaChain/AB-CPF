class Department < ApplicationRecord
    belongs_to :manager, foreign_key: 'parent_code'

    has_many :Employee
    self.primary_key = 'code'
    has_many :employees, primary_key: 'code', foreign_key: 'code'
end
