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

ActiveRecord::Schema.define(version: 20160316230009) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.string   "provider",   null: false
    t.string   "uid",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authentications", ["provider", "uid"], name: "index_authentications_on_provider_and_uid", using: :btree

  create_table "blocked_users", force: :cascade do |t|
    t.integer "blocker_id"
    t.integer "blocked_id"
  end

  add_index "blocked_users", ["blocked_id"], name: "index_blocked_users_on_blocked_id", using: :btree
  add_index "blocked_users", ["blocker_id"], name: "index_blocked_users_on_blocker_id", using: :btree

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "images", force: :cascade do |t|
    t.string   "image"
    t.integer  "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "images", ["profile_id"], name: "index_images_on_profile_id", using: :btree

  create_table "languages", force: :cascade do |t|
    t.string   "language"
    t.integer  "skill_level"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "languageable_id"
    t.string   "languageable_type"
  end

  add_index "languages", ["languageable_id"], name: "index_languages_on_languageable_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.integer  "recipient_id"
    t.integer  "sender_id"
    t.text     "message"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "read_status",     default: false
    t.boolean  "permission",      default: false
    t.integer  "pull_request_id"
  end

  create_table "pair_programmers", force: :cascade do |t|
    t.string   "city"
    t.boolean  "male"
    t.boolean  "female"
    t.boolean  "other"
    t.integer  "min_age"
    t.string   "operating_system"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "max_age"
    t.integer  "profile_id"
    t.string   "province"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "partners", force: :cascade do |t|
    t.string   "city"
    t.boolean  "male"
    t.boolean  "female"
    t.boolean  "other"
    t.string   "operating_system"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "profile_id"
    t.integer  "min_age"
    t.integer  "max_age"
    t.string   "province"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "partners", ["profile_id"], name: "index_partners_on_profile_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "city"
    t.boolean  "male"
    t.boolean  "female"
    t.boolean  "other"
    t.date     "birthday"
    t.string   "operating_system"
    t.text     "about_me"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "user_id"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "image"
    t.string   "province"
    t.boolean  "date",               default: false
    t.boolean  "paired_programmer",  default: false
    t.string   "phone_number"
    t.boolean  "notification_email", default: true
    t.boolean  "notification_sms",   default: true
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "pull_requests", force: :cascade do |t|
    t.integer  "requestor_id"
    t.integer  "requestee_id"
    t.boolean  "permission",   default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "read",         default: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "github_image"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
