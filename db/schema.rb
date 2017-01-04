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

ActiveRecord::Schema.define(version: 20170104200013) do

  create_table "exercise_groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "routine_id"
  end

  add_index "exercise_groups", ["routine_id"], name: "index_exercise_groups_on_routine_id"

  create_table "exercise_groups_exercises", id: false, force: :cascade do |t|
    t.integer "exercise_id",       null: false
    t.integer "exercise_group_id", null: false
  end

  add_index "exercise_groups_exercises", ["exercise_group_id"], name: "index_exercise_groups_exercises_on_exercise_group_id"
  add_index "exercise_groups_exercises", ["exercise_id"], name: "index_exercise_groups_exercises_on_exercise_id"

  create_table "exercises", force: :cascade do |t|
    t.string   "name"
    t.float    "weight"
    t.float    "weight_increment"
    t.integer  "reps_goal"
    t.integer  "sets_goal"
    t.integer  "time_between_sets"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "routines", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "user_id"
    t.integer  "active_status", default: 0
  end

  add_index "routines", ["active_status"], name: "index_routines_on_active_status"
  add_index "routines", ["user_id"], name: "index_routines_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

  create_table "workout_exercises", force: :cascade do |t|
    t.integer  "workout_session_id"
    t.integer  "exercise_id"
    t.integer  "sets_goal"
    t.integer  "reps_goal"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "workout_exercises", ["exercise_id"], name: "index_workout_exercises_on_exercise_id"
  add_index "workout_exercises", ["workout_session_id"], name: "index_workout_exercises_on_workout_session_id"

  create_table "workout_sessions", force: :cascade do |t|
    t.datetime "date"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "user_id"
    t.integer  "exercise_group_id"
  end

  add_index "workout_sessions", ["exercise_group_id"], name: "index_workout_sessions_on_exercise_group_id"
  add_index "workout_sessions", ["user_id"], name: "index_workout_sessions_on_user_id"

end
