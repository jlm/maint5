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

ActiveRecord::Schema[8.1].define(version: 2025_11_19_193346) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "items", id: :serial, force: :cascade do |t|
    t.string "clause"
    t.datetime "created_at", precision: nil, null: false
    t.date "date"
    t.string "draft"
    t.string "latest_status"
    t.integer "minst_id"
    t.string "number"
    t.string "standard"
    t.text "subject"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "meetings", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.date "date"
    t.string "location"
    t.string "meetingtype"
    t.string "minutes_url"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "minsts", force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_minsts_on_code"
    t.index ["name"], name: "index_minsts_on_name"
  end

  create_table "minutes", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.date "date"
    t.integer "item_id"
    t.integer "meeting_id"
    t.integer "minst_id"
    t.string "status"
    t.text "text"
    t.datetime "updated_at", precision: nil, null: false
    t.index ["item_id"], name: "index_minutes_on_item_id"
    t.index ["meeting_id"], name: "index_minutes_on_meeting_id"
  end

  create_table "products", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "requests", id: :serial, force: :cascade do |t|
    t.string "clauseno"
    t.string "clausetitle"
    t.string "company"
    t.datetime "created_at", precision: nil, null: false
    t.date "date"
    t.string "email"
    t.text "impact"
    t.integer "item_id"
    t.string "name"
    t.text "proposal"
    t.text "rationale"
    t.text "reqtxt"
    t.string "standard"
    t.datetime "updated_at", precision: nil, null: false
    t.index ["item_id"], name: "index_requests_on_item_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "current_sign_in_at"
    t.inet "current_sign_in_ip"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "last_sign_in_at"
    t.inet "last_sign_in_ip"
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end
end
