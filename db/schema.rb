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

ActiveRecord::Schema.define(version: 20200409125402) do

  create_table "assets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "item",       null: false
    t.integer  "money"
    t.integer  "deposit"
    t.integer  "user_id"
    t.integer  "month_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item"], name: "index_assets_on_item", using: :btree
    t.index ["month_id"], name: "index_assets_on_month_id", using: :btree
    t.index ["user_id"], name: "index_assets_on_user_id", using: :btree
  end

  create_table "debts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "item",                  null: false
    t.integer  "money"
    t.float    "rate",       limit: 24
    t.integer  "user_id"
    t.integer  "month_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["item"], name: "index_debts_on_item", using: :btree
    t.index ["month_id"], name: "index_debts_on_month_id", using: :btree
    t.index ["user_id"], name: "index_debts_on_user_id", using: :btree
  end

  create_table "expenses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "item",       null: false
    t.integer  "cf"
    t.integer  "user_id"
    t.integer  "month_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item"], name: "index_expenses_on_item", using: :btree
    t.index ["month_id"], name: "index_expenses_on_month_id", using: :btree
    t.index ["user_id"], name: "index_expenses_on_user_id", using: :btree
  end

  create_table "incomes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "item",       null: false
    t.integer  "cf"
    t.integer  "user_id"
    t.integer  "month_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item"], name: "index_incomes_on_item", using: :btree
    t.index ["month_id"], name: "index_incomes_on_month_id", using: :btree
    t.index ["user_id"], name: "index_incomes_on_user_id", using: :btree
  end

  create_table "months", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "month",      limit: 1, null: false
    t.integer  "user_id"
    t.integer  "year_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["month"], name: "index_months_on_month", using: :btree
    t.index ["user_id"], name: "index_months_on_user_id", using: :btree
    t.index ["year_id"], name: "index_months_on_year_id", using: :btree
  end

  create_table "selects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "item"
    t.string "category"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                                null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["name"], name: "index_users_on_name", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "years", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "year",       limit: 2, null: false
    t.integer  "user_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["user_id"], name: "index_years_on_user_id", using: :btree
  end

  add_foreign_key "assets", "months"
  add_foreign_key "assets", "users"
  add_foreign_key "debts", "months"
  add_foreign_key "debts", "users"
  add_foreign_key "expenses", "months"
  add_foreign_key "expenses", "users"
  add_foreign_key "incomes", "months"
  add_foreign_key "incomes", "users"
  add_foreign_key "months", "users"
  add_foreign_key "months", "years"
  add_foreign_key "years", "users"
end
