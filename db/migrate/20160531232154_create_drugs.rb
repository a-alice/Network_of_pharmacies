class CreateDrugs < ActiveRecord::Migration
  def change
    create_table :drugs do |t|
      t.text    :name, null: false
      t.integer :volume, null: false
      t.integer :dosage
      t.string  :maker, null: false
      t.boolean :recipe, null: false
      t.integer :new_category
      t.integer :dest_category

      t.index [:name, :volume, :maker], unique: true
      t.index :name
      t.timestamps null: false
    end
  end
end
