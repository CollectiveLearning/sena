class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.string :address
      t.integer :gender
      t.string :phone
      t.string :card_id
      t.string :email
      t.string :password_digest
      t.integer :identification_type

      t.timestamps null: false
    end
  end
end
