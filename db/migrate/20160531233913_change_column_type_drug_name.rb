class ChangeColumnTypeDrugName < ActiveRecord::Migration
  def change
  	change_column :drugs, :name,  :string
  end
end
