class CreateIavails < ActiveRecord::Migration
  def change
    create_table :iavails do |t|
      t.references 	:drug, index: true, foreign_key: true, null: false
      t.references 	:pharmacy, index: true, foreign_key: true, null: false
      t.integer 	:quantity, null: false

      t.index [:drug_id, :pharmacy_id]
      t.timestamps null: false
    end
  end
end
