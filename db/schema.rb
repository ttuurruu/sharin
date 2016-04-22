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

ActiveRecord::Schema.define(version: 20160417040457) do

  create_table "ability_groupings", force: :cascade do |t|
    t.integer  "category"
    t.string   "code"
    t.string   "name"
    t.string   "ability_requirements_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ability_requirements", force: :cascade do |t|
    t.integer  "category"
    t.string   "code"
    t.string   "title"
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "config_columns", force: :cascade do |t|
    t.string   "column_name"
    t.string   "default_name_ja"
    t.string   "default_name_en"
    t.string   "default_name_zh"
    t.string   "custom_name_ja"
    t.string   "custom_name_en"
    t.string   "custom_name_zh"
    t.integer  "sys_lower"
    t.integer  "sys_high"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "config_form_columns", force: :cascade do |t|
    t.integer  "config_view_id"
    t.integer  "config_column_id"
    t.string   "attribute_type"
    t.boolean  "standard",         default: true
    t.boolean  "visible",          default: true
    t.integer  "view_order"
    t.string   "description_ja"
    t.string   "description_en"
    t.string   "description_zh"
    t.boolean  "required",         default: false
    t.integer  "default"
    t.integer  "custom_lower"
    t.integer  "custom_high"
    t.string   "grid_class_label"
    t.string   "grid_class_value"
    t.string   "data_source"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "config_form_footers", force: :cascade do |t|
    t.integer  "config_view_id"
    t.string   "attribute_type"
    t.string   "grid_class"
    t.string   "column_class"
    t.string   "locales_path"
    t.string   "font_awesome"
    t.string   "controller"
    t.string   "action"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "config_view_columns", force: :cascade do |t|
    t.integer  "config_view_id"
    t.integer  "config_column_id"
    t.string   "column_name"
    t.boolean  "visible",          default: true
    t.integer  "view_order",       default: 0
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "config_views", force: :cascade do |t|
    t.string   "controller"
    t.string   "action"
    t.string   "params"
    t.string   "title_ja"
    t.string   "title_en"
    t.string   "title_zh"
    t.string   "description_ja"
    t.string   "description_en"
    t.string   "description_zh"
    t.boolean  "views",          default: false
    t.boolean  "form_column",    default: false
    t.boolean  "form_footer",    default: false
    t.boolean  "view_column",    default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "evaluation_details", force: :cascade do |t|
    t.integer  "evaluation_header_id"
    t.integer  "user_id"
    t.integer  "category"
    t.string   "title"
    t.string   "content"
    t.integer  "weight"
    t.decimal  "result_rate_self"
    t.string   "result_content_self"
    t.decimal  "result_rate_primary"
    t.string   "result_content_primary"
    t.decimal  "result_rate_secondary"
    t.string   "result_content_secondary"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "evaluation_evaluators", force: :cascade do |t|
    t.integer  "evaluation_setting_id"
    t.integer  "path_level"
    t.integer  "user_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "evaluation_events", force: :cascade do |t|
    t.date     "started_on"
    t.date     "ended_on"
    t.string   "name"
    t.integer  "category"
    t.integer  "rate_max"
    t.integer  "rate_min"
    t.boolean  "two_phase"
    t.boolean  "objective"
    t.boolean  "feedback"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "evaluation_headers", force: :cascade do |t|
    t.integer  "evaluation_event_id"
    t.integer  "evaluation_setting_id"
    t.integer  "user_id"
    t.decimal  "mbo_rate_self"
    t.decimal  "mbo_rate_primary"
    t.decimal  "mbo_rate_secondary"
    t.decimal  "mbo_rate_fix"
    t.string   "mbo_coment_self"
    t.string   "mbo_coment_fix"
    t.decimal  "competency_rate_self"
    t.decimal  "competency_rate_primary"
    t.decimal  "competency_rate_secondary"
    t.decimal  "competency_rate_fix"
    t.string   "competency_coment_self"
    t.string   "competency_coment_fix"
    t.decimal  "total_rate_self"
    t.decimal  "total_rate_secondary"
    t.decimal  "total_rate_fix"
    t.string   "total_coment_self"
    t.decimal  "total_coment_primary"
    t.decimal  "total_coment_secondary"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "evaluation_objectives", force: :cascade do |t|
    t.string   "code"
    t.string   "title"
    t.string   "content"
    t.boolean  "enable",     default: true
    t.datetime "deleted_at"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "evaluation_settings", force: :cascade do |t|
    t.integer  "evaluation_event_id"
    t.integer  "user_id"
    t.integer  "objective_id"
    t.integer  "ability_grouping_id"
    t.integer  "progress",            default: 0
    t.datetime "deleted_at"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "member_communications", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "email1"
    t.string   "email2"
    t.string   "email3"
    t.string   "email4"
    t.string   "email5"
    t.string   "number1"
    t.string   "number2"
    t.string   "number3"
    t.string   "number4"
    t.string   "number5"
    t.string   "id1"
    t.string   "id2"
    t.string   "id3"
    t.string   "id4"
    t.string   "id5"
    t.string   "google"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "skype"
    t.string   "slack"
    t.string   "github"
    t.string   "linkedin"
    t.string   "dropbox"
    t.string   "instagram"
    t.string   "paypal"
    t.string   "pinterest"
    t.string   "slideshare"
    t.string   "stack_overflow"
    t.string   "trello"
    t.string   "tumblr"
    t.string   "youtube"
    t.string   "line"
    t.string   "hipchat"
    t.string   "chatwork"
    t.string   "qiita"
    t.string   "esa"
    t.string   "memo"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "member_names", force: :cascade do |t|
    t.integer  "user_id"
    t.date     "started_on"
    t.date     "ended_on"
    t.string   "name"
    t.string   "name_katakana"
    t.string   "name_romaji"
    t.string   "register"
    t.string   "register_katakana"
    t.string   "register_romaji"
    t.string   "memo"
    t.integer  "updated_status"
    t.integer  "updated_user"
    t.datetime "deleted_at"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "member_role_details", force: :cascade do |t|
    t.integer  "member_role_id"
    t.integer  "member_table_id"
    t.integer  "use_type"
    t.integer  "scope_type"
    t.integer  "level_type"
    t.integer  "time_type"
    t.integer  "crud_type"
    t.datetime "deleted_at"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "member_roles", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "order"
    t.boolean  "enable",      default: true
    t.datetime "deleted_at"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "member_systems", force: :cascade do |t|
    t.integer  "user_id"
    t.date     "started_on"
    t.date     "ended_on"
    t.boolean  "enable",         default: true
    t.integer  "member_role_id"
    t.boolean  "system_admin",   default: false
    t.string   "memo"
    t.integer  "updated_status"
    t.integer  "updated_user"
    t.datetime "deleted_at"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "member_tables", force: :cascade do |t|
    t.string   "name"
    t.integer  "category"
    t.integer  "hierarchy_level"
    t.integer  "data_type"
    t.string   "model"
    t.string   "controller"
    t.string   "font_awesome"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "table_settings", force: :cascade do |t|
    t.string   "form_name"
    t.integer  "form_type"
    t.string   "table_name"
    t.string   "column_name"
    t.string   "attribute_type"
    t.boolean  "standard",         default: true
    t.boolean  "use",              default: true
    t.integer  "order_input"
    t.integer  "order_list"
    t.integer  "order_result"
    t.string   "custom_name_ja"
    t.string   "custom_name_en"
    t.string   "description_ja"
    t.string   "description_en"
    t.boolean  "required",         default: false
    t.string   "default"
    t.string   "sys_lower"
    t.string   "sys_high"
    t.string   "custom_lower"
    t.string   "custom_high"
    t.string   "grid_class_label"
    t.string   "grid_class_value"
    t.string   "column_class"
    t.string   "locales_path"
    t.string   "font_awesome"
    t.string   "controller"
    t.string   "action"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "tenants", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_images", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "image"
    t.integer  "use"
    t.string   "memo"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_passwords", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "code"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
