class TimeRecode < ApplicationRecord
    belongs_to :employee, foreign_key: 'id_e'
end
