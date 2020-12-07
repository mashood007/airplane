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

ActiveRecord::Schema.define(version: 2020_12_03_140831) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "planes", force: :cascade do |t|
    t.string "name"
    t.integer "queue"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seat_groups", force: :cascade do |t|
    t.integer "total_columns"
    t.integer "total_rows"
    t.bigint "plane_id"
    t.integer "chain_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plane_id"], name: "index_seat_groups_on_plane_id"
  end

  create_table "seats", force: :cascade do |t|
    t.integer "row_number"
    t.integer "col_number"
    t.bigint "seat_group_id"
    t.integer "status"
    t.integer "cat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["seat_group_id"], name: "index_seats_on_seat_group_id"
  end

end
