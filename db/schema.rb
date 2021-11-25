# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_22_083156) do

  create_table "departments", primary_key: "code", id: :string, force: :cascade do |t|
    t.string "name", null: false
    t.string "parent_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "employees", primary_key: "id_e", id: :string, force: :cascade do |t|
    t.string "password", null: false
    t.string "first"
    t.string "last"
    t.string "code"
    t.string "shifter_code"
    t.float "ot_plan"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "keep_shifts", primary_key: "id_e", id: :string, force: :cascade do |t|
    t.string "keep_shift"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "managers", primary_key: "parent_code", id: :string, force: :cascade do |t|
    t.string "id_m", null: false
    t.string "password", null: false
    t.string "first"
    t.string "last"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "shift_times", primary_key: "shifter_code", id: :string, force: :cascade do |t|
    t.datetime "start_plan"
    t.datetime "end_plan"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "time_recodes", force: :cascade do |t|
    t.string "id_e", null: false
    t.datetime "start_actual"
    t.datetime "end_actual"
    t.float "ot_actual", default: 0.0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["id_e"], name: "index_time_recodes_on_id_e"
  end

  add_foreign_key "time_recodes", "employees", column: "id_e", primary_key: "id_e"
end
