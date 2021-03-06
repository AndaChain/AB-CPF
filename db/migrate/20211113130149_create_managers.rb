class CreateManagers < ActiveRecord::Migration[6.1]
  def change
    create_table :managers, id: false, primary_key: :parent_code do |t|
      t.string :id_m, null: false
      t.string :password, null: false
      t.string :first
      t.string :last
      t.primary_key :parent_code, :string

      t.timestamps
    end
  end
end
