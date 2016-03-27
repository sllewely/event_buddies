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

ActiveRecord::Schema.define(version: 20160327205002) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.string "spotify_uri"
    t.string "uuid"
  end

  create_table "events", force: :cascade do |t|
    t.string   "name",        null: false
    t.date     "date",        null: false
    t.time     "start_time"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
  end

  create_table "users", force: :cascade do |t|
    t.string   "access_token"
    t.string   "temp_token",   null: false
    t.string   "email",        null: false
    t.datetime "birthday"
    t.string   "first_name",   null: false
    t.string   "last_name",    null: false
    t.string   "facebook_uid", null: false
    t.string   "location"
    t.string   "uuid",         null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree

  create_table "events_artists", force: :cascade do |t|
    t.integer "event_id",                  null: false
    t.integer "artist_id",                 null: false
    t.boolean "headliner", default: false
  end

  add_index "events_artists", ["artist_id"], name: "index_events_artists_on_artist_id", using: :btree
  add_index "events_artists", ["event_id"], name: "index_events_artists_on_event_id", using: :btree

  create_table "venues", force: :cascade do |t|
    t.string "name"
    t.text   "description"
    t.string "address"
  end

end
