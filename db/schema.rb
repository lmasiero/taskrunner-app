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

ActiveRecord::Schema.define(version: 20161008023022) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "areas_professionals", id: false, force: :cascade do |t|
    t.integer "professional_id", null: false
    t.integer "area_id",         null: false
    t.index ["area_id"], name: "index_areas_professionals_on_area_id", using: :btree
    t.index ["professional_id"], name: "index_areas_professionals_on_professional_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "professionals", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "category_id"
    t.integer  "mobile_number"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "professionals_services", id: false, force: :cascade do |t|
    t.integer "professional_id", null: false
    t.integer "service_id",      null: false
    t.index ["professional_id"], name: "index_professionals_services_on_professional_id", using: :btree
    t.index ["service_id"], name: "index_professionals_services_on_service_id", using: :btree
  end

  create_table "requests", force: :cascade do |t|
    t.integer  "professional_id"
    t.integer  "user_id"
    t.string   "status"
    t.string   "appointment_time"
    t.string   "appointment_details"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "mobile_number"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
