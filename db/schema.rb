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

ActiveRecord::Schema.define(version: 20140716135338) do

  create_table "careers", id: false, force: true do |t|
    t.string   "name"
    t.integer  "max_credits"
    t.string   "code",                   limit: 3, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "documents_file_name"
    t.string   "documents_content_type"
    t.integer  "documents_file_size"
    t.datetime "documents_updated_at"
  end

  create_table "subjects", force: true do |t|
    t.string   "name"
    t.integer  "credits"
    t.string   "code"
    t.integer  "subject_prerequisite_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "career_id"
  end

  add_index "subjects", ["career_id"], name: "index_subjects_on_career_id"
  add_index "subjects", ["subject_prerequisite_id"], name: "index_subjects_on_subject_prerequisite_id"

  create_table "subjects_subjects", force: true do |t|
    t.integer "subject_id"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "type"
    t.string   "career_id"
    t.integer  "extra_credits"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.string   "password_digest"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
