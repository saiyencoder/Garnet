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

ActiveRecord::Schema.define(version: 20171022233306) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.integer "season_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "week"
    t.string "scorer"
    t.integer "team_id"
  end

  create_table "player_games", force: :cascade do |t|
    t.integer "game_id"
    t.integer "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.integer "team_id"
    t.boolean "commissioner"
    t.boolean "captain"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seasons", force: :cascade do |t|
    t.string "quarter"
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stats", force: :cascade do |t|
    t.integer "game_id"
    t.integer "player_id"
    t.integer "points"
    t.integer "three_points"
    t.integer "rebounds"
    t.integer "assists"
    t.integer "steals"
    t.integer "blocks"
    t.decimal "field_goal_percentage", precision: 6, scale: 2
    t.decimal "three_point_field_goal_percentage", precision: 6, scale: 2
    t.decimal "free_throw_percentage", precision: 6, scale: 2
    t.integer "fouls"
    t.integer "field_goal_made"
    t.integer "field_goal_attempt"
    t.integer "three_point_made"
    t.integer "three_point_attempt"
    t.integer "win"
    t.integer "loss"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

end
