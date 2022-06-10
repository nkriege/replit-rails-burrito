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

ActiveRecord::Schema.define(version: 2022_06_06_215704) do

  create_table "fillings", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.decimal "price", precision: 5, scale: 2, null: false
    t.integer "calories", null: false
    t.boolean "available", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string "name_first", null: false
    t.string "name_last", null: false
    t.string "email"
    t.string "phone"
    t.string "favorite_color"
    t.string "tortilla"
    t.string "rice"
    t.string "beans"
    t.text "instructions"
    t.boolean "delivery", default: false, null: false
    t.string "delivery_street1"
    t.string "delivery_street2"
    t.string "delivery_zip"
    t.string "delivery_city"
    t.string "delivery_state"
    t.boolean "cheese", default: false, null: false
    t.boolean "lettuce", default: false, null: false
    t.boolean "guacamole", default: false, null: false
    t.boolean "salsa", default: false, null: false
    t.boolean "sour_cream", default: false, null: false
    t.integer "filling_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["filling_id"], name: "index_orders_on_filling_id"
  end

end
