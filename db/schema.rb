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

ActiveRecord::Schema.define(version: 20171229132236) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievements", force: :cascade do |t|
    t.string   "title",         null: false
    t.string   "description"
    t.string   "icon",          null: false
    t.date     "date"
    t.integer  "admin_user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["admin_user_id"], name: "index_achievements_on_admin_user_id", using: :btree
  end

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "superadmin",             default: false, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "attachments", force: :cascade do |t|
    t.integer  "attached_item_id"
    t.string   "attached_item_type"
    t.string   "attachment",         null: false
    t.string   "original_filename"
    t.string   "content_type"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["attached_item_id"], name: "index_attachments_on_attached_item_id", using: :btree
    t.index ["attached_item_type"], name: "index_attachments_on_attached_item_type", using: :btree
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type", using: :btree
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "name",          null: false
    t.string   "email",         null: false
    t.string   "subject",       null: false
    t.text     "message"
    t.integer  "admin_user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["admin_user_id"], name: "index_contacts_on_admin_user_id", using: :btree
  end

  create_table "contents", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "value",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "educations", force: :cascade do |t|
    t.string   "degree",        null: false
    t.string   "school_name",   null: false
    t.string   "school_url"
    t.string   "grade"
    t.date     "period_start"
    t.date     "period_end"
    t.text     "summary"
    t.integer  "admin_user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["admin_user_id"], name: "index_educations_on_admin_user_id", using: :btree
  end

  create_table "experiences", force: :cascade do |t|
    t.string   "job_title",         null: false
    t.string   "organization_name", null: false
    t.string   "organization_url"
    t.date     "period_start"
    t.date     "period_end"
    t.text     "summary"
    t.integer  "admin_user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["admin_user_id"], name: "index_experiences_on_admin_user_id", using: :btree
  end

  create_table "interests", force: :cascade do |t|
    t.string   "name",          null: false
    t.string   "icon",          null: false
    t.integer  "admin_user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["admin_user_id"], name: "index_interests_on_admin_user_id", using: :btree
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "full_name"
    t.string   "title"
    t.text     "about"
    t.string   "email"
    t.string   "phone"
    t.string   "image"
    t.string   "web_url"
    t.string   "address"
    t.integer  "admin_user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "resume"
    t.integer  "theme_id"
    t.string   "linkedin_url"
    t.string   "map_url"
    t.string   "facebook_url"
    t.index ["admin_user_id"], name: "index_profiles_on_admin_user_id", using: :btree
    t.index ["email"], name: "index_profiles_on_email", using: :btree
    t.index ["full_name"], name: "index_profiles_on_full_name", using: :btree
    t.index ["title"], name: "index_profiles_on_title", using: :btree
  end

  create_table "project_categories", force: :cascade do |t|
    t.string   "name",                      null: false
    t.integer  "admin_user_id",             null: false
    t.integer  "position",      default: 0
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["admin_user_id"], name: "index_project_categories_on_admin_user_id", using: :btree
    t.index ["name"], name: "index_project_categories_on_name", using: :btree
    t.index ["position"], name: "index_project_categories_on_position", using: :btree
  end

  create_table "project_categories_projects", id: false, force: :cascade do |t|
    t.integer "project_id"
    t.integer "project_category_id"
    t.index ["project_category_id"], name: "index_project_categories_projects_on_project_category_id", using: :btree
    t.index ["project_id"], name: "index_project_categories_projects_on_project_id", using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.string   "title",         null: false
    t.string   "url"
    t.string   "image"
    t.text     "summary"
    t.text     "tags"
    t.integer  "admin_user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["admin_user_id"], name: "index_projects_on_admin_user_id", using: :btree
  end

  create_table "publications", force: :cascade do |t|
    t.string   "title",                        null: false
    t.string   "description"
    t.string   "publisher",                    null: false
    t.date     "publication_date"
    t.string   "publication_url"
    t.integer  "position",         default: 0, null: false
    t.integer  "admin_user_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["admin_user_id"], name: "index_publications_on_admin_user_id", using: :btree
  end

  create_table "services", force: :cascade do |t|
    t.string   "title",         null: false
    t.string   "description"
    t.string   "icon",          null: false
    t.integer  "admin_user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["admin_user_id"], name: "index_services_on_admin_user_id", using: :btree
  end

  create_table "skill_types", force: :cascade do |t|
    t.string   "name",                      null: false
    t.integer  "admin_user_id",             null: false
    t.integer  "position",      default: 0
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["admin_user_id"], name: "index_skill_types_on_admin_user_id", using: :btree
    t.index ["name"], name: "index_skill_types_on_name", using: :btree
    t.index ["position"], name: "index_skill_types_on_position", using: :btree
  end

  create_table "skills", force: :cascade do |t|
    t.string   "name",                        null: false
    t.integer  "admin_user_id",               null: false
    t.float    "score",         default: 0.0, null: false
    t.integer  "skill_type_id",               null: false
    t.integer  "position",      default: 0
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["admin_user_id"], name: "index_skills_on_admin_user_id", using: :btree
    t.index ["name"], name: "index_skills_on_name", using: :btree
    t.index ["position"], name: "index_skills_on_position", using: :btree
    t.index ["score"], name: "index_skills_on_score", using: :btree
    t.index ["skill_type_id"], name: "index_skills_on_skill_type_id", using: :btree
  end

  create_table "themes", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "color"
    t.string   "value",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_contents", force: :cascade do |t|
    t.integer  "admin_user_id"
    t.integer  "content_id"
    t.integer  "position",      default: 0
    t.boolean  "is_visible",    default: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["admin_user_id"], name: "index_user_contents_on_admin_user_id", using: :btree
    t.index ["content_id"], name: "index_user_contents_on_content_id", using: :btree
  end

end
