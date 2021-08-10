# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_08_10_070802) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "deliveries", force: :cascade do |t|
    t.integer "amount"
    t.bigint "warehouse_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "date"
    t.index ["product_id"], name: "index_deliveries_on_product_id"
    t.index ["warehouse_id"], name: "index_deliveries_on_warehouse_id"
  end

  create_table "product_warehouses", force: :cascade do |t|
    t.bigint "warehouse_id", null: false
    t.bigint "product_id", null: false
    t.integer "amount", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_product_warehouses_on_product_id"
    t.index ["warehouse_id", "product_id"], name: "index_product_warehouses_on_warehouse_id_and_product_id", unique: true
    t.index ["warehouse_id"], name: "index_product_warehouses_on_warehouse_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "transfers", force: :cascade do |t|
    t.integer "from_warehouse_id", null: false
    t.integer "to_warehouse_id", null: false
    t.bigint "product_id", null: false
    t.integer "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_transfers_on_product_id"
  end

  create_table "warehouses", force: :cascade do |t|
    t.string "title"
    t.integer "region"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "deliveries", "products"
  add_foreign_key "deliveries", "warehouses"
  add_foreign_key "product_warehouses", "products"
  add_foreign_key "product_warehouses", "warehouses"
  add_foreign_key "transfers", "products"
end
