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

ActiveRecord::Schema.define(version: 20150304140136) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "brands", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
  end

  create_table "machine_materials", force: :cascade do |t|
    t.integer  "machine_id"
    t.integer  "material_id"
    t.string   "colors"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "machine_materials", ["machine_id"], name: "index_machine_materials_on_machine_id", using: :btree
  add_index "machine_materials", ["material_id"], name: "index_machine_materials_on_material_id", using: :btree

  create_table "machine_models", force: :cascade do |t|
    t.string   "name"
    t.integer  "brand_id"
    t.integer  "category_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "model_picture_file_name"
    t.string   "model_picture_content_type"
    t.integer  "model_picture_file_size"
    t.datetime "model_picture_updated_at"
  end

  add_index "machine_models", ["brand_id"], name: "index_machine_models_on_brand_id", using: :btree
  add_index "machine_models", ["category_id"], name: "index_machine_models_on_category_id", using: :btree

  create_table "machines", force: :cascade do |t|
    t.integer  "length"
    t.integer  "width"
    t.text     "description"
    t.integer  "machine_model_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "workshop_id"
  end

  add_index "machines", ["machine_model_id"], name: "index_machines_on_machine_model_id", using: :btree
  add_index "machines", ["workshop_id"], name: "index_machines_on_workshop_id", using: :btree

  create_table "materials", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string   "state"
    t.string   "file"
    t.integer  "price_cents"
    t.text     "description"
    t.integer  "machine_id"
    t.integer  "machine_material_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "designer_id"
    t.integer  "maker_id"
  end

  add_index "orders", ["designer_id"], name: "index_orders_on_designer_id", using: :btree
  add_index "orders", ["machine_id"], name: "index_orders_on_machine_id", using: :btree
  add_index "orders", ["machine_material_id"], name: "index_orders_on_machine_material_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "picture"
    t.string   "name"
    t.string   "token"
    t.datetime "token_expiry"
    t.boolean  "admin",                  default: false, null: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.string   "phone_number"
    t.text     "description"
    t.string   "firstname"
    t.string   "lastname"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "workshops", force: :cascade do |t|
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "workshops", ["user_id"], name: "index_workshops_on_user_id", using: :btree

  add_foreign_key "machine_materials", "machines"
  add_foreign_key "machine_materials", "materials"
  add_foreign_key "machine_models", "brands"
  add_foreign_key "machine_models", "categories"
  add_foreign_key "machines", "machine_models"
  add_foreign_key "machines", "workshops"
  add_foreign_key "orders", "machine_materials"
  add_foreign_key "orders", "machines"
  add_foreign_key "orders", "users", column: "designer_id"
  add_foreign_key "workshops", "users"
end
