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

ActiveRecord::Schema.define(version: 20170319235853) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.string  "name"
    t.string  "key"
    t.boolean "enabled", default: true, null: false
  end

  create_table "error_logs", force: :cascade do |t|
    t.integer  "application_id", null: false
    t.string   "name"
    t.string   "message"
    t.text     "backtrace"
    t.datetime "timestamp",      null: false
    t.index ["application_id"], name: "index_error_logs_on_application_id", using: :btree
  end

  create_table "request_logs", force: :cascade do |t|
    t.integer  "application_id", null: false
    t.string   "method"
    t.string   "path"
    t.string   "query"
    t.integer  "status"
    t.cidr     "remote_ip"
    t.string   "user_agent"
    t.string   "language"
    t.string   "referrer"
    t.string   "request_uri"
    t.json     "custom_fields"
    t.datetime "timestamp",      null: false
    t.index ["application_id"], name: "index_request_logs_on_application_id", using: :btree
  end

end
