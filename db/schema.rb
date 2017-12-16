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

ActiveRecord::Schema.define(version: 20171216001539) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.string "spotify_uri"
    t.string "uuid"
  end

  create_table "events", force: :cascade do |t|
    t.string "name", null: false
    t.date "date", null: false
    t.time "start_time"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "venue_id"
    t.integer "created_by_id"
    t.index ["venue_id"], name: "index_events_on_venue_id"
  end

  create_table "events_artists", force: :cascade do |t|
    t.integer "event_id", null: false
    t.integer "artist_id", null: false
    t.boolean "headliner", default: false
    t.index ["artist_id"], name: "index_events_artists_on_artist_id"
    t.index ["event_id"], name: "index_events_artists_on_event_id"
  end

  create_table "user_statuses_for_events", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "event_id", null: false
    t.integer "status", null: false
    t.boolean "has_tickets", default: false
    t.index ["user_id", "event_id"], name: "index_user_statuses_for_events_on_user_id_and_event_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.datetime "birthday"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "location"
    t.string "uuid", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email"
  end

  create_table "venues", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "address"
  end

end
