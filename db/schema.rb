# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100210234603) do

  create_table "editions", :force => true do |t|
    t.integer  "language_id"
    t.integer  "opus_id"
    t.string   "title"
    t.string   "translator"
    t.integer  "year"
    t.string   "country"
    t.string   "city"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
    t.boolean  "selected"
  end

  create_table "entries", :force => true do |t|
    t.integer  "tocentry_id"
    t.integer  "edition_id"
    t.text     "content"
    t.text     "notes"
    t.text     "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "flags", :force => true do |t|
    t.integer  "trope_id"
    t.integer  "tocentry_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "languages", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "opera", :force => true do |t|
    t.string   "title"
    t.string   "author"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tocentries", :force => true do |t|
    t.integer  "opus_id"
    t.string   "name"
    t.string   "code"
    t.string   "toctype"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
    t.boolean  "starred"
  end

  add_index "tocentries", ["code"], :name => "tocentries_code_index", :unique => true

  create_table "trope_translations", :force => true do |t|
    t.integer  "language_id"
    t.string   "title"
    t.text     "description"
    t.integer  "trope_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tropes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
