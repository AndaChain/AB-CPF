class Manager < ApplicationRecord
    has_many :Department
    self.primary_key = 'parent_code'
    has_many :departments, primary_key: 'parent_code', foreign_key: 'parent_code'
end
