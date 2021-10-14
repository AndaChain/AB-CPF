class CreateManagers < ActiveRecord::Migration[6.1]
  def change
    create_table :managers do |t|
	  t.string :id_m
	  t.string :first
	  t.string :last
	  t.string :parent_code
      t.timestamps
    end
  end
end
