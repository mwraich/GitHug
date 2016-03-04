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

ActiveRecord::Schema.define(version: 20160304190127) do


  create_table "authentications", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.string   "provider",   null: false
    t.string   "uid",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authentications", ["provider", "uid"], name: "index_authentications_on_provider_and_uid"

  create_table "images", force: :cascade do |t|
    t.string   "image"
    t.integer  "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "images", ["profile_id"], name: "index_images_on_profile_id"

  create_table "languages", force: :cascade do |t|
    t.string   "language"
    t.integer  "skill_level"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "profile_id"
  end

  add_index "languages", ["profile_id"], name: "index_languages_on_profile_id"

  create_table "messages", force: :cascade do |t|
    t.integer  "recipient"
    t.integer  "profile_id"
    t.text     "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "preferences", force: :cascade do |t|
    t.string   "location"
    t.boolean  "male"
    t.boolean  "female"
    t.boolean  "other"
    t.integer  "age"
    t.string   "operating_system"
    t.boolean  "partner"
    t.boolean  "paired_programmer"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "profile_id"
  end

  add_index "preferences", ["profile_id"], name: "index_preferences_on_profile_id"

  create_table "profiles", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "location"
    t.boolean  "male"
    t.boolean  "female"
    t.boolean  "other"
    t.date     "birthday"
    t.string   "operating_system"
    t.text     "about_me"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "user_id"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "image"

    t.integer  "age"

  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id"

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "email",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "github_image"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
