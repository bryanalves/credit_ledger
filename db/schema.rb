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

ActiveRecord::Schema.define(version: 20141013193412) do

  create_table "customers", force: true do |t|
    t.string   "first_name",  null: false
    t.string   "last_name",   null: false
    t.string   "email"
    t.string   "postal_code"
    t.string   "customer_id"
    t.string   "view_token",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "customers", ["customer_id"], name: "index_customers_on_customer_id", unique: true
  add_index "customers", ["first_name"], name: "index_customers_on_first_name"
  add_index "customers", ["last_name"], name: "index_customers_on_last_name"

  create_table "users", force: true do |t|
    t.string "email",                            null: false
    t.string "password_digest",                  null: false
    t.string "role",            default: "user", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
