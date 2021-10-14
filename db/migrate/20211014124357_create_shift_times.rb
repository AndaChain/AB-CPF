class CreateShiftTimes < ActiveRecord::Migration[6.1]
  def change
    create_table :shift_times do |t|
	  t.string :shifter_code
	  t.datetime :start_plan
	  t.datetime :end_plan
      t.timestamps
    end
  end
end
