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

ActiveRecord::Schema.define(version: 20160923041332) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clinicians", force: :cascade do |t|
    t.string   "role",              default: "clinician"
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.text     "address"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "activation_digest"
    t.boolean  "approved",          default: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index ["username", "email"], name: "index_clinicians_on_username_and_email", using: :btree
  end

  create_table "patients", force: :cascade do |t|
    t.string   "role",                default: "patient"
    t.string   "care_id"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "sex"
    t.integer  "age"
    t.string   "email"
    t.string   "phone"
    t.text     "address"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "confirmation_digest"
    t.boolean  "approved"
    t.integer  "bphigh"
    t.integer  "bplow"
    t.integer  "hrhigh"
    t.integer  "hrlow"
    t.integer  "lbhigh"
    t.integer  "lblow"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "clinicians_id"
    t.index ["bphigh", "bplow"], name: "index_patients_on_bphigh_and_bplow", using: :btree
    t.index ["care_id", "email"], name: "index_patients_on_care_id_and_email", using: :btree
    t.index ["clinicians_id"], name: "index_patients_on_clinicians_id", using: :btree
    t.index ["hrhigh", "hrlow"], name: "index_patients_on_hrhigh_and_hrlow", using: :btree
    t.index ["lbhigh", "lblow"], name: "index_patients_on_lbhigh_and_lblow", using: :btree
  end

  add_foreign_key "patients", "clinicians", column: "clinicians_id"
end
