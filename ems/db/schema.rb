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

ActiveRecord::Schema.define(version: 20160427213823) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clazzs", force: true do |t|
    t.string   "name"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clazzs", ["group_id"], name: "index_clazzs_on_group_id", using: :btree

  create_table "enrollments", force: true do |t|
    t.integer  "exam_id"
    t.integer  "student_id"
    t.integer  "result_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "enrollments", ["exam_id"], name: "index_enrollments_on_exam_id", using: :btree
  add_index "enrollments", ["result_id"], name: "index_enrollments_on_result_id", using: :btree
  add_index "enrollments", ["student_id"], name: "index_enrollments_on_student_id", using: :btree

  create_table "exams", force: true do |t|
    t.string   "exam_type",             default: "Core"
    t.date     "date"
    t.time     "start_time"
    t.time     "end_time"
    t.string   "semester",              default: "Spring"
    t.string   "location"
    t.date     "registration_deadline"
    t.integer  "clazz_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "published"
  end

  add_index "exams", ["clazz_id"], name: "index_exams_on_clazz_id", using: :btree

  create_table "groups", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "results", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: true do |t|
    t.string   "username"
    t.string   "txstateid"
    t.string   "last_name"
    t.string   "first_name"
    t.string   "major"
    t.string   "email"
    t.string   "phone"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username",               default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "role_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
