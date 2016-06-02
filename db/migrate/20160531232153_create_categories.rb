class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.integer :new_drug
      t.integer :dest_drug

      t.index :name, unique: true
      t.timestamps null: false
    end
  end
end
