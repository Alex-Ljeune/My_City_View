# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_23_140703) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "checkpoints", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.float "longitude"
    t.float "latitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_checkpoints_on_user_id"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "question_id", null: false
    t.string "answer"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_feedbacks_on_question_id"
    t.index ["user_id"], name: "index_feedbacks_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.text "description"
    t.string "title"
    t.float "longitude"
    t.float "latitude"
    t.integer "progress"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "title"
    t.bigint "project_id", null: false
    t.string "first_answer"
    t.string "second_answer"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_questions_on_project_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "checkpoints", "users"
  add_foreign_key "feedbacks", "questions"
  add_foreign_key "feedbacks", "users"
  add_foreign_key "questions", "projects"
end