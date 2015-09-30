# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150912150342) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price"
    t.decimal  "fee"
    t.decimal  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sells", force: :cascade do |t|
    t.integer  "product_id"
    t.decimal  "fee_total"
    t.decimal  "price_total"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.decimal  "quantity"
  end

  add_index "sells", ["product_id"], name: "index_sells_on_product_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "address"
    t.integer  "gender"
    t.string   "phone"
    t.string   "card_id"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "identification_type"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_foreign_key "sells", "products"
end
