class AddQuantityToSells < ActiveRecord::Migration
  def change
    add_column :sells, :quantity, :decimal
  end
end
