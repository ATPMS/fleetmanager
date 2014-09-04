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

ActiveRecord::Schema.define(version: 20140902153206) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "crews", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "contact_number"
    t.text     "address"
    t.string   "email"
    t.string   "identification_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "vessel_id"
    t.boolean  "primary"
    t.string   "crew_profile_picture_file_name"
    t.string   "crew_profile_picture_content_type"
    t.integer  "crew_profile_picture_file_size"
    t.datetime "crew_profile_picture_updated_at"
  end

  create_table "logs", force: true do |t|
    t.decimal  "lon"
    t.decimal  "lat"
    t.datetime "logged_at"
    t.string   "session_token"
    t.integer  "vessel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "access_token"
  end

  create_table "maintenance_types", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_companies", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "contact_number"
    t.string   "email"
    t.text     "notes"
    t.string   "contact_person"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "address"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.text     "address"
    t.string   "company_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "vessel_images", force: true do |t|
    t.integer  "vessel_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "vessel_maintenances", force: true do |t|
    t.integer  "vessel_id"
    t.date     "date_of_maintenance"
    t.string   "status"
    t.string   "person_in_charge"
    t.decimal  "cost"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "maintenance_type_id"
    t.text     "notes"
    t.integer  "service_company_id"
  end

  create_table "vessels", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "code"
    t.string   "reference_number"
    t.string   "access_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "designated_driver_image_file_name"
    t.string   "designated_driver_image_content_type"
    t.integer  "designated_driver_image_file_size"
    t.datetime "designated_driver_image_updated_at"
    t.string   "driver_first_name"
    t.string   "driver_last_name"
    t.string   "driver_contact_number"
    t.text     "driver_address"
  end

end
