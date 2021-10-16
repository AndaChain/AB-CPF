class Department < ApplicationRecord
    belongs_to :manager, foreign_key: 'parent_code'
end
