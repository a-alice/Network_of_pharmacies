class CreateIsales < ActiveRecord::Migration
  def change
    create_table :isales do |t|
      t.references  :pharmacy, index: true, foreign_key: true, null: false
      t.references  :provisor, index: true, foreign_key: true, null: false
      t.references  :drug, index: true, foreign_key: true, null: false
      t.date        :date_sale, null: false
      t.integer     :quantity

      t.index [:drug_id, :provisor_id]
      t.timestamps null: false
    end
  end
end
