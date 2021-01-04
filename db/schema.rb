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

ActiveRecord::Schema.define(version: 2021_01_04_203302) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "representatives", force: :cascade do |t|
    t.string "chamber"
    t.string "member_id"
    t.string "title"
    t.string "short_title"
    t.string "first_name"
    t.string "last_name"
    t.string "date_of_birth"
    t.string "gender"
    t.string "party"
    t.string "party_full_name"
    t.integer "age"
    t.string "twitter_account"
    t.string "facebook_account"
    t.string "youtube_account"
    t.string "website"
    t.string "contact_form"
    t.integer "seniority"
    t.string "next_election"
    t.string "office"
    t.string "phone"
    t.string "state"
    t.string "district"
    t.decimal "missed_votes_pct"
    t.decimal "votes_with_party_pct"
    t.string "begin_date"
    t.string "end_date"
    t.string "status"
    t.string "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "in_office"
  end

  create_table "senators", force: :cascade do |t|
    t.string "chamber"
    t.string "member_id"
    t.string "title"
    t.string "short_title"
    t.string "first_name"
    t.string "last_name"
    t.string "date_of_birth"
    t.string "gender"
    t.string "party"
    t.string "party_full_name"
    t.integer "age"
    t.string "twitter_account"
    t.string "facebook_account"
    t.string "youtube_account"
    t.string "website"
    t.string "contact_form"
    t.integer "seniority"
    t.string "next_election"
    t.string "office"
    t.string "phone"
    t.string "state"
    t.decimal "missed_votes_pct"
    t.decimal "votes_with_party_pct"
    t.string "begin_date"
    t.string "end_date"
    t.string "status"
    t.string "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "in_office"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "first_name"
    t.string "last_name"
    t.boolean "admin", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
