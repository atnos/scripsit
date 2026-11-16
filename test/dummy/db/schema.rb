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

ActiveRecord::Schema[8.1].define(version: 2026_11_16_101741) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "scripsit_contents", force: :cascade do |t|
    t.string "subject", null: false
    t.text "body", null: false
    t.boolean "active", default: false, null: false
    t.bigint "scripsit_slug_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index [ "scripsit_slug_id" ], name: "index_scripsit_contents_on_scripsit_slug_id"
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
    t.index [ "slug" ], name: "index_scripsit_slugs_on_slug", unique: true
  end

  add_foreign_key "scripsit_contents", "scripsit_slugs"
end
