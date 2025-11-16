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

ActiveRecord::Schema[8.1].define(version: 2025_11_13_224926) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "items", force: :cascade do |t|
    t.string "clause"
    t.datetime "created_at", null: false
    t.date "date"
    t.string "draft"
    t.string "latest_status"
    t.bigint "minst_id", null: false
    t.string "number"
    t.string "standard"
    t.text "subject"
    t.datetime "updated_at", null: false
    t.index ["minst_id"], name: "index_items_on_minst_id"
    t.index ["number"], name: "index_items_on_number"
  end

  create_table "meetings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "date"
    t.string "location"
    t.string "meetingtype"
    t.string "minutes_url"
    t.datetime "updated_at", null: false
  end

  create_table "minsts", force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_minsts_on_code"
    t.index ["name"], name: "index_minsts_on_name"
  end

  create_table "minutes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "date"
    t.bigint "item_id", null: false
    t.bigint "meeting_id", null: false
    t.bigint "minst_id", null: false
    t.string "status"
    t.text "text"
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_minutes_on_item_id"
    t.index ["meeting_id"], name: "index_minutes_on_meeting_id"
    t.index ["minst_id"], name: "index_minutes_on_minst_id"
  end

  create_table "products", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "requests", force: :cascade do |t|
    t.string "clauseno"
    t.string "clausetitle"
    t.string "company"
    t.datetime "created_at", null: false
    t.date "date"
    t.string "email"
    t.text "impact"
    t.bigint "item_id", null: false
    t.string "name"
    t.text "proposal"
    t.text "rationale"
    t.text "reqtxt"
    t.string "standard"
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_requests_on_item_id"
  end

  add_foreign_key "items", "minsts"
  add_foreign_key "minutes", "items"
  add_foreign_key "minutes", "meetings"
  add_foreign_key "minutes", "minsts"
  add_foreign_key "requests", "items"
end
