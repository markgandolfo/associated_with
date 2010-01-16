ActiveRecord::Schema.define do
  self.verbose = false
  
  create_table "analysts", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "computers", :force => true do |t|
    t.string   "name"
    t.integer  "programmer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "document_stores", :force => true do |t|
    t.string   "name"
    t.integer  "document_id"
    t.integer  "analyst_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "documents", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "programmers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
  
  create_table "programmers_projects", :force => true, :id => false do |t|
    t.string   "project_id"
    t.string   "programmer_id"
  end

  create_table "tasks", :force => true do |t|
    t.string   "name"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
  
end