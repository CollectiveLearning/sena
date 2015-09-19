class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.decimal :fee
      t.decimal :quantity

      t.timestamps null: false
    end
  end
end
