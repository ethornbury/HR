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

ActiveRecord::Schema.define(version: 20150516182844) do

  create_table "employees", force: true do |t|
    t.string   "firstname",                      null: false
    t.string   "lastname",                       null: false
    t.integer  "leaveAllowance"
    t.string   "jobType"
    t.boolean  "admin",          default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "request_alls", force: true do |t|
    t.string   "type"
    t.datetime "startDate"
    t.datetime "endDate"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "request_types", force: true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "requests", force: true do |t|
    t.date     "startDate"
    t.date     "endDate"
    t.string   "status",          default: "Pending", null: false
    t.integer  "employee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "request_type_id"
    t.string   "request_desc"
  end

  add_index "requests", ["employee_id"], name: "index_requests_on_employee_id"

end
