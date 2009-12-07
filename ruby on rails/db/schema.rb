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

ActiveRecord::Schema.define(:version => 20091207162625) do

  create_table "centras", :force => true do |t|
    t.string   "pavadinimas"
    t.integer  "vietu_skaicius"
    t.integer  "ligoniu_skaicius"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "erdvelaivis", :force => true do |t|
    t.string   "modelis"
    t.date     "pagaminimo_data"
    t.integer  "vietos"
    t.integer  "greitis"
    t.string   "busena"
    t.float    "kuro_sanaudos"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kosmonautas", :force => true do |t|
    t.string   "vardas"
    t.string   "pavarde"
    t.date     "gimimo_data"
    t.string   "lytis"
    t.string   "vieta"
    t.integer  "bukle"
    t.integer  "erdvelaivis_id"
    t.integer  "stotis_id"
    t.integer  "centras_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stotis", :force => true do |t|
    t.string   "pavadinimas"
    t.integer  "vietu_skaicius"
    t.integer  "ligoniu_skaicius"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
