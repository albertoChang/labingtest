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

ActiveRecord::Schema.define(version: 2019_03_25_123300) do

  create_table "laboratories", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "address"
    t.string "phone"
    t.string "description"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menu_actions", force: :cascade do |t|
    t.integer "menu_id"
    t.integer "role_id"
    t.boolean "create"
    t.boolean "edit"
    t.boolean "view"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_id"], name: "index_menu_actions_on_menu_id"
    t.index ["role_id"], name: "index_menu_actions_on_role_id"
  end

  create_table "menus", force: :cascade do |t|
    t.string "navigation_name"
    t.string "controller_name"
    t.string "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "active", default: true
    t.integer "laboratory_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["laboratory_id"], name: "index_roles_on_laboratory_id"
  end

  create_table "sample_categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "active", default: true
    t.integer "laboratory_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["laboratory_id"], name: "index_sample_categories_on_laboratory_id"
  end

  create_table "sample_category_features", force: :cascade do |t|
    t.float "minimun_value", default: 0.0
    t.float "maximum_value", default: 0.0
    t.string "description"
    t.integer "sample_category_method_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sample_category_method_id"], name: "index_sample_category_features_on_sample_category_method_id"
  end

  create_table "sample_category_methods", force: :cascade do |t|
    t.integer "sample_category_id"
    t.integer "sample_method_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sample_category_id"], name: "index_sample_category_methods_on_sample_category_id"
    t.index ["sample_method_id"], name: "index_sample_category_methods_on_sample_method_id"
  end

  create_table "sample_methods", force: :cascade do |t|
    t.float "unit_cost"
    t.string "name"
    t.string "description"
    t.boolean "active", default: true
    t.integer "accreditation", default: 1
    t.integer "laboratory_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["laboratory_id"], name: "index_sample_methods_on_laboratory_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.date "date_of_birth"
    t.string "ruc"
    t.string "phone"
    t.string "address"
    t.string "contact_person"
    t.integer "gender"
    t.integer "category"
    t.boolean "active", default: true
    t.integer "laboratory_id"
    t.integer "role_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["laboratory_id"], name: "index_users_on_laboratory_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

end
