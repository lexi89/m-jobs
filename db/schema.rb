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

ActiveRecord::Schema.define(version: 20160229013001) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "companies", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "mission"
    t.string   "description"
    t.string   "logo"
    t.string   "name"
    t.string   "location"
    t.string   "employees"
    t.string   "url"
  end

  create_table "companyindustries", force: :cascade do |t|
    t.integer "company_id"
    t.integer "industry_id"
  end

  add_index "companyindustries", ["company_id"], name: "index_companyindustries_on_company_id"
  add_index "companyindustries", ["industry_id"], name: "index_companyindustries_on_industry_id"

  create_table "industries", force: :cascade do |t|
    t.string "name"
  end

  create_table "interests", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "interests", ["followed_id"], name: "index_interests_on_followed_id"
  add_index "interests", ["follower_id", "followed_id"], name: "index_interests_on_follower_id_and_followed_id"
  add_index "interests", ["follower_id"], name: "index_interests_on_follower_id"

  create_table "jobcategories", force: :cascade do |t|
    t.integer "job_id"
    t.integer "category_id"
  end

  add_index "jobcategories", ["category_id"], name: "index_jobcategories_on_category_id"
  add_index "jobcategories", ["job_id"], name: "index_jobcategories_on_job_id"

  create_table "jobs", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "title"
    t.string   "description"
    t.integer  "salary"
    t.string   "requirements"
    t.string   "link"
    t.integer  "company_id"
    t.string   "location"
    t.integer  "salarymin"
    t.integer  "salarymax"
    t.string   "jobtype"
  end

  add_index "jobs", ["company_id"], name: "index_jobs_on_company_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",     null: false
    t.string   "encrypted_password",     default: "",     null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "role",                   default: "user"
    t.string   "firstname"
    t.text     "bio"
    t.string   "image"
    t.string   "surname"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
