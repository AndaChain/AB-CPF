class Employee < ApplicationRecord
    validates :password, :presence => true
    validates :id_m, :presence => true
end
