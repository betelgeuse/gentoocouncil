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

ActiveRecord::Schema.define(:version => 20100619002912) do

  create_table "agenda_items", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "approved",              :default => false
    t.text     "reason_of_disapproval"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "owner_id"
    t.integer  "approved_by_id"
    t.integer  "agenda_id"
  end

  add_index "agenda_items", ["agenda_id"], :name => "index_agenda_items_on_agenda_id"
  add_index "agenda_items", ["approved_by_id"], :name => "index_agenda_items_on_approved_by_id"
  add_index "agenda_items", ["owner_id"], :name => "index_agenda_items_on_owner_id"

  create_table "agendas", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "start_at"
    t.datetime "end_at"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "owner_id"
  end

  add_index "agendas", ["owner_id"], :name => "index_agendas_on_owner_id"

  create_table "attendances", :id => false, :force => true do |t|
    t.integer  "user_id"
    t.integer  "agenda_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attendances", ["agenda_id"], :name => "index_attendances_on_agenda_id"
  add_index "attendances", ["user_id"], :name => "index_attendances_on_user_id"

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "doodles", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "url"
    t.string   "admin_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "owner_id"
    t.integer  "agenda_id"
  end

  add_index "doodles", ["agenda_id"], :name => "index_doodles_on_agenda_id"
  add_index "doodles", ["owner_id"], :name => "index_doodles_on_owner_id"

  create_table "gleps", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "status",      :limit => 20, :default => "'--- :pending\n'"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "owner_id"
  end

  add_index "gleps", ["owner_id"], :name => "index_gleps_on_owner_id"

  create_table "questions", :force => true do |t|
    t.string   "name"
    t.text     "question"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
  end

  add_index "questions", ["creator_id"], :name => "index_questions_on_creator_id"

  create_table "users", :force => true do |t|
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "name"
    t.string   "email_address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",                                   :default => "active"
    t.datetime "key_timestamp"
    t.string   "role",                      :limit => 20, :default => "'"
    t.integer  "notify_in_advance",                       :default => 0
  end

  add_index "users", ["state"], :name => "index_users_on_state"

  create_table "votes", :force => true do |t|
    t.boolean  "support"
    t.text     "reasoning"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "question_id"
  end

  add_index "votes", ["question_id"], :name => "index_votes_on_question_id"
  add_index "votes", ["user_id"], :name => "index_votes_on_user_id"

end
