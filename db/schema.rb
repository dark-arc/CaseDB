# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160228203658) do

  create_table "aliases", force: :cascade do |t|
    t.integer  "person_id"
    t.string   "name"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "default",    default: false
  end

  create_table "anatomies", force: :cascade do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.integer  "children_count"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "anatomies", ["lft"], name: "index_anatomies_on_lft"
  add_index "anatomies", ["parent_id"], name: "index_anatomies_on_parent_id"
  add_index "anatomies", ["rgt"], name: "index_anatomies_on_rgt"

  create_table "case_files", force: :cascade do |t|
    t.string   "name"
    t.string   "brief"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "tagline"
  end

  create_table "event_people", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "event_id"
    t.integer  "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "event_people", ["event_id"], name: "index_event_people_on_event_id"
  add_index "event_people", ["person_id"], name: "index_event_people_on_person_id"

  create_table "events", force: :cascade do |t|
    t.integer  "case_file_id"
    t.string   "body"
    t.string   "tagline"
    t.datetime "date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "location_id"
  end

  add_index "events", ["case_file_id"], name: "index_events_on_case_file_id"
  add_index "events", ["location_id"], name: "index_events_on_location_id"

  create_table "locations", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "level"
    t.text     "name"
    t.integer  "parent_id"
    t.integer  "lft",                        null: false
    t.integer  "rgt",                        null: false
    t.integer  "depth",          default: 0, null: false
    t.integer  "children_count", default: 0, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "locations", ["event_id"], name: "index_locations_on_event_id"
  add_index "locations", ["lft"], name: "index_locations_on_lft"
  add_index "locations", ["parent_id"], name: "index_locations_on_parent_id"
  add_index "locations", ["rgt"], name: "index_locations_on_rgt"

  create_table "mark_types", force: :cascade do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.integer  "children_count"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "mark_types", ["lft"], name: "index_mark_types_on_lft"
  add_index "mark_types", ["name"], name: "index_mark_types_on_name"
  add_index "mark_types", ["rgt"], name: "index_mark_types_on_rgt"

  create_table "marks", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "anatomy_id"
    t.integer  "mark_type_id"
    t.text     "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "marks", ["anatomy_id"], name: "index_marks_on_anatomy_id"
  add_index "marks", ["mark_type_id"], name: "index_marks_on_mark_type_id"
  add_index "marks", ["person_id"], name: "index_marks_on_person_id"

  create_table "pages", force: :cascade do |t|
    t.string   "name"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "pages", ["name"], name: "index_pages_on_name"

  create_table "people", force: :cascade do |t|
    t.integer  "gender"
    t.integer  "height"
    t.integer  "build"
    t.integer  "eye_colour"
    t.integer  "hair_colour"
    t.integer  "hair_length"
    t.integer  "ic"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "beard"
    t.integer  "moustache"
  end

  create_table "users", force: :cascade do |t|
    t.text     "username"
    t.text     "password_enc"
    t.text     "email"
    t.integer  "roles_mask"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "theme"
  end

end
