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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110215164529) do

  create_table "checklists", :force => true do |t|
    t.string   "task"
    t.boolean  "ready"
    t.datetime "duedate"
  end

  create_table "clippings", :force => true do |t|
    t.string   "book"
    t.string   "author"
    t.string   "location"
    t.datetime "date"
    t.text     "quote"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kindle_files", :force => true do |t|
    t.string   "contents"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", :force => true do |t|
    t.string   "task"
    t.boolean  "ready"
    t.datetime "duedate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
