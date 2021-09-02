# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_09_02_163709) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "benefits", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "price", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_benefits_on_name", unique: true
  end

  create_table "conversations", force: :cascade do |t|
    t.integer "user_a_id"
    t.integer "user_b_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_a_id", "user_b_id"], name: "index_conversations_on_user_a_id_and_user_b_id", unique: true
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.bigint "conversation_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "targets", force: :cascade do |t|
    t.string "title"
    t.decimal "radius"
    t.decimal "latitude"
    t.decimal "longitude"
    t.bigint "topic_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["topic_id"], name: "index_targets_on_topic_id"
    t.index ["user_id"], name: "index_targets_on_user_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "name", null: false
    t.string "image", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_topics_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.string "gender"
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "tokens"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.boolean "allow_password_change", default: false, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "targets", "topics"
  add_foreign_key "targets", "users"
end
