class CreateSells < ActiveRecord::Migration
  def change
    create_table :sells do |t|
      t.references :product, index: true, foreign_key: true
      t.decimal :fee_total
      t.decimal :price_total

      t.timestamps null: false
    end
  end
end
