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

ActiveRecord::Schema.define(version: 20150402195459) do

  create_table "case_files", force: :cascade do |t|
    t.string   "name"
    t.string   "brief"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_types", force: :cascade do |t|
    t.string "name"
  end

  create_table "events", force: :cascade do |t|
    t.integer  "case_file_id"
		t.string   "body"
		t.string   "tagline"
    t.date     "date"
    t.time     "time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["case_file_id"], name: "index_events_on_case_id"
  add_index "events", ["tagline"], name: "index_events_on_tagline"

  create_table "people", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "person_event_links", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_type_id"
  end

  add_index "person_event_links", ["event_type_id"], name: "index_event_links_on_event_types_id"

end
