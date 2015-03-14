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

ActiveRecord::Schema.define(version: 20150314210054) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chefs", force: :cascade do |t|
    t.string   "chefname",        limit: 255
    t.string   "email",           limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "password_digest", limit: 255
  end

  create_table "likes", force: :cascade do |t|
    t.boolean  "like"
    t.integer  "chef_id"
    t.integer  "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "likes", ["chef_id"], name: "index_likes_on_chef_id"
  add_index "likes", ["recipe_id"], name: "index_likes_on_recipe_id"

  create_table "recipe_categories", force: :cascade do |t|
    t.integer "recipe_id"
    t.integer "category_id"
  end

  add_index "recipe_categories", ["category_id"], name: "index_recipe_categories_on_category_id"
  add_index "recipe_categories", ["recipe_id"], name: "index_recipe_categories_on_recipe_id"

  create_table "recipes", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "summary"
    t.text     "description"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "chef_id"
    t.string   "picture",     limit: 255
  end

  add_index "recipes", ["chef_id"], name: "index_recipes_on_chef_id"

end
