# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_22_195424) do

  create_table "activities", force: :cascade do |t|
    t.integer "activity_value_id", null: false
    t.integer "project_id", null: false
    t.date "activity_date"
    t.text "notes"
    t.boolean "important"
    t.boolean "archived"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["activity_value_id"], name: "index_activities_on_activity_value_id"
    t.index ["project_id"], name: "index_activities_on_project_id"
  end

  create_table "activity_values", force: :cascade do |t|
    t.string "value"
    t.integer "sort_id"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "payment_method_values", force: :cascade do |t|
    t.string "value"
    t.integer "sort_id"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "project_tasks", force: :cascade do |t|
    t.integer "project_id", null: false
    t.integer "task_id", null: false
    t.boolean "completed"
    t.date "completed_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_project_tasks_on_project_id"
    t.index ["task_id"], name: "index_project_tasks_on_task_id"
  end

  create_table "projects", force: :cascade do |t|
    t.integer "job_number", null: false
    t.integer "status_value_id", null: false
    t.string "address1", null: false
    t.string "address2"
    t.string "city"
    t.text "project_description"
    t.integer "payment_method_value_id", null: false
    t.integer "client_id"
    t.integer "budget"
    t.date "contract_date"
    t.date "st_contract_received_date"
    t.date "trusses_received_date"
    t.date "framing_due_date"
    t.date "foundation_due_date"
    t.date "email_from_dwg_received_date"
    t.date "contract_proposal_sent_date"
    t.boolean "ready_to_be_invoiced"
    t.date "ready_to_be_invoiced_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_projects_on_client_id"
    t.index ["payment_method_value_id"], name: "index_projects_on_payment_method_value_id"
    t.index ["status_value_id"], name: "index_projects_on_status_value_id"
  end

  create_table "status_values", force: :cascade do |t|
    t.string "value"
    t.integer "sort_id"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "task_categories", force: :cascade do |t|
    t.string "value"
    t.integer "sort_id"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.integer "task_category_id", null: false
    t.integer "sort_id"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["task_category_id"], name: "index_tasks_on_task_category_id"
  end

  add_foreign_key "activities", "activity_values"
  add_foreign_key "activities", "projects"
  add_foreign_key "project_tasks", "projects"
  add_foreign_key "project_tasks", "tasks"
  add_foreign_key "projects", "clients"
  add_foreign_key "projects", "payment_method_values"
  add_foreign_key "projects", "status_values"
  add_foreign_key "tasks", "task_categories"
end
