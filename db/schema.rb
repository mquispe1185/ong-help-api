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

ActiveRecord::Schema.define(version: 2022_09_09_225257) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaigns", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "city_id", null: false
    t.bigint "province_id", null: false
    t.string "phone"
    t.string "email"
    t.string "facebook"
    t.string "instagram"
    t.string "twitter"
    t.bigint "user_id", null: false
    t.bigint "category_id", null: false
    t.integer "status", default: 0
    t.string "tags"
    t.bigint "status_updated_by_id"
    t.boolean "active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "video_url"
    t.integer "updated_by_id"
    t.index ["category_id"], name: "index_campaigns_on_category_id"
    t.index ["city_id"], name: "index_campaigns_on_city_id"
    t.index ["province_id"], name: "index_campaigns_on_province_id"
    t.index ["status_updated_by_id"], name: "index_campaigns_on_status_updated_by_id"
    t.index ["user_id"], name: "index_campaigns_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.boolean "active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cities", force: :cascade do |t|
    t.bigint "province_id", null: false
    t.string "name"
    t.boolean "active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["province_id"], name: "index_cities_on_province_id"
  end

  create_table "donations", force: :cascade do |t|
    t.bigint "fixed_cost_id", null: false
    t.bigint "user_id", null: false
    t.integer "mount", default: 0
    t.integer "status", default: 0
    t.integer "way_to_pay", default: 0
    t.string "code"
    t.integer "payment_id"
    t.bigint "status_updated_by_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["fixed_cost_id"], name: "index_donations_on_fixed_cost_id"
    t.index ["status_updated_by_id"], name: "index_donations_on_status_updated_by_id"
    t.index ["user_id"], name: "index_donations_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.bigint "ong_id", null: false
    t.date "date"
    t.string "hour"
    t.string "title"
    t.string "description"
    t.bigint "city_id", null: false
    t.bigint "province_id", null: false
    t.integer "status"
    t.bigint "created_by_id"
    t.bigint "status_updated_by_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "video_url"
    t.index ["city_id"], name: "index_events_on_city_id"
    t.index ["created_by_id"], name: "index_events_on_created_by_id"
    t.index ["ong_id"], name: "index_events_on_ong_id"
    t.index ["province_id"], name: "index_events_on_province_id"
    t.index ["status_updated_by_id"], name: "index_events_on_status_updated_by_id"
  end

  create_table "fixed_costs", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "mount", default: 0
    t.integer "balance", default: 0
    t.integer "raised", default: 0
    t.bigint "created_by_id"
    t.integer "month"
    t.integer "year"
    t.integer "status", default: 0
    t.bigint "status_updated_by_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "chargeable_type", null: false
    t.bigint "chargeable_id", null: false
    t.index ["chargeable_type", "chargeable_id"], name: "index_fixed_costs_on_chargeable"
    t.index ["created_by_id"], name: "index_fixed_costs_on_created_by_id"
    t.index ["status_updated_by_id"], name: "index_fixed_costs_on_status_updated_by_id"
  end

  create_table "item_donations", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "mount", default: 0
    t.integer "balance", default: 0
    t.integer "raised", default: 0
    t.bigint "created_by_id"
    t.integer "month"
    t.integer "year"
    t.integer "status", default: 0
    t.bigint "status_updated_by_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "donatable_type", null: false
    t.bigint "donatable_id", null: false
    t.index ["created_by_id"], name: "index_item_donations_on_created_by_id"
    t.index ["donatable_type", "donatable_id"], name: "index_item_donations_on_donatable"
    t.index ["status_updated_by_id"], name: "index_item_donations_on_status_updated_by_id"
  end

  create_table "ongs", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "street"
    t.bigint "city_id", null: false
    t.bigint "province_id", null: false
    t.string "phone"
    t.string "email"
    t.string "facebook"
    t.string "instagram"
    t.string "twitter"
    t.string "longitude"
    t.string "latitude"
    t.bigint "user_id", null: false
    t.bigint "category_id", null: false
    t.integer "status", default: 0
    t.string "tags"
    t.bigint "status_updated_by_id"
    t.boolean "active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "video_url"
    t.integer "updated_by_id"
    t.index ["category_id"], name: "index_ongs_on_category_id"
    t.index ["city_id"], name: "index_ongs_on_city_id"
    t.index ["province_id"], name: "index_ongs_on_province_id"
    t.index ["status_updated_by_id"], name: "index_ongs_on_status_updated_by_id"
    t.index ["user_id"], name: "index_ongs_on_user_id"
  end

  create_table "provinces", force: :cascade do |t|
    t.string "name"
    t.boolean "active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.integer "role", default: 0
    t.json "tokens"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "campaigns", "categories"
  add_foreign_key "campaigns", "cities"
  add_foreign_key "campaigns", "provinces"
  add_foreign_key "campaigns", "users"
  add_foreign_key "campaigns", "users", column: "status_updated_by_id"
  add_foreign_key "campaigns", "users", column: "updated_by_id"
  add_foreign_key "cities", "provinces"
  add_foreign_key "donations", "fixed_costs"
  add_foreign_key "donations", "users"
  add_foreign_key "donations", "users", column: "status_updated_by_id"
  add_foreign_key "events", "cities"
  add_foreign_key "events", "ongs"
  add_foreign_key "events", "provinces"
  add_foreign_key "events", "users", column: "created_by_id"
  add_foreign_key "events", "users", column: "status_updated_by_id"
  add_foreign_key "fixed_costs", "users", column: "created_by_id"
  add_foreign_key "fixed_costs", "users", column: "status_updated_by_id"
  add_foreign_key "item_donations", "users", column: "created_by_id"
  add_foreign_key "item_donations", "users", column: "status_updated_by_id"
  add_foreign_key "ongs", "categories"
  add_foreign_key "ongs", "cities"
  add_foreign_key "ongs", "provinces"
  add_foreign_key "ongs", "users"
  add_foreign_key "ongs", "users", column: "status_updated_by_id"
  add_foreign_key "ongs", "users", column: "updated_by_id"
end
