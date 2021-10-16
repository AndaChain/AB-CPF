class Employee < ApplicationRecord
    validates :password, :presence => true
    validates :id_e, :presence => true
end
