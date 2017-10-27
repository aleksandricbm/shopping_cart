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

ActiveRecord::Schema.define(version: 20171018080539) do

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "price", precision: 8, scale: 2
    t.text "description"
    t.date "public_y"
    t.integer "height", limit: 2
    t.integer "weight", limit: 2
    t.integer "depth", limit: 2
    t.string "material"
    t.integer "reviews_qty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shopping_cart_billing_addresses", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "city"
    t.string "zip"
    t.string "phone"
    t.integer "user_id"
    t.integer "country_id"
    t.integer "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_shopping_cart_billing_addresses_on_country_id"
    t.index ["order_id"], name: "index_shopping_cart_billing_addresses_on_order_id"
    t.index ["user_id"], name: "index_shopping_cart_billing_addresses_on_user_id"
  end

  create_table "shopping_cart_countries", force: :cascade do |t|
    t.string "name"
  end

  create_table "shopping_cart_coupons", force: :cascade do |t|
    t.string "code"
    t.decimal "price", precision: 8, scale: 2
  end

  create_table "shopping_cart_credit_cards", force: :cascade do |t|
    t.bigint "number"
    t.string "name"
    t.string "expired"
    t.integer "cvv"
    t.integer "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_shopping_cart_credit_cards_on_order_id"
  end

  create_table "shopping_cart_order_items", force: :cascade do |t|
    t.integer "quantity"
    t.decimal "price", precision: 8, scale: 2
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order_id"
    t.integer "product_id"
    t.index ["order_id"], name: "index_shopping_cart_order_items_on_order_id"
  end

  create_table "shopping_cart_order_statuses", force: :cascade do |t|
    t.string "name"
  end

  create_table "shopping_cart_orders", force: :cascade do |t|
    t.string "number"
    t.decimal "total_price", precision: 8, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "shipping_method_id"
    t.integer "coupon_id"
    t.integer "order_status_id"
    t.integer "user_id"
    t.index ["coupon_id"], name: "index_shopping_cart_orders_on_coupon_id"
    t.index ["order_status_id"], name: "index_shopping_cart_orders_on_order_status_id"
    t.index ["shipping_method_id"], name: "index_shopping_cart_orders_on_shipping_method_id"
  end

  create_table "shopping_cart_shipping_addresses", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "city"
    t.string "zip"
    t.string "phone"
    t.integer "user_id"
    t.integer "country_id"
    t.integer "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_shopping_cart_shipping_addresses_on_country_id"
    t.index ["order_id"], name: "index_shopping_cart_shipping_addresses_on_order_id"
    t.index ["user_id"], name: "index_shopping_cart_shipping_addresses_on_user_id"
  end

  create_table "shopping_cart_shipping_methods", force: :cascade do |t|
    t.string "name"
    t.string "duration"
    t.decimal "price", precision: 8, scale: 2
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
