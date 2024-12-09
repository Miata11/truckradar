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

ActiveRecord::Schema[7.1].define(version: 2024_12_09_143536) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dishes", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "price"
    t.bigint "foodtruck_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["foodtruck_id"], name: "index_dishes_on_foodtruck_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "foodtruck_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["foodtruck_id"], name: "index_favorites_on_foodtruck_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "foodtrucks", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.string "category"
    t.text "description"
    t.string "address_default"
    t.decimal "latitude"
    t.decimal "longitude"
    t.boolean "status", default: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_foodtrucks_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "comment"
    t.bigint "user_id", null: false
    t.bigint "foodtruck_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["foodtruck_id"], name: "index_reviews_on_foodtruck_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "role", default: false
    t.string "first_name"
    t.string "last_name"
    t.string "address_default"
    t.decimal "latitude"
    t.decimal "longitude"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "dishes", "foodtrucks"
  add_foreign_key "favorites", "foodtrucks"
  add_foreign_key "favorites", "users"
  add_foreign_key "foodtrucks", "users"
  add_foreign_key "reviews", "foodtrucks"
  add_foreign_key "reviews", "users"
end
