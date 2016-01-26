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

ActiveRecord::Schema.define(version: 20160126054028) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "noodles", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "email"
    t.string   "uuid"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "noodles", ["uuid"], name: "index_noodles_on_uuid", unique: true, using: :btree

  create_table "options", force: :cascade do |t|
    t.string   "text"
    t.integer  "noodle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "options", ["noodle_id"], name: "index_options_on_noodle_id", using: :btree

  create_table "vote_sets", force: :cascade do |t|
    t.integer  "noodle_id"
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "vote_sets", ["noodle_id"], name: "index_vote_sets_on_noodle_id", using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "vote_set_id"
    t.integer  "option_id"
    t.integer  "value",       limit: 2
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "votes", ["option_id"], name: "index_votes_on_option_id", using: :btree
  add_index "votes", ["vote_set_id"], name: "index_votes_on_vote_set_id", using: :btree

  add_foreign_key "options", "noodles"
  add_foreign_key "vote_sets", "noodles"
  add_foreign_key "votes", "options"
  add_foreign_key "votes", "vote_sets"
end
