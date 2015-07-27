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

ActiveRecord::Schema.define(version: 20150727184737) do

  create_table "case_files", force: :cascade do |t|
    t.string   "name"
    t.string   "brief"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_person", id: false, force: :cascade do |t|
    t.integer "event_id",   null: false
    t.integer "person_id",  null: false
    t.integer "event_type"
  end

  create_table "events", force: :cascade do |t|
    t.integer  "case_file_id"
    t.string   "body"
    t.string   "tagline"
    t.datetime "date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["case_file_id"], name: "index_events_on_case_file_id"
  end

  create_table "mark_person", id: false, force: :cascade do |t|
    t.integer "mark_id",   null: false
    t.integer "person_id", null: false
    t.integer "location"
  end

  create_table "marks", force: :cascade do |t|
    t.integer  "type"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "name"
    t.integer  "gender"
    t.integer  "height"
    t.integer  "weight"
    t.integer  "eye_colour"
    t.integer  "hair_colour"
    t.integer  "hair_length"
    t.integer  "ic"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
