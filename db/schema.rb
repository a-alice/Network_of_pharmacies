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

ActiveRecord::Schema.define(version: 20160601193339) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "new_drug"
    t.integer  "dest_drug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "categories", ["name"], name: "index_categories_on_name", unique: true, using: :btree

  create_table "categories_drugs", id: false, force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "drug_id",     null: false
  end

  add_index "categories_drugs", ["category_id", "drug_id"], name: "index_categories_drugs_on_category_id_and_drug_id", unique: true, using: :btree

  create_table "drugs", force: :cascade do |t|
    t.string   "name",          null: false
    t.integer  "volume",        null: false
    t.integer  "dosage"
    t.string   "maker",         null: false
    t.boolean  "recipe",        null: false
    t.integer  "new_category"
    t.integer  "dest_category"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "drugs", ["name", "volume", "maker"], name: "index_drugs_on_name_and_volume_and_maker", unique: true, using: :btree
  add_index "drugs", ["name"], name: "index_drugs_on_name", using: :btree

  create_table "iavails", force: :cascade do |t|
    t.integer  "drug_id",     null: false
    t.integer  "pharmacy_id", null: false
    t.integer  "quantity",    null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "iavails", ["drug_id", "pharmacy_id"], name: "index_iavails_on_drug_id_and_pharmacy_id", using: :btree
  add_index "iavails", ["drug_id"], name: "index_iavails_on_drug_id", using: :btree
  add_index "iavails", ["pharmacy_id"], name: "index_iavails_on_pharmacy_id", using: :btree

  create_table "isales", force: :cascade do |t|
    t.integer  "pharmacy_id", null: false
    t.integer  "provisor_id", null: false
    t.integer  "drug_id",     null: false
    t.date     "date_sale",   null: false
    t.integer  "quantity"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "isales", ["drug_id", "provisor_id"], name: "index_isales_on_drug_id_and_provisor_id", using: :btree
  add_index "isales", ["drug_id"], name: "index_isales_on_drug_id", using: :btree
  add_index "isales", ["pharmacy_id"], name: "index_isales_on_pharmacy_id", using: :btree
  add_index "isales", ["provisor_id"], name: "index_isales_on_provisor_id", using: :btree

  create_table "pharmacies", force: :cascade do |t|
    t.string   "address",    null: false
    t.integer  "number",     null: false
    t.string   "subway",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "pharmacies", ["address"], name: "index_pharmacies_on_address", unique: true, using: :btree
  add_index "pharmacies", ["subway"], name: "index_pharmacies_on_subway", using: :btree

  create_table "provisors", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "surname",     null: false
    t.string   "fathername"
    t.date     "birthday",    null: false
    t.integer  "inn"
    t.integer  "passport",    null: false
    t.integer  "pharmacy_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "provisors", ["name", "surname", "fathername"], name: "index_provisors_on_name_and_surname_and_fathername", using: :btree
  add_index "provisors", ["passport"], name: "index_provisors_on_passport", unique: true, using: :btree
  add_index "provisors", ["pharmacy_id"], name: "index_provisors_on_pharmacy_id", using: :btree

  create_table "statistics", force: :cascade do |t|
    t.integer "number"
    t.integer "quantity"
  end

  add_index "statistics", ["number"], name: "index_statistics_on_number", unique: true, using: :btree

  add_foreign_key "iavails", "drugs"
  add_foreign_key "iavails", "pharmacies"
  add_foreign_key "isales", "drugs"
  add_foreign_key "isales", "pharmacies"
  add_foreign_key "isales", "provisors"
  add_foreign_key "provisors", "pharmacies"
end
