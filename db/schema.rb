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

ActiveRecord::Schema.define(version: 2021_10_14_170912) do

  create_table "departments", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "parent_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "id_e"
    t.string "first"
    t.string "last"
    t.string "code"
    t.string "shifter_code"
    t.integer "ot_plan"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "managers", force: :cascade do |t|
    t.string "id_m"
    t.string "password"
    t.string "first"
    t.string "last"
    t.string "parent_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "shift_times", force: :cascade do |t|
    t.string "shifter_code"
    t.datetime "start_plan"
    t.datetime "end_plan"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "time_recodes", force: :cascade do |t|
    t.string "id_e"
    t.datetime "start_actual"
    t.datetime "end_actual"
    t.integer "ot_actual"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
