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

ActiveRecord::Schema.define(version: 20160101223029) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "binders", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "color_hex"
    t.integer  "shelf_id"
    t.boolean  "active",      default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dividers", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "parent_id"
    t.string   "parent_type"
    t.boolean  "active",        default: true
    t.integer  "display_order", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gifs", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.boolean  "active",     default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notebooks", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "color_hex"
    t.boolean  "active",      default: true
    t.integer  "binder_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notes", force: :cascade do |t|
    t.text     "body"
    t.integer  "divider_id"
    t.hstore   "hstore"
    t.integer  "order"
    t.boolean  "active",     default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shelves", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "active",      default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
