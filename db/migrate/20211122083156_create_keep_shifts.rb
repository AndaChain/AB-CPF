class CreateKeepShifts < ActiveRecord::Migration[6.1]
  def change
	create_table :keep_shifts, id: false, primary_key: :id_e do |t|
	  t.primary_key :id_e, :string
	  t.string :keep_shift
      t.timestamps
    end
  end
end
