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

ActiveRecord::Schema.define(version: 20140721223520) do

  create_table "career_subjects", force: true do |t|
    t.string   "career_code"
    t.integer  "subject_id"
    t.integer  "subject_prerequisite_id"
    t.integer  "credits_prerequisite",    default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "trimester_number"
  end

  add_index "career_subjects", ["subject_id"], name: "index_career_subjects_on_subject_id"
  add_index "career_subjects", ["subject_prerequisite_id"], name: "index_career_subjects_on_subject_prerequisite_id"

  create_table "career_subjects_subjects", force: true do |t|
    t.integer "subject_id"
    t.integer "career_subject_id"
  end

  add_index "career_subjects_subjects", ["subject_id"], name: "index_career_subjects_subjects_on_subject_id"

  create_table "careers", id: false, force: true do |t|
    t.string   "name"
    t.integer  "max_credits"
    t.string   "code",        limit: 3, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students_subjects", force: true do |t|
    t.integer "user_id"
    t.integer "subjects_id"
  end

  add_index "students_subjects", ["subjects_id"], name: "index_students_subjects_on_subjects_id"
  add_index "students_subjects", ["user_id"], name: "index_students_subjects_on_user_id"

  create_table "subjects", force: true do |t|
    t.string   "name"
    t.integer  "credits"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subjects_users", id: false, force: true do |t|
    t.integer "subject_id"
    t.integer "user_id"
    t.boolean "status"
  end

  create_table "uploads", force: true do |t|
    t.string   "attachment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "type"
    t.string   "career_code"
    t.integer  "extra_credits"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.string   "password_digest"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
