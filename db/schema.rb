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

ActiveRecord::Schema.define(version: 20150607050717) do

  create_table "prizes", force: true do |t|
    t.integer  "user_id"
    t.text     "results"
    t.integer  "totalNum"
    t.string   "firstName"
    t.string   "firstTitle"
    t.string   "firstDescription"
    t.integer  "firstNum"
    t.string   "secondName"
    t.string   "secondTitle"
    t.string   "secondDescription"
    t.integer  "secondNum"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "thirdName"
    t.string   "thirdTitle"
    t.string   "thirdDescription"
    t.integer  "thirdNum"
    t.string   "fourthName"
    t.string   "fourthTitle"
    t.string   "fourthDescription"
    t.integer  "fourthNum"
    t.string   "fifthName"
    t.string   "fifthTitle"
    t.string   "fifthDescription"
    t.integer  "fifthNum"
    t.string   "sixthName"
    t.string   "sixthTitle"
    t.string   "sixthDescription"
    t.integer  "sixthNum"
    t.string   "seventhName"
    t.string   "seventhTitle"
    t.string   "seventhDescription"
    t.integer  "seventhNum"
    t.string   "eighthName"
    t.string   "eighthTitle"
    t.string   "eighthDescription"
    t.integer  "eighthNum"
    t.string   "ninethName"
    t.string   "ninethTitle"
    t.string   "ninethDescription"
    t.integer  "ninethNum"
    t.string   "tenthName"
    t.string   "tenthTitle"
    t.string   "tenthDescription"
    t.integer  "tenthNum"
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
