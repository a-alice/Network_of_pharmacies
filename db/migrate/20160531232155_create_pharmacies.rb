class CreatePharmacies < ActiveRecord::Migration
  def change
    create_table :pharmacies do |t|
      t.string 	:address, null: false
      t.integer :number, null: false
      t.string 	:subway, null: false

      t.index :address, unique: true
      t.index :subway
      t.timestamps null: false
    end
  end
end
