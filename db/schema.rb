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

ActiveRecord::Schema.define(version: 20160225125355) do

  create_table "basis_lessons", force: :cascade do |t|
    t.string   "subject"
    t.integer  "number"
    t.string   "name"
    t.string   "teacher"
    t.string   "thumbnail"
    t.string   "movie_url"
    t.string   "school"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "basis_lessons", ["movie_url"], name: "index_basis_lessons_on_movie_url", unique: true

  create_table "events", force: :cascade do |t|
    t.string   "name",        null: false
    t.datetime "start_time",  null: false
    t.datetime "end_time",    null: false
    t.text     "content",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "event_image"
    t.string   "teacher"
    t.string   "movie_url"
  end

  create_table "lessons", force: :cascade do |t|
    t.string   "name",         null: false
    t.string   "description",  null: false
    t.string   "teacher",      null: false
    t.string   "movie_url",    null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "lesson_image"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "favoriter_id"
    t.integer  "favorited_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "relationships", ["favorited_id"], name: "index_relationships_on_favorited_id"
  add_index "relationships", ["favoriter_id", "favorited_id"], name: "index_relationships_on_favoriter_id_and_favorited_id", unique: true
  add_index "relationships", ["favoriter_id"], name: "index_relationships_on_favoriter_id"

  create_table "reports", force: :cascade do |t|
    t.string   "state"
    t.date     "date"
    t.string   "situation"
    t.string   "teacher"
    t.string   "subject"
    t.integer  "user_id"
    t.text     "reeport"
    t.text     "answer_report"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "user_id"
    t.date     "reception_date",  null: false
    t.string   "recept",          null: false
    t.string   "question_type",   null: false
    t.string   "question_image"
    t.text     "content",         null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "subject"
    t.string   "situation"
    t.string   "question_staff"
    t.string   "question_report"
  end

  add_index "reservations", ["user_id"], name: "index_reservations_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "school"
    t.string   "classroom"
    t.string   "consultant"
    t.string   "consulting_day"
    t.string   "appear_in"
    t.string   "password_digest"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "admin",           default: false, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
