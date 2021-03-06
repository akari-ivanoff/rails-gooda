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

ActiveRecord::Schema.define(version: 2019_06_12_095902) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "invitations", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "status", default: "pending"
    t.string "photo"
    t.date "start_date"
    t.date "end_date"
    t.bigint "offer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "host_id"
    t.index ["host_id"], name: "index_invitations_on_host_id"
    t.index ["offer_id"], name: "index_invitations_on_offer_id"
  end

  create_table "offers", force: :cascade do |t|
    t.string "title"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "talent_id"
    t.bigint "volunteer_id"
    t.index ["talent_id"], name: "index_offers_on_talent_id"
    t.index ["volunteer_id"], name: "index_offers_on_volunteer_id"
  end

  create_table "talents", force: :cascade do |t|
    t.string "title"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "location"
    t.text "bio"
    t.string "photo", default: "avatar.jpg"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "invitations", "users", column: "host_id"
  add_foreign_key "offers", "users", column: "volunteer_id"
end
