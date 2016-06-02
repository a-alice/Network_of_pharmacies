class CreateStatistics < ActiveRecord::Migration
  def change
    create_table :statistics do |t|
      t.integer :number
      t.integer :quantity

      t.index :number, unique: true
    end
  end
end
