class CreateTimeRecodes < ActiveRecord::Migration[6.1]
  def change
    create_table :time_recodes do |t|
      #t.string :id_e
      t.references :id_e, references: :employees, null: false, type: :string
	  t.datetime :start_actual
	  t.datetime :end_actual
	  t.integer :ot_actual
      t.timestamps
    end
    rename_column :time_recodes, :id_e_id, :id_e
    add_foreign_key :time_recodes, :employees, column: 'id_e', primary_key: 'id_e'
  end
end
