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

ActiveRecord::Schema[7.2].define(version: 2025_03_07_034239) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "drugs", force: :cascade do |t|
    t.string "drug_name"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_drugs_on_user_id"
  end

  create_table "inquiries", force: :cascade do |t|
    t.string "customer_name", null: false
    t.string "customer_email", null: false
    t.text "inquiry_message", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "record_drugs", force: :cascade do |t|
    t.bigint "record_id", null: false
    t.bigint "drug_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["drug_id"], name: "index_record_drugs_on_drug_id"
    t.index ["record_id"], name: "index_record_drugs_on_record_id"
  end

  create_table "record_supplements", force: :cascade do |t|
    t.bigint "record_id", null: false
    t.bigint "supplement_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_id"], name: "index_record_supplements_on_record_id"
    t.index ["supplement_id"], name: "index_record_supplements_on_supplement_id"
  end

  create_table "record_symptoms", force: :cascade do |t|
    t.bigint "record_id", null: false
    t.bigint "symptom_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_id"], name: "index_record_symptoms_on_record_id"
    t.index ["symptom_id"], name: "index_record_symptoms_on_symptom_id"
  end

  create_table "records", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "record_date", null: false
    t.integer "condition_rating", default: 0, null: false
    t.integer "belly_rating", default: 0, null: false
    t.integer "meal_rating", default: 0, null: false
    t.integer "poop_rating", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "food", default: "未入力", null: false
    t.string "meal_memo", default: "未入力", null: false
    t.text "diary", default: "未入力", null: false
    t.text "defecation", default: "未入力", null: false
    t.text "poop_amount", default: "未入力", null: false
    t.text "poop_shape", default: "未入力", null: false
    t.string "poop_memo"
    t.text "belly_condition", default: "未入力", null: false
    t.string "belly_memo"
    t.string "condition_memo"
    t.index ["user_id"], name: "index_records_on_user_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.bigint "user_id", null: false
    t.bigint "drug_id"
    t.bigint "supplement_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["drug_id"], name: "index_schedules_on_drug_id"
    t.index ["supplement_id"], name: "index_schedules_on_supplement_id"
    t.index ["user_id"], name: "index_schedules_on_user_id"
  end

  create_table "supplements", force: :cascade do |t|
    t.string "supplement_name"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_supplements_on_user_id"
  end

  create_table "symptoms", force: :cascade do |t|
    t.string "symptom_name", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_symptoms_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "first_name_kana", null: false
    t.string "last_name_kana", null: false
    t.string "gender", null: false
    t.date "birthdate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "drugs", "users"
  add_foreign_key "record_drugs", "drugs"
  add_foreign_key "record_drugs", "records"
  add_foreign_key "record_supplements", "records"
  add_foreign_key "record_supplements", "supplements"
  add_foreign_key "record_symptoms", "records"
  add_foreign_key "record_symptoms", "symptoms"
  add_foreign_key "records", "users"
  add_foreign_key "schedules", "drugs"
  add_foreign_key "schedules", "supplements"
  add_foreign_key "schedules", "users"
  add_foreign_key "supplements", "users"
  add_foreign_key "symptoms", "users"
end
