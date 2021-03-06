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

ActiveRecord::Schema.define(version: 20150630141921) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "eventos", force: :cascade do |t|
    t.string   "nome"
    t.string   "twitter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "alexa"
    t.string   "facebook"
    t.string   "instagram"
    t.string   "youtubeId"
  end

  create_table "medidas", force: :cascade do |t|
    t.integer  "evento_id"
    t.float    "twitter"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "alexa"
    t.float    "flikes"
    t.float    "ftalk"
    t.integer  "instagram"
    t.integer  "youtubeSubscribers"
    t.integer  "youtubeViews"
  end

  add_index "medidas", ["evento_id"], name: "index_medidas_on_evento_id", using: :btree

  add_foreign_key "medidas", "eventos"
end
