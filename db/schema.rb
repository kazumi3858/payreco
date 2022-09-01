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

ActiveRecord::Schema[7.0].define(version: 2022_09_01_024725) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "companies", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.boolean "hourly_wage_system", null: false
    t.integer "wage_amount"
    t.string "currency_type", null: false
    t.uuid "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "exchange_rates", force: :cascade do |t|
    t.integer "year_and_month", null: false
    t.jsonb "exchange_rate_list", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "uid", null: false
    t.string "name", null: false
    t.integer "target_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "works", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "starting_time"
    t.datetime "ending_time"
    t.integer "break_time"
    t.float "working_hours", default: 0.0, null: false
    t.integer "pay_amount", null: false
    t.string "memo"
    t.uuid "user_id", null: false
    t.uuid "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date", null: false
    t.index ["company_id"], name: "index_works_on_company_id"
    t.index ["user_id"], name: "index_works_on_user_id"
  end

  add_foreign_key "companies", "users"
  add_foreign_key "works", "companies"
  add_foreign_key "works", "users"
end
