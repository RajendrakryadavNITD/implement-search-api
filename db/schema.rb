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

ActiveRecord::Schema.define(version: 20170825185937) do

  create_table "authors", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "author_bio",  limit: 65535
    t.string   "profile_pic", limit: 255
    t.text     "academics",   limit: 65535
    t.text     "awards",      limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "books", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.text     "short_description",   limit: 65535
    t.text     "long_description",    limit: 65535
    t.integer  "chapter_index",       limit: 4
    t.date     "date_of_publication"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "book_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "genres", ["book_id"], name: "index_genres_on_book_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.string   "reviewer_name",      limit: 255
    t.integer  "rating",             limit: 4
    t.text     "review_title",       limit: 65535
    t.text     "review_description", limit: 65535
    t.integer  "book_id",            limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "reviews", ["book_id"], name: "index_reviews_on_book_id", using: :btree

  add_foreign_key "genres", "books"
  add_foreign_key "reviews", "books"
end
