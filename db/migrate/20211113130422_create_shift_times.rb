class CreateShiftTimes < ActiveRecord::Migration[6.1]
  def change
    create_table :shift_times, id: false, primary_key: :shifter_code do |t|
	  t.primary_key :shifter_code, :string
    #t.string :shifter_code
    #t.references :shifter_code, references: :employees, null: false, type: :string#, foreign_key: true
	  t.datetime :start_plan
	  t.datetime :end_plan
      t.timestamps
    end
    #rename_column :shift_times, :shifter_code_id, :shifter_code
    #add_foreign_key :shift_times, :employees, column: 'shifter_code', primary_key: 'shifter_code'
  end
end
