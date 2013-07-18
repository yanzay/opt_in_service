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

ActiveRecord::Schema.define(version: 20130715141443) do

  create_table "channels", force: true do |t|
    t.string "name"
  end

  create_table "companies", force: true do |t|
    t.string "name"
  end

  create_table "opt_ins", force: true do |t|
    t.string   "email"
    t.string   "mobile"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "permission_type_id"
    t.integer  "channel_id"
    t.integer  "company_id"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "opt_ins", ["company_id", "channel_id"], name: "index_opt_ins_on_company_id_and_channel_id", unique: true

  create_table "permission_types", force: true do |t|
    t.string "name"
  end

end
