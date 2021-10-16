class CreateDepartments < ActiveRecord::Migration[6.1]
  def change
    create_table :departments do |t|
	  t.string :code
	  t.string :name
	  #t.integer :parent_code
    t.references :parent_code, references: :managers, null: false
      t.timestamps
    end
    rename_column :departments, :parent_code_id, :parent_code
    add_foreign_key :departments, :managers, column: 'parent_code', primary_key: 'parent_code'
  end
end
