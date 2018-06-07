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

ActiveRecord::Schema.define(version: 20180606140037) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"
  enable_extension "pgcrypto"

  create_table "canonical_route_instruments_for_recruits", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "canonical_route_instruments_for_recruits_relations", force: :cascade do |t|
    t.bigint "canonical_route_instruments_for_recruit_id", null: false
    t.bigint "instrument_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["canonical_route_instruments_for_recruit_id"], name: "index_crifrr_on_canonical_route_instruments_for_recruit_id"
    t.index ["instrument_id"], name: "index_crifrr_on_instrument_id"
  end

  create_table "canonical_route_region_for_recruits", force: :cascade do |t|
    t.bigint "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_canonical_route_region_for_recruits_on_region_id"
  end

  create_table "canonical_routes", force: :cascade do |t|
    t.string "canonical_routable_type"
    t.bigint "canonical_routable_id"
    t.string "path", null: false
    t.string "label", null: false
    t.string "category", null: false
    t.integer "order_in_Category"
    t.boolean "is_listed_on_top", default: false
    t.boolean "is_listed_on_model_top", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["canonical_routable_type", "canonical_routable_id"], name: "index_canonical_routes"
  end

  create_table "composer_countries", force: :cascade do |t|
    t.bigint "composer_id", null: false
    t.bigint "country_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["composer_id"], name: "index_composer_countries_on_composer_id"
    t.index ["country_id"], name: "index_composer_countries_on_country_id"
  end

  create_table "composers", force: :cascade do |t|
    t.string "display_name", null: false
    t.string "full_name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "concert_conductors", force: :cascade do |t|
    t.uuid "concert_id", null: false
    t.bigint "conductor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["concert_id"], name: "index_concert_conductors_on_concert_id"
    t.index ["conductor_id"], name: "index_concert_conductors_on_conductor_id"
  end

  create_table "concerts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title", null: false
    t.date "date", null: false
    t.time "doors_open"
    t.time "cirtain_time", null: false
    t.text "description"
    t.uuid "team_id", null: false
    t.bigint "hole_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hole_id"], name: "index_concerts_on_hole_id"
    t.index ["team_id"], name: "index_concerts_on_team_id"
  end

  create_table "conductors", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "holes", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.string "url"
    t.text "description"
    t.bigint "region_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_holes_on_region_id"
  end

  create_table "instrument_categories", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_instrument_categories_on_name"
  end

  create_table "instruments", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "short_name", null: false
    t.integer "sort_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "instrument_category_id", null: false
    t.index ["instrument_category_id"], name: "index_instruments_on_instrument_category_id"
    t.index ["name"], name: "index_instruments_on_name"
  end

  create_table "recruit_instruments", force: :cascade do |t|
    t.uuid "recruit_id", null: false
    t.bigint "instrument_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["instrument_id"], name: "index_recruit_instruments_on_instrument_id"
    t.index ["recruit_id"], name: "index_recruit_instruments_on_recruit_id"
  end

  create_table "recruits", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title", null: false
    t.string "practice_place"
    t.string "practice_time"
    t.text "description"
    t.datetime "published_from", null: false
    t.datetime "published_to", null: false
    t.uuid "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "concert_id"
    t.index ["concert_id"], name: "index_recruits_on_concert_id"
    t.index ["team_id"], name: "index_recruits_on_team_id"
  end

  create_table "regions", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "sort_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_regions_on_name"
  end

  create_table "repertoires", force: :cascade do |t|
    t.string "arranger"
    t.text "description"
    t.uuid "concert_id", null: false
    t.bigint "tune_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["concert_id"], name: "index_repertoires_on_concert_id"
    t.index ["tune_id"], name: "index_repertoires_on_tune_id"
  end

  create_table "solist_repertoires", force: :cascade do |t|
    t.bigint "solist_id", null: false
    t.bigint "repertoire_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["repertoire_id"], name: "index_solist_repertoires_on_repertoire_id"
    t.index ["solist_id"], name: "index_solist_repertoires_on_solist_id"
  end

  create_table "solists", force: :cascade do |t|
    t.string "name", null: false
    t.string "url"
    t.text "description"
    t.bigint "instrument_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["instrument_id"], name: "index_solists_on_instrument_id"
  end

  create_table "team_regions", force: :cascade do |t|
    t.uuid "team_id", null: false
    t.bigint "region_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_team_regions_on_region_id"
    t.index ["team_id"], name: "index_team_regions_on_team_id"
  end

  create_table "team_types", force: :cascade do |t|
    t.uuid "team_id", null: false
    t.bigint "type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_team_types_on_team_id"
    t.index ["type_id"], name: "index_team_types_on_type_id"
  end

  create_table "teams", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "password_digest", null: false
    t.string "mail"
    t.string "url"
    t.text "description"
    t.boolean "is_published", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tunes", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.bigint "composer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["composer_id"], name: "index_tunes_on_composer_id"
  end

  create_table "types", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_types_on_name"
  end

  add_foreign_key "concerts", "teams"
  add_foreign_key "recruits", "teams"
  add_foreign_key "repertoires", "concerts"
end
