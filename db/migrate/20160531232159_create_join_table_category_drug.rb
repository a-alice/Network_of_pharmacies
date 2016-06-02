class CreateJoinTableCategoryDrug < ActiveRecord::Migration
  def change
    create_join_table :categories, :drugs, id: false do |t|
      t.index [:category_id, :drug_id], unique: true
    end
  end
end
