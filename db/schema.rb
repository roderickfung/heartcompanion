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

ActiveRecord::Schema.define(version: 20161008080437) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clinicians", force: :cascade do |t|
    t.string   "role",            default: "clinician"
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.text     "address"
    t.string   "password_digest"
    t.string   "auth_token"
    t.boolean  "approved",        default: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "city"
    t.string   "province"
    t.string   "postal_code"
    t.float    "longitude"
    t.float    "latitude"
    t.index ["auth_token"], name: "index_clinicians_on_auth_token", using: :btree
    t.index ["username", "email"], name: "index_clinicians_on_username_and_email", using: :btree
  end

  create_table "patient_logs", force: :cascade do |t|
    t.date     "date"
    t.integer  "heartrate"
    t.integer  "bp_hi"
    t.integer  "bp_low"
    t.integer  "weight_num"
    t.string   "weight_type"
    t.integer  "exerting_breath"
    t.integer  "night_breath"
    t.integer  "leg_swollen"
    t.integer  "lightheadedness"
    t.integer  "patient_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["bp_hi", "bp_low", "weight_num"], name: "index_patient_logs_on_bp_hi_and_bp_low_and_weight_num", using: :btree
    t.index ["heartrate", "weight_type"], name: "index_patient_logs_on_heartrate_and_weight_type", using: :btree
    t.index ["leg_swollen", "lightheadedness"], name: "index_patient_logs_on_leg_swollen_and_lightheadedness", using: :btree
    t.index ["night_breath", "exerting_breath"], name: "index_patient_logs_on_night_breath_and_exerting_breath", using: :btree
    t.index ["patient_id"], name: "index_patient_logs_on_patient_id", using: :btree
  end

  create_table "patients", force: :cascade do |t|
    t.string   "role",            default: "patient"
    t.string   "care_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "sex"
    t.integer  "age"
    t.string   "email"
    t.string   "phone"
    t.text     "address"
    t.string   "password_digest"
    t.string   "auth_token"
    t.boolean  "approved",        default: false
    t.integer  "bphigh"
    t.integer  "bplow"
    t.integer  "hrhigh"
    t.integer  "hrlow"
    t.integer  "lbhigh"
    t.integer  "lblow"
    t.integer  "clinician_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "city"
    t.string   "provice"
    t.string   "postal_code"
    t.float    "longitude"
    t.float    "latitude"
    t.index ["auth_token"], name: "index_patients_on_auth_token", using: :btree
    t.index ["bphigh", "bplow"], name: "index_patients_on_bphigh_and_bplow", using: :btree
    t.index ["care_id", "email"], name: "index_patients_on_care_id_and_email", using: :btree
    t.index ["clinician_id"], name: "index_patients_on_clinician_id", using: :btree
    t.index ["hrhigh", "hrlow"], name: "index_patients_on_hrhigh_and_hrlow", using: :btree
    t.index ["lbhigh", "lblow"], name: "index_patients_on_lbhigh_and_lblow", using: :btree
  end

  add_foreign_key "patient_logs", "patients"
  add_foreign_key "patients", "clinicians"
end
