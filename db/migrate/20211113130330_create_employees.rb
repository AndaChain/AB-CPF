class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees, id: false, primary_key: :id_e do |t|
      t.primary_key :id_e, :string
      #t.string :id_e, :null => false
      t.string :password
      t.string :first
      t.string :last
      t.references :code, references: :departments, null: false, type: :string
      #t.primary_key :shifter_code, :string
      t.string :shifter_code#, :null => false
      t.integer :ot_plan

      t.timestamps
    end
    #add_index :employees, [ :id_e, :shifter_code ], :unique => true
    #execute "ALTER TABLE employees ADD PRIMARY KEYS(id_e);"

    rename_column :employees, :code_id, :code
    add_foreign_key :employees, :departments, column: 'code', primary_key: 'code'
  end
end
