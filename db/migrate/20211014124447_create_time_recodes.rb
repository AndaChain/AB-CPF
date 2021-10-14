class CreateTimeRecodes < ActiveRecord::Migration[6.1]
  def change
    create_table :time_recodes do |t|
      t.string :id_e
	  t.datetime :start_actual
	  t.datetime :end_actual
	  t.integer :ot_actual
      t.timestamps
    end
  end
end
