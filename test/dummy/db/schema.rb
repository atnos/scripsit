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

ActiveRecord::Schema.define(version: 2018_05_10_093551) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "scripsit_contents", force: :cascade do |t|
    t.string "subject", null: false
    t.text "body", null: false
    t.boolean "active", default: false, null: false
    t.bigint "scripsit_slug_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["scripsit_slug_id"], name: "index_scripsit_contents_on_scripsit_slug_id"
  end

  create_table "scripsit_histories", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.string "to", null: false, array: true
    t.string "cc", array: true
    t.string "bcc", array: true
    t.string "subject", null: false
    t.text "body", null: false
    t.jsonb "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scripsit_slugs", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_scripsit_slugs_on_slug", unique: true
  end

  add_foreign_key "scripsit_contents", "scripsit_slugs"
end
