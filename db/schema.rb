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

ActiveRecord::Schema.define(version: 20160102202742) do

  create_table "comments", force: :cascade do |t|
    t.text     "text"
    t.integer  "user_id"
    t.integer  "comment_id"
    t.datetime "comment_creation_date"
    t.integer  "post_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.text     "links"
    t.text     "domains"
  end

  create_table "comments_domains", id: false, force: :cascade do |t|
    t.integer "comment_id", null: false
    t.integer "domain_id",  null: false
  end

  add_index "comments_domains", ["comment_id", "domain_id"], name: "index_comments_domains_on_comment_id_and_domain_id"
  add_index "comments_domains", ["domain_id", "comment_id"], name: "index_comments_domains_on_domain_id_and_comment_id"

  create_table "comments_links", id: false, force: :cascade do |t|
    t.integer "comment_id", null: false
    t.integer "link_id",    null: false
  end

  add_index "comments_links", ["comment_id", "link_id"], name: "index_comments_links_on_comment_id_and_link_id"
  add_index "comments_links", ["link_id", "comment_id"], name: "index_comments_links_on_link_id_and_comment_id"

  create_table "domains", force: :cascade do |t|
    t.string   "domain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "links", force: :cascade do |t|
    t.string   "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "display_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
