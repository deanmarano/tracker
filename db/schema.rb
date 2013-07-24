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

ActiveRecord::Schema.define(version: 20130724032855) do

  create_table "actions", force: true do |t|
    t.string   "cause"
    t.string   "name"
    t.integer  "resulting_state_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ownerships", force: true do |t|
    t.integer  "task_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", force: true do |t|
    t.string   "name"
    t.string   "next_action_ids"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", force: true do |t|
    t.integer  "author_id"
    t.integer  "template_id"
    t.text     "notes"
    t.string   "title"
    t.integer  "state_id"
    t.integer  "index"
    t.integer  "super_task_id"
    t.integer  "points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "templates", force: true do |t|
    t.string   "name"
    t.string   "icon"
    t.string   "point_scale"
    t.string   "options"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "display_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
