class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
	  t.string :id_e
	  t.string :first
	  t.string :last
	  t.string :code
	  t.string :shifter_code
	  t.integer :ot_plan
      t.timestamps
    end
  end
end
