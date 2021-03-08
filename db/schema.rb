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

ActiveRecord::Schema.define(version: 2021_03_08_202644) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hacker_news_posts", force: :cascade do |t|
    t.string "external_id"
    t.string "url"
    t.string "title"
    t.datetime "posted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["external_id"], name: "index_hacker_news_posts_on_external_id", unique: true
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "email"
    t.string "unsub_token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_subscriptions_on_email", unique: true
    t.index ["unsub_token"], name: "index_subscriptions_on_unsub_token", unique: true
  end

end
