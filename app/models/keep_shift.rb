class KeepShift < ApplicationRecord
	serialize :keep_shift, Hash
	belongs_to :employee, primary_key: 'id_e', foreign_key: 'id_e', optional: true
end
