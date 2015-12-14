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

ActiveRecord::Schema.define(version: 20151214183310) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "correctassos", id: false, force: :cascade do |t|
    t.integer  "match_id"
    t.integer  "correction_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "correctassos", ["correction_id"], name: "index_correctassos_on_correction_id", using: :btree
  add_index "correctassos", ["match_id"], name: "index_correctassos_on_match_id", using: :btree

  create_table "corrections", force: :cascade do |t|
    t.string   "name"
    t.string   "link"
    t.integer  "match_id"
    t.integer  "typeOfCorrection"
    t.integer  "change"
    t.integer  "minute"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "leagues", force: :cascade do |t|
    t.string   "name"
    t.integer  "endyear"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ligassos", id: false, force: :cascade do |t|
    t.integer  "league_id"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "ligassos", ["league_id"], name: "index_ligassos_on_league_id", using: :btree
  add_index "ligassos", ["team_id"], name: "index_ligassos_on_team_id", using: :btree

  create_table "matches", force: :cascade do |t|
    t.integer  "week"
    t.integer  "real_result"
    t.integer  "league_id"
    t.integer  "team_id"
    t.integer  "otherteam_id"
    t.boolean  "mirror"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
