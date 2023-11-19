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

ActiveRecord::Schema[7.1].define(version: 2023_11_19_132656) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "manufacturers", force: :cascade do |t|
    t.text "name"
    t.text "address"
    t.text "city"
    t.text "post_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "widgets", force: :cascade do |t|
    t.text "name"
    t.text "status"
    t.bigint "manufacturer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manufacturer_id"], name: "index_widgets_on_manufacturer_id"
  end

  add_foreign_key "widgets", "manufacturers"
end
