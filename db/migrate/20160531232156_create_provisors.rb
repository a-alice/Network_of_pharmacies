class CreateProvisors < ActiveRecord::Migration
  def change
    create_table :provisors do |t|
      t.string      :name,  null: false
      t.string      :surname, null: false
      t.string      :fathername
      t.date        :birthday, null: false
      t.integer     :inn
      t.integer     :passport, null: false
      t.references  :pharmacy, index: true, foreign_key: true, null: false

      t.index [:name, :surname, :fathername]
      t.index :passport, unique: true
      t.timestamps null: false
    end
  end
end

