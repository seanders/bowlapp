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

ActiveRecord::Schema.define(version: 20140104083106) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bowl_team_relations", force: true do |t|
    t.integer  "bowl_id",                    null: false
    t.integer  "team_id",                    null: false
    t.integer  "score",      default: 0,     null: false
    t.boolean  "winner",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bowl_team_relations", ["team_id"], name: "index_bowl_team_relations_on_team_id", unique: true, using: :btree

  create_table "bowls", force: true do |t|
    t.string   "name",       null: false
    t.datetime "date",       null: false
    t.string   "city",       null: false
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", force: true do |t|
    t.string   "first_name", null: false
    t.string   "last_name"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "people", ["first_name", "last_name"], name: "index_people_on_first_name_and_last_name", unique: true, using: :btree

  create_table "person_bowl_relations", force: true do |t|
    t.integer  "person_id",   null: false
    t.integer  "bowl_id",     null: false
    t.integer  "team_id",     null: false
    t.integer  "point_value", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "name",         null: false
    t.integer  "nbc_id"
    t.integer  "points_cache"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teams", ["name"], name: "index_teams_on_name", unique: true, using: :btree

end
