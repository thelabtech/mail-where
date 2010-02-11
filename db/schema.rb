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

ActiveRecord::Schema.define(:version => 20100210132657) do

  create_table "academic_departments", :force => true do |t|
    t.string "name"
  end

  create_table "am_friends_people_deprecated", :id => false, :force => true do |t|
    t.integer "friend_id", :null => false
    t.integer "person_id", :null => false
  end

  create_table "am_group_links_deprecated", :force => true do |t|
    t.string  "api",         :limit => 50,         :null => false
    t.string  "url",         :limit => 500,        :null => false
    t.string  "title",       :limit => 500
    t.text    "description", :limit => 2147483647
    t.integer "group_id",                          :null => false
  end

  add_index "am_group_links_deprecated", ["group_id"], :name => "group_id"

  create_table "am_group_messages_deprecated", :force => true do |t|
    t.string   "subject",    :limit => 500
    t.text     "body",       :limit => 2147483647
    t.datetime "created_on",                       :null => false
    t.integer  "group_id",                         :null => false
    t.integer  "person_id",                        :null => false
  end

  add_index "am_group_messages_deprecated", ["group_id"], :name => "group_id"
  add_index "am_group_messages_deprecated", ["person_id"], :name => "person_id"

  create_table "am_groups_deprecated", :force => true do |t|
    t.string  "name",                                :null => false
    t.string  "url_safe_name",                       :null => false
    t.text    "description",   :limit => 2147483647
    t.string  "group_type",    :limit => 50
    t.integer "lookup_id"
  end

  add_index "am_groups_deprecated", ["lookup_id"], :name => "lookup_id"

  create_table "am_groups_people_deprecated", :id => false, :force => true do |t|
    t.integer  "person_id",  :null => false
    t.integer  "group_id",   :null => false
    t.datetime "created_on"
  end

  create_table "am_personal_links_deprecated", :force => true do |t|
    t.string  "api",         :limit => 50,         :null => false
    t.string  "url",         :limit => 500,        :null => false
    t.string  "title",       :limit => 500
    t.text    "description", :limit => 2147483647
    t.integer "person_id",                         :null => false
  end

  add_index "am_personal_links_deprecated", ["person_id"], :name => "person_id"

  create_table "aoas", :force => true do |t|
    t.string "name"
  end

  create_table "ap_signup_deprecated", :primary_key => "ambassadorPledgeID", :force => true do |t|
    t.datetime "pledgeDate"
    t.integer  "fk_PersonID", :null => false
  end

  add_index "ap_signup_deprecated", ["fk_PersonID"], :name => "fk_PersonID"

  create_table "cms_assoc_filecategory", :id => false, :force => true do |t|
    t.string  "CmsFileID",     :limit => 64,                   :null => false
    t.string  "CmsCategoryID", :limit => 64,                   :null => false
    t.boolean "dbioDummy",                   :default => true
  end

  create_table "cms_cmscategory", :primary_key => "CmsCategoryID", :force => true do |t|
    t.integer "parentCategory"
    t.string  "catName",        :limit => 256
    t.string  "catDesc",        :limit => 2000
    t.string  "path",           :limit => 2000
    t.string  "pathid",         :limit => 2000
  end

  add_index "cms_cmscategory", ["parentCategory"], :name => "index1"

  create_table "cms_cmsfile", :primary_key => "CmsFileID", :force => true do |t|
    t.string   "mime",         :limit => 128
    t.string   "title",        :limit => 256
    t.integer  "accessCount"
    t.datetime "dateAdded"
    t.datetime "dateModified"
    t.string   "moderatedYet", :limit => 1
    t.string   "summary",      :limit => 4000
    t.string   "quality",      :limit => 256
    t.datetime "expDate"
    t.datetime "lastAccessed"
    t.string   "modMsg",       :limit => 4000
    t.string   "keywords",     :limit => 4000
    t.string   "url",          :limit => 128
    t.string   "detail",       :limit => 4000
    t.string   "language",     :limit => 128
    t.string   "version",      :limit => 128
    t.string   "author",       :limit => 256
    t.string   "submitter",    :limit => 256
    t.string   "contact",      :limit => 256
    t.integer  "rating"
  end

  add_index "cms_cmsfile", ["accessCount"], :name => "index1"

  create_table "cms_viewcategoryidfiles", :id => false, :force => true do |t|
    t.integer  "CmsFileID",                     :default => 0, :null => false
    t.string   "mime",          :limit => 128
    t.string   "title",         :limit => 256
    t.integer  "accessCount"
    t.datetime "dateAdded"
    t.datetime "dateModified"
    t.string   "moderatedYet",  :limit => 1
    t.string   "summary",       :limit => 4000
    t.string   "quality",       :limit => 256
    t.datetime "expDate"
    t.datetime "lastAccessed"
    t.string   "modMsg",        :limit => 4000
    t.string   "keywords",      :limit => 4000
    t.string   "url",           :limit => 128
    t.string   "detail",        :limit => 4000
    t.string   "language",      :limit => 128
    t.string   "version",       :limit => 128
    t.string   "author",        :limit => 256
    t.string   "submitter",     :limit => 256
    t.string   "contact",       :limit => 256
    t.integer  "rating"
    t.string   "CmsCategoryID", :limit => 64,                  :null => false
  end

  create_table "cms_viewfileidcategories", :id => false, :force => true do |t|
    t.integer "CmsCategoryID",                  :default => 0, :null => false
    t.integer "parentCategory"
    t.string  "catName",        :limit => 256
    t.string  "catDesc",        :limit => 2000
    t.string  "path",           :limit => 2000
    t.string  "pathid",         :limit => 2000
    t.string  "CmsFileID",      :limit => 64,                  :null => false
  end

  create_table "cms_viewfilesandcategories", :id => false, :force => true do |t|
    t.integer  "CmsFileID",                      :default => 0, :null => false
    t.string   "mime",           :limit => 128
    t.string   "title",          :limit => 256
    t.integer  "accessCount"
    t.datetime "dateAdded"
    t.datetime "dateModified"
    t.string   "moderatedYet",   :limit => 1
    t.string   "summary",        :limit => 4000
    t.string   "quality",        :limit => 256
    t.datetime "expDate"
    t.datetime "lastAccessed"
    t.string   "modMsg",         :limit => 4000
    t.string   "keywords",       :limit => 4000
    t.string   "url",            :limit => 128
    t.string   "detail",         :limit => 4000
    t.string   "language",       :limit => 128
    t.string   "version",        :limit => 128
    t.string   "author",         :limit => 256
    t.string   "submitter",      :limit => 256
    t.string   "contact",        :limit => 256
    t.integer  "rating"
    t.integer  "CmsCategoryID",                  :default => 0, :null => false
    t.integer  "parentCategory"
    t.string   "catName",        :limit => 256
    t.string   "catDesc",        :limit => 2000
    t.string   "path",           :limit => 2000
    t.string   "pathid",         :limit => 2000
  end

  create_table "counties", :force => true do |t|
    t.string "name"
    t.string "state"
  end

  add_index "counties", ["state"], :name => "state"

  create_table "countries", :force => true do |t|
    t.string  "country",  :limit => 100
    t.string  "code",     :limit => 10
    t.boolean "closed",                  :default => false
    t.string  "iso_code"
  end

  create_table "crs2_additional_expenses_item", :force => true do |t|
    t.string   "type",               :limit => 31, :default => "", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version",                                          :null => false
    t.integer  "location",                                         :null => false
    t.string   "note"
    t.string   "header"
    t.text     "text"
    t.integer  "expense_id"
    t.integer  "registrant_type_id",                               :null => false
  end

  add_index "crs2_additional_expenses_item", ["expense_id"], :name => "fk_additional_expenses_item_expense_id"
  add_index "crs2_additional_expenses_item", ["registrant_type_id", "expense_id"], :name => "unique_registrant_type_expense", :unique => true
  add_index "crs2_additional_expenses_item", ["registrant_type_id"], :name => "fk_additional_expenses_item_registrant_type_id"

  create_table "crs2_additional_info_item", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version",                     :null => false
    t.integer  "location",                    :null => false
    t.text     "text"
    t.string   "title",         :limit => 60
    t.integer  "conference_id"
  end

  add_index "crs2_additional_info_item", ["conference_id"], :name => "fk_additional_info_item_conference_id"

  create_table "crs2_answer", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version",           :null => false
    t.boolean  "value_boolean"
    t.date     "value_date"
    t.float    "value_double"
    t.integer  "value_int"
    t.string   "value_string"
    t.text     "value_text"
    t.integer  "question_usage_id", :null => false
    t.integer  "registrant_id",     :null => false
  end

  add_index "crs2_answer", ["question_usage_id"], :name => "fk_answer_question_usage_id"
  add_index "crs2_answer", ["registrant_id", "question_usage_id"], :name => "unique_registrant_question_usage", :unique => true
  add_index "crs2_answer", ["registrant_id"], :name => "fk_answer_registrant_id"

  create_table "crs2_conference", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version",                                    :null => false
    t.boolean  "accept_american_express"
    t.boolean  "accept_discover"
    t.boolean  "accept_master_card"
    t.boolean  "accept_scholarships"
    t.boolean  "accept_visa"
    t.string   "admin_password",             :default => "", :null => false
    t.string   "authnet_api_login_id"
    t.string   "authnet_transaction_key"
    t.date     "begin_date",                                 :null => false
    t.string   "check_payable_to"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "email"
    t.string   "contact_name"
    t.string   "phone"
    t.string   "state"
    t.string   "zip"
    t.text     "description"
    t.date     "end_date",                                   :null => false
    t.string   "ministry_type"
    t.string   "name",                       :default => "", :null => false
    t.boolean  "offer_families_extra_rooms"
    t.string   "power_user_password"
    t.string   "region"
    t.datetime "registration_ends_at",                       :null => false
    t.datetime "registration_starts_at",                     :null => false
    t.string   "status",                     :default => "", :null => false
    t.string   "theme"
    t.integer  "url_base_id"
    t.integer  "creator_id",                                 :null => false
    t.string   "home_page_address"
    t.boolean  "ride_share"
    t.string   "event_address1"
    t.string   "event_address2"
    t.string   "event_city"
    t.string   "event_state"
    t.string   "event_zip"
  end

  add_index "crs2_conference", ["creator_id"], :name => "fk_conference_creator_id"
  add_index "crs2_conference", ["name"], :name => "unique_name", :unique => true
  add_index "crs2_conference", ["url_base_id"], :name => "fk_conference_url_base_id"

  create_table "crs2_configuration", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version",                        :null => false
    t.boolean  "added_builtin_common_questions"
    t.integer  "default_url_base_id"
  end

  add_index "crs2_configuration", ["default_url_base_id"], :name => "fk_configuration_default_url_base_id"

  create_table "crs2_custom_questions_item", :force => true do |t|
    t.string   "type",               :limit => 31, :default => "", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version",                                          :null => false
    t.integer  "location",                                         :null => false
    t.text     "text"
    t.boolean  "required"
    t.integer  "registrant_type_id",                               :null => false
    t.integer  "question_id"
  end

  add_index "crs2_custom_questions_item", ["question_id"], :name => "fk_custom_questions_item_question_id"
  add_index "crs2_custom_questions_item", ["registrant_type_id", "question_id"], :name => "unique_registrant_type_question", :unique => true
  add_index "crs2_custom_questions_item", ["registrant_type_id"], :name => "fk_custom_questions_item_registrant_type_id"

  create_table "crs2_custom_stylesheet", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version",       :null => false
    t.text     "customcss"
    t.integer  "conference_id", :null => false
  end

  add_index "crs2_custom_stylesheet", ["conference_id"], :name => "fk_custom_stylesheet_conference_id"

  create_table "crs2_expense", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version",                                                    :null => false
    t.decimal  "cost",                        :precision => 12, :scale => 2
    t.text     "description"
    t.string   "name",          :limit => 60
    t.integer  "conference_id",                                              :null => false
    t.boolean  "disabled"
  end

  add_index "crs2_expense", ["conference_id"], :name => "fk_expense_conference_id"

  create_table "crs2_expense_selection", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version",          :null => false
    t.boolean  "selected"
    t.integer  "registrant_id",    :null => false
    t.integer  "expense_usage_id", :null => false
  end

  add_index "crs2_expense_selection", ["expense_usage_id"], :name => "fk_expense_selection_expense_usage_id"
  add_index "crs2_expense_selection", ["registrant_id", "expense_usage_id"], :name => "unique_registrant_expense_usage", :unique => true
  add_index "crs2_expense_selection", ["registrant_id"], :name => "fk_expense_selection_registrant_id"

  create_table "crs2_module_usage", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version",       :null => false
    t.string   "name"
    t.integer  "conference_id"
  end

  add_index "crs2_module_usage", ["conference_id"], :name => "fk_module_usage_conference_id"

  create_table "crs2_person", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version",            :null => false
    t.datetime "birth_date"
    t.string   "campus"
    t.string   "current_address1"
    t.string   "current_address2"
    t.string   "current_city"
    t.string   "current_country"
    t.string   "current_phone"
    t.string   "current_state"
    t.string   "current_zip"
    t.string   "email"
    t.string   "first_name"
    t.string   "gender"
    t.datetime "graduation_date"
    t.string   "greek_affiliation"
    t.string   "last_name"
    t.string   "major"
    t.string   "marital_status"
    t.string   "middle_name"
    t.string   "permanent_address1"
    t.string   "permanent_address2"
    t.string   "permanent_city"
    t.string   "permanent_country"
    t.string   "permanent_phone"
    t.string   "permanent_state"
    t.string   "permanent_zip"
    t.string   "university_state"
    t.string   "year_in_school"
  end

  create_table "crs2_profile", :force => true do |t|
    t.string   "type",               :limit => 31, :default => "", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version",                                          :null => false
    t.integer  "crs_person_id"
    t.integer  "user_id"
    t.integer  "ministry_person_id"
  end

  add_index "crs2_profile", ["crs_person_id"], :name => "fk_profile_crs_person_id"
  add_index "crs2_profile", ["crs_person_id"], :name => "unique_crs_person", :unique => true
  add_index "crs2_profile", ["ministry_person_id"], :name => "fk_profile_ministry_person_id"
  add_index "crs2_profile", ["ministry_person_id"], :name => "unique_ministry_person", :unique => true
  add_index "crs2_profile", ["user_id"], :name => "fk_profile_user_id"
  add_index "crs2_profile", ["user_id"], :name => "unique_user", :unique => true

  create_table "crs2_profile_question", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version",                            :null => false
    t.string   "property_name",      :default => "", :null => false
    t.integer  "requirement",                        :null => false
    t.integer  "registrant_type_id"
  end

  add_index "crs2_profile_question", ["registrant_type_id"], :name => "fk_profile_question_registrant_type_id"

  create_table "crs2_question", :force => true do |t|
    t.string   "type",          :limit => 31, :default => "", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version",                                     :null => false
    t.boolean  "common"
    t.string   "name",          :limit => 60, :default => "", :null => false
    t.text     "text",                                        :null => false
    t.integer  "conference_id"
  end

  add_index "crs2_question", ["conference_id"], :name => "fk_question_conference_id"
  add_index "crs2_question", ["name", "conference_id"], :name => "unique_name_conference", :unique => true

  create_table "crs2_question_option", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version",                            :null => false
    t.integer  "location",                           :null => false
    t.string   "name",               :default => "", :null => false
    t.string   "value",              :default => "", :null => false
    t.integer  "option_question_id",                 :null => false
  end

  add_index "crs2_question_option", ["option_question_id", "name"], :name => "unique_option_question_name", :unique => true
  add_index "crs2_question_option", ["option_question_id", "value"], :name => "unique_option_question_value", :unique => true
  add_index "crs2_question_option", ["option_question_id"], :name => "fk_question_option_option_question_id"

  create_table "crs2_registrant", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version",                                                :null => false
    t.date     "arrival_date"
    t.datetime "began_at"
    t.datetime "cancelled_at"
    t.boolean  "commuting"
    t.datetime "completed_at"
    t.date     "departure_date"
    t.string   "registrant_role"
    t.boolean  "requires_childcare"
    t.string   "status",                                 :default => "", :null => false
    t.integer  "registration_before_cancellation_id"
    t.integer  "cancelled_by_id"
    t.integer  "profile_id",                                             :null => false
    t.integer  "registrant_type_id"
    t.integer  "registrant_type_before_cancellation_id"
    t.integer  "registration_id"
    t.string   "early_registration_override"
    t.boolean  "name_disabled"
  end

  add_index "crs2_registrant", ["cancelled_by_id"], :name => "fk_registrant_cancelled_by_id"
  add_index "crs2_registrant", ["profile_id", "registrant_type_id"], :name => "unique_profile_registrant_type", :unique => true
  add_index "crs2_registrant", ["profile_id"], :name => "fk_registrant_profile_id"
  add_index "crs2_registrant", ["registrant_type_before_cancellation_id"], :name => "fk_registrant_registrant_type_before_cancellation_id"
  add_index "crs2_registrant", ["registrant_type_id"], :name => "fk_registrant_registrant_type_id"
  add_index "crs2_registrant", ["registration_before_cancellation_id"], :name => "fk_registrant_registration_before_cancellation_id"
  add_index "crs2_registrant", ["registration_id"], :name => "fk_registrant_registration_id"

  create_table "crs2_registrant_type", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version",                                                                                     :null => false
    t.boolean  "accept_checks"
    t.boolean  "accept_credit_cards"
    t.boolean  "accept_ministry_account_transfers"
    t.boolean  "accept_scholarships"
    t.boolean  "accept_staff_account_transfers"
    t.text     "additional_confirmation_email_text"
    t.boolean  "allow_children"
    t.boolean  "allow_commute"
    t.boolean  "allow_spouse"
    t.boolean  "ask_arrival_date"
    t.boolean  "ask_departure_date"
    t.boolean  "childcare_available"
    t.date     "default_arrival_date"
    t.date     "default_departure_date"
    t.text     "description",                                                                                 :null => false
    t.boolean  "is_child_type"
    t.decimal  "married_commuter_cost",                        :precision => 12, :scale => 2
    t.decimal  "married_commuter_early_reg_discount",          :precision => 12, :scale => 2
    t.decimal  "married_commuter_full_payment_discount",       :precision => 12, :scale => 2
    t.datetime "married_discount_early_registration_deadline"
    t.decimal  "married_onsite_cost",                          :precision => 12, :scale => 2
    t.decimal  "married_onsite_early_reg_discount",            :precision => 12, :scale => 2
    t.decimal  "married_onsite_full_payment_discount",         :precision => 12, :scale => 2
    t.decimal  "married_required_deposit",                     :precision => 12, :scale => 2
    t.string   "name",                                                                        :default => "", :null => false
    t.boolean  "offer_childcare"
    t.text     "registration_complete_email"
    t.decimal  "single_commuter_cost",                         :precision => 12, :scale => 2
    t.decimal  "single_commuter_early_reg_discount",           :precision => 12, :scale => 2
    t.decimal  "single_commuter_full_payment_discount",        :precision => 12, :scale => 2
    t.datetime "single_discount_early_registration_deadline"
    t.decimal  "single_onsite_cost",                           :precision => 12, :scale => 2
    t.decimal  "single_onsite_early_reg_discount",             :precision => 12, :scale => 2
    t.decimal  "single_onsite_full_payment_discount",          :precision => 12, :scale => 2
    t.decimal  "single_required_deposit",                      :precision => 12, :scale => 2
    t.integer  "conference_id",                                                                               :null => false
    t.boolean  "defer_online_payment"
    t.boolean  "require_full_payment"
    t.boolean  "shut_off"
    t.text     "shut_off_message"
  end

  add_index "crs2_registrant_type", ["conference_id"], :name => "fk_registrant_type_conference_id"

  create_table "crs2_registration", :force => true do |t|
    t.string   "type",            :limit => 31, :default => "", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version",                                       :null => false
    t.datetime "began_at"
    t.datetime "cancelled_at"
    t.binary   "cancelled_by"
    t.datetime "completed_at"
    t.string   "status",                        :default => "", :null => false
    t.integer  "extra_rooms"
    t.integer  "creator_id"
    t.integer  "cancelled_by_id"
  end

  add_index "crs2_registration", ["creator_id"], :name => "fk_registration_creator_id"

  create_table "crs2_transaction", :force => true do |t|
    t.string   "type",                     :limit => 31,                                :default => "", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version",                                                                               :null => false
    t.text     "comment"
    t.datetime "effective_date"
    t.decimal  "debit",                                  :precision => 12, :scale => 2
    t.boolean  "married"
    t.binary   "transaction_cancellation"
    t.boolean  "commuter"
    t.decimal  "credit",                                 :precision => 12, :scale => 2
    t.string   "abbreviated_card_number"
    t.string   "authorization_code"
    t.string   "business_unit"
    t.string   "department"
    t.string   "ministry"
    t.string   "operating_unit"
    t.string   "project"
    t.boolean  "override"
    t.string   "designation_no",           :limit => 7
    t.integer  "authorizer_id"
    t.integer  "verified_by_id"
    t.integer  "expense_selection_id"
    t.integer  "charge_cancellation_id"
    t.integer  "paid_by_id"
    t.integer  "indicated_verifier_id"
    t.integer  "payment_cancellation_id"
    t.integer  "registration_id"
    t.integer  "scholarship_charge_id"
    t.integer  "conference_id"
    t.integer  "registrant_id"
    t.integer  "user_id"
  end

  add_index "crs2_transaction", ["authorizer_id"], :name => "fk_transaction_authorizer_id"
  add_index "crs2_transaction", ["charge_cancellation_id"], :name => "fk_transaction_charge_cancellation_id"
  add_index "crs2_transaction", ["conference_id"], :name => "fk_transaction_conference_id"
  add_index "crs2_transaction", ["expense_selection_id"], :name => "fk_transaction_expense_selection_id"
  add_index "crs2_transaction", ["indicated_verifier_id"], :name => "fk_transaction_indicated_verifier_id"
  add_index "crs2_transaction", ["paid_by_id"], :name => "fk_transaction_paid_by_id"
  add_index "crs2_transaction", ["payment_cancellation_id"], :name => "fk_transaction_payment_cancellation_id"
  add_index "crs2_transaction", ["registrant_id"], :name => "fk_transaction_registrant_id"
  add_index "crs2_transaction", ["registration_id"], :name => "fk_transaction_registration_id"
  add_index "crs2_transaction", ["scholarship_charge_id"], :name => "fk_transaction_scholarship_charge_id"
  add_index "crs2_transaction", ["user_id"], :name => "fk_transaction_user_id"
  add_index "crs2_transaction", ["verified_by_id"], :name => "fk_transaction_verified_by_id"

  create_table "crs2_url_base", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version",                                 :null => false
    t.string   "authority",               :default => "", :null => false
    t.string   "scheme",     :limit => 5, :default => "", :null => false
  end

  create_table "crs2_user", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version",    :null => false
    t.datetime "last_login"
  end

  create_table "crs2_user_role", :force => true do |t|
    t.string   "type",          :limit => 31, :default => "", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version",                                     :null => false
    t.integer  "conference_id"
    t.integer  "user_id",                                     :null => false
  end

  add_index "crs2_user_role", ["conference_id"], :name => "fk_user_rule_conference_id"
  add_index "crs2_user_role", ["user_id"], :name => "fk_user_rule_user_id"

  create_table "crs_answer", :primary_key => "answerID", :force => true do |t|
    t.string  "body",              :limit => 7000
    t.integer "fk_QuestionID"
    t.integer "fk_RegistrationID"
  end

  add_index "crs_answer", ["fk_QuestionID", "fk_RegistrationID"], :name => "fk_QuestionID"
  add_index "crs_answer", ["fk_RegistrationID"], :name => "fk_RegistrationID"

  create_table "crs_childregistration", :primary_key => "childRegistrationID", :force => true do |t|
    t.string   "firstName",         :limit => 80
    t.string   "lastName",          :limit => 80
    t.string   "gender",            :limit => 1
    t.integer  "age"
    t.datetime "arriveDate"
    t.datetime "birthDate"
    t.datetime "leaveDate"
    t.string   "inChildCare",       :limit => 1
    t.integer  "fk_RegistrationID"
  end

  add_index "crs_childregistration", ["fk_RegistrationID"], :name => "fk_RegistrationID"

  create_table "crs_conference", :primary_key => "conferenceID", :force => true do |t|
    t.datetime "createDate"
    t.string   "attributesAsked",          :limit => 30
    t.string   "name",                     :limit => 64
    t.string   "theme",                    :limit => 128
    t.string   "password",                 :limit => 20
    t.string   "staffPassword",            :limit => 20
    t.string   "region",                   :limit => 3
    t.string   "briefDescription",         :limit => 8000
    t.string   "contactName",              :limit => 60
    t.string   "contactEmail",             :limit => 50
    t.string   "contactPhone",             :limit => 24
    t.string   "contactAddress1",          :limit => 35
    t.string   "contactAddress2",          :limit => 35
    t.string   "contactCity",              :limit => 30
    t.string   "contactState",             :limit => 6
    t.string   "contactZip",               :limit => 10
    t.string   "splashPageURL",            :limit => 128
    t.string   "confImageId",              :limit => 64
    t.string   "fontFace",                 :limit => 64
    t.string   "backgroundColor",          :limit => 6
    t.string   "foregroundColor",          :limit => 6
    t.string   "highlightColor",           :limit => 6
    t.string   "confirmationEmail",        :limit => 4000
    t.string   "acceptCreditCards",        :limit => 1
    t.string   "acceptEChecks",            :limit => 1
    t.string   "acceptScholarships",       :limit => 1
    t.string   "authnetPassword",          :limit => 200
    t.datetime "preRegStart"
    t.datetime "preRegEnd"
    t.datetime "defaultDateStaffArrive"
    t.datetime "defaultDateStaffLeave"
    t.datetime "defaultDateGuestArrive"
    t.datetime "defaultDateGuestLeave"
    t.datetime "defaultDateStudentArrive"
    t.datetime "defaultDateStudentLeave"
    t.datetime "masterDefaultDateArrive"
    t.datetime "masterDefaultDateLeave"
    t.string   "ministryType",             :limit => 2
    t.string   "isCloaked",                :limit => 1
    t.float    "onsiteCost"
    t.float    "commuterCost"
    t.float    "preRegDeposit"
    t.float    "discountFullPayment"
    t.float    "discountEarlyReg"
    t.datetime "discountEarlyRegDate"
    t.string   "checkPayableTo",           :limit => 40
    t.string   "merchantAcctNum",          :limit => 64
    t.string   "backgroundColor3",         :limit => 6
    t.string   "backgroundColor2",         :limit => 6
    t.string   "highlightColor2",          :limit => 6
    t.string   "requiredColor",            :limit => 6
    t.string   "acceptVisa",               :limit => 1
    t.string   "acceptMasterCard",         :limit => 1
    t.string   "acceptAmericanExpress",    :limit => 1
    t.string   "acceptDiscover",           :limit => 1
    t.integer  "staffProfileNumber"
    t.integer  "staffProfileReqNumber"
    t.integer  "guestProfileNumber"
    t.integer  "guestProfileReqNumber"
    t.integer  "studentProfileNumber"
    t.integer  "studentProfileReqNumber"
    t.string   "askStudentChildren",       :limit => 1
    t.string   "askStaffChildren",         :limit => 1
    t.string   "askGuestChildren",         :limit => 1
    t.string   "studentLabel",             :limit => 64
    t.string   "staffLabel",               :limit => 64
    t.string   "guestLabel",               :limit => 64
    t.string   "studentDesc"
    t.string   "staffDesc"
    t.string   "guestDesc"
    t.string   "askStudentSpouse",         :limit => 1
    t.string   "askStaffSpouse",           :limit => 1
    t.string   "askGuestSpouse",           :limit => 1
  end

  create_table "crs_customitem", :primary_key => "customItemID", :force => true do |t|
    t.string  "title",           :limit => 128
    t.string  "text",            :limit => 1000
    t.integer "displayOrder"
    t.integer "fk_ConferenceID"
  end

  add_index "crs_customitem", ["fk_ConferenceID"], :name => "fk_ConferenceID"

  create_table "crs_merchandise", :primary_key => "merchandiseID", :force => true do |t|
    t.string  "name",                  :limit => 128
    t.string  "note"
    t.float   "amount"
    t.string  "required",              :limit => 1
    t.string  "registrationType",      :limit => 50
    t.integer "displayOrder"
    t.integer "fk_ConferenceID"
    t.integer "fk_RegistrationTypeID"
  end

  add_index "crs_merchandise", ["fk_ConferenceID", "fk_RegistrationTypeID"], :name => "fk_ConferenceID"

  create_table "crs_merchandisechoice", :id => false, :force => true do |t|
    t.integer "fk_MerchandiseID",  :null => false
    t.integer "fk_RegistrationID", :null => false
  end

  create_table "crs_payment", :primary_key => "paymentID", :force => true do |t|
    t.datetime "paymentDate"
    t.float    "debit"
    t.float    "credit"
    t.string   "type",              :limit => 80
    t.string   "authCode",          :limit => 80
    t.string   "businessUnit",      :limit => 50
    t.string   "dept",              :limit => 50
    t.string   "operatingUnit",     :limit => 50
    t.string   "project",           :limit => 50
    t.string   "accountNo",         :limit => 80
    t.string   "comment"
    t.string   "posted",            :limit => 1
    t.datetime "postedDate"
    t.integer  "fk_RegistrationID"
  end

  add_index "crs_payment", ["fk_RegistrationID"], :name => "fk_RegistrationID"

  create_table "crs_question", :primary_key => "questionID", :force => true do |t|
    t.string  "registrationType",      :limit => 50
    t.string  "required",              :limit => 1
    t.integer "displayOrder"
    t.integer "fk_ConferenceID"
    t.integer "fk_QuestionTextID"
    t.integer "fk_RegistrationTypeID"
  end

  add_index "crs_question", ["fk_ConferenceID", "fk_RegistrationTypeID"], :name => "fk_ConferenceID"
  add_index "crs_question", ["fk_QuestionTextID"], :name => "fk_QuestionTextID"

  create_table "crs_questiontext", :primary_key => "questionTextID", :force => true do |t|
    t.string  "body",       :limit => 7000
    t.string  "answerType", :limit => 50
    t.string  "status",     :limit => 50
    t.integer "oldID"
  end

  create_table "crs_registration", :primary_key => "registrationID", :force => true do |t|
    t.datetime "registrationDate"
    t.string   "registrationType",      :limit => 80
    t.string   "preRegistered",         :limit => 1
    t.integer  "newPersonID"
    t.integer  "fk_ConferenceID"
    t.datetime "arriveDate"
    t.datetime "leaveDate"
    t.integer  "additionalRooms"
    t.integer  "spouseComing"
    t.integer  "spouseRegistrationID"
    t.string   "registeredFirst",       :limit => 1
    t.string   "isOnsite",              :limit => 1
    t.integer  "fk_RegistrationTypeID"
    t.integer  "fk_PersonID"
  end

  add_index "crs_registration", ["fk_ConferenceID"], :name => "fk_ConferenceID"
  add_index "crs_registration", ["fk_PersonID"], :name => "fk_PersonID"
  add_index "crs_registration", ["fk_RegistrationTypeID"], :name => "fk_RegistrationTypeID"

  create_table "crs_registrationtype", :primary_key => "registrationTypeID", :force => true do |t|
    t.string   "label",                       :limit => 64
    t.string   "description",                 :limit => 256
    t.datetime "defaultDateArrive"
    t.datetime "defaultDateLeave"
    t.datetime "preRegStart"
    t.datetime "preRegEnd"
    t.float    "singlePreRegDeposit"
    t.float    "singleOnsiteCost"
    t.float    "singleCommuteCost"
    t.float    "singleDiscountFullPayment"
    t.float    "singleDiscountEarlyReg"
    t.datetime "singleDiscountEarlyRegDate"
    t.float    "marriedPreRegDeposit"
    t.float    "marriedOnsiteCost"
    t.float    "marriedCommuteCost"
    t.float    "marriedDiscountFullPayment"
    t.float    "marriedDiscountEarlyReg"
    t.datetime "marriedDiscountEarlyRegDate"
    t.string   "acceptEChecks",               :limit => 1
    t.string   "acceptScholarships",          :limit => 1
    t.string   "acceptStaffAcctTransfer",     :limit => 1
    t.string   "acceptMinistryAcctTransfer",  :limit => 1
    t.string   "acceptCreditCards",           :limit => 1
    t.string   "askChildren",                 :limit => 1
    t.string   "askSpouse",                   :limit => 1
    t.string   "askChildCare",                :limit => 1
    t.string   "askAdditionalRooms",          :limit => 1
    t.string   "allowCommute",                :limit => 1
    t.integer  "displayOrder",                :limit => 2
    t.integer  "profileNumber"
    t.integer  "profileReqNumber"
    t.string   "registrationType",            :limit => 10
    t.integer  "fk_ConferenceID"
    t.string   "acceptChecks",                :limit => 1
  end

  add_index "crs_registrationtype", ["fk_ConferenceID"], :name => "fk_ConferenceID"

  create_table "crs_report", :primary_key => "reportID", :force => true do |t|
    t.string  "query",       :limit => 1000
    t.string  "xsl"
    t.string  "name"
    t.integer "reportGroup"
    t.string  "sorts",       :limit => 1000
    t.string  "sortNames",   :limit => 1000
  end

  create_table "crs_viewmerchandisechoice", :id => false, :force => true do |t|
    t.integer  "registrationID",                       :default => 0, :null => false
    t.datetime "registrationDate"
    t.string   "preRegistered",         :limit => 1
    t.integer  "fk_PersonID"
    t.integer  "displayOrder"
    t.string   "registrationType",      :limit => 50
    t.string   "required",              :limit => 1
    t.float    "amount"
    t.string   "note"
    t.string   "name",                  :limit => 128
    t.integer  "merchandiseID",                        :default => 0, :null => false
    t.integer  "fk_ConferenceID"
    t.integer  "fk_RegistrationTypeID"
  end

  create_table "crs_viewquestion", :id => false, :force => true do |t|
    t.string  "registrationType",      :limit => 50
    t.string  "required",              :limit => 1
    t.integer "displayOrder"
    t.integer "fk_ConferenceID"
    t.string  "body",                  :limit => 7000
    t.string  "answerType",            :limit => 50
    t.string  "status",                :limit => 50
    t.integer "questionID",                            :default => 0, :null => false
    t.integer "fk_QuestionTextID"
    t.integer "questionTextID",                        :default => 0, :null => false
    t.integer "fk_RegistrationTypeID"
  end

  create_table "crs_viewregistration", :id => false, :force => true do |t|
    t.string   "preRegistered",         :limit => 1
    t.datetime "registrationDate"
    t.integer  "registrationID",                       :default => 0, :null => false
    t.integer  "fk_ConferenceID"
    t.datetime "createdDate"
    t.string   "firstName",             :limit => 50
    t.string   "lastName",              :limit => 50
    t.string   "middleInitial",         :limit => 50
    t.datetime "birth_date"
    t.string   "campus",                :limit => 128
    t.string   "yearInSchool",          :limit => 20
    t.datetime "graduation_date"
    t.string   "greekAffiliation",      :limit => 50
    t.integer  "personID",                             :default => 0
    t.string   "gender",                :limit => 1
    t.string   "address1",              :limit => 55
    t.string   "address2",              :limit => 55
    t.string   "city",                  :limit => 50
    t.string   "state",                 :limit => 50
    t.string   "zip",                   :limit => 15
    t.string   "homePhone",             :limit => 25
    t.string   "country",               :limit => 64
    t.string   "email",                 :limit => 200
    t.string   "permanentAddress1",     :limit => 55
    t.string   "permanentAddress2",     :limit => 55
    t.string   "permanentCity",         :limit => 50
    t.string   "permanentState",        :limit => 50
    t.string   "permanentZip",          :limit => 15
    t.string   "permanentPhone",        :limit => 25
    t.string   "permanentCountry",      :limit => 64
    t.string   "maritalStatus",         :limit => 20
    t.string   "numberOfKids",          :limit => 2
    t.integer  "fk_PersonID"
    t.string   "accountNo",             :limit => 11
    t.integer  "additionalRooms"
    t.datetime "leaveDate"
    t.datetime "arriveDate"
    t.integer  "spouseID"
    t.integer  "spouseComing"
    t.integer  "spouseRegistrationID"
    t.string   "registeredFirst",       :limit => 1
    t.string   "isOnsite",              :limit => 1
    t.integer  "fk_RegistrationTypeID"
    t.string   "registrationType",      :limit => 64
    t.integer  "newPersonID"
  end

  create_table "crs_viewregistrationlocallevel", :id => false, :force => true do |t|
    t.integer  "registrationID",                       :default => 0, :null => false
    t.datetime "registrationDate"
    t.string   "registrationType",      :limit => 80
    t.string   "preRegistered",         :limit => 1
    t.integer  "fk_PersonID"
    t.integer  "fk_ConferenceID"
    t.string   "lastName",              :limit => 50
    t.integer  "personID",                             :default => 0, :null => false
    t.datetime "createdDate"
    t.string   "firstName",             :limit => 50
    t.string   "middleInitial",         :limit => 50
    t.datetime "birth_date"
    t.string   "campus",                :limit => 128
    t.string   "yearInSchool",          :limit => 20
    t.datetime "graduation_date"
    t.string   "greekAffiliation",      :limit => 50
    t.string   "gender",                :limit => 1
    t.string   "address1",              :limit => 55
    t.string   "address2",              :limit => 55
    t.string   "city",                  :limit => 50
    t.string   "state",                 :limit => 50
    t.string   "zip",                   :limit => 15
    t.string   "homePhone",             :limit => 25
    t.string   "country",               :limit => 64
    t.string   "email",                 :limit => 200
    t.string   "permanentAddress1",     :limit => 55
    t.string   "permanentAddress2",     :limit => 55
    t.string   "permanentCity",         :limit => 50
    t.string   "permanentState",        :limit => 50
    t.string   "permanentZip",          :limit => 15
    t.string   "permanentPhone",        :limit => 25
    t.string   "permanentCountry",      :limit => 64
    t.string   "maritalStatus",         :limit => 20
    t.string   "numberOfKids",          :limit => 2
    t.integer  "localLevelId",                         :default => 0, :null => false
    t.string   "region",                :limit => 2
    t.string   "llstate",               :limit => 6
    t.string   "accountNo",             :limit => 11
    t.integer  "additionalRooms"
    t.datetime "leaveDate"
    t.datetime "arriveDate"
    t.integer  "fk_RegistrationTypeID"
    t.integer  "spouseComing"
    t.integer  "spouseRegistrationID"
    t.string   "registeredFirst",       :limit => 1
    t.string   "isOnsite",              :limit => 1
    t.integer  "spouseID"
    t.integer  "newPersonID"
  end

  create_table "crs_viewregistrationtargetarea", :id => false, :force => true do |t|
    t.integer  "registrationID",                       :default => 0, :null => false
    t.datetime "registrationDate"
    t.string   "registrationType",      :limit => 80
    t.string   "preRegistered",         :limit => 1
    t.integer  "fk_PersonID"
    t.integer  "fk_ConferenceID"
    t.string   "lastName",              :limit => 50
    t.integer  "personID",                             :default => 0, :null => false
    t.datetime "createdDate"
    t.string   "firstName",             :limit => 50
    t.string   "middleInitial",         :limit => 50
    t.datetime "birth_date"
    t.string   "campus",                :limit => 128
    t.string   "yearInSchool",          :limit => 20
    t.datetime "graduation_date"
    t.string   "greekAffiliation",      :limit => 50
    t.string   "gender",                :limit => 1
    t.string   "address1",              :limit => 55
    t.string   "address2",              :limit => 55
    t.string   "city",                  :limit => 50
    t.string   "state",                 :limit => 50
    t.string   "zip",                   :limit => 15
    t.string   "homePhone",             :limit => 25
    t.string   "country",               :limit => 64
    t.string   "email",                 :limit => 200
    t.string   "permanentAddress1",     :limit => 55
    t.string   "permanentAddress2",     :limit => 55
    t.string   "permanentCity",         :limit => 50
    t.string   "permanentState",        :limit => 50
    t.string   "permanentZip",          :limit => 15
    t.string   "permanentPhone",        :limit => 25
    t.string   "permanentCountry",      :limit => 64
    t.string   "maritalStatus",         :limit => 20
    t.string   "numberOfKids",          :limit => 2
    t.string   "campusName",            :limit => 100
    t.string   "tastate",               :limit => 32
    t.integer  "additionalRooms"
    t.datetime "leaveDate"
    t.datetime "arriveDate"
    t.string   "accountNo",             :limit => 11
    t.integer  "fk_RegistrationTypeID"
    t.integer  "spouseComing"
    t.integer  "spouseRegistrationID"
    t.string   "registeredFirst",       :limit => 1
    t.string   "isOnsite",              :limit => 1
    t.integer  "spouseID"
    t.integer  "newPersonID"
  end

  create_table "engine_schema_info", :id => false, :force => true do |t|
    t.string  "engine_name"
    t.integer "version"
  end

  create_table "fsk_allocations", :force => true do |t|
    t.integer  "ssm_id"
    t.integer  "region_id"
    t.integer  "impact_allotment"
    t.integer  "forerunner_allotment"
    t.integer  "regional_allotment"
    t.integer  "regionally_raised"
    t.integer  "locally_raised"
    t.string   "allocation_year",      :limit => 10
    t.text     "national_notes",       :limit => 2147483647
    t.text     "impact_notes",         :limit => 2147483647
    t.text     "forerunner_notes",     :limit => 2147483647
    t.text     "regional_notes",       :limit => 2147483647
    t.text     "local_notes",          :limit => 2147483647
    t.integer  "lock_version",                               :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "agree_to_report"
  end

  add_index "fsk_allocations", ["ssm_id"], :name => "FK_fsk_allocations_simplesecuritymanager_user"

  create_table "fsk_fields", :force => true do |t|
    t.string "name", :limit => 50
  end

  create_table "fsk_fields_roles", :id => false, :force => true do |t|
    t.integer "role_id",  :null => false
    t.integer "field_id", :null => false
  end

  add_index "fsk_fields_roles", ["field_id"], :name => "FK_fsk_fields_roles"

  create_table "fsk_kit_categories", :force => true do |t|
    t.string   "name",         :limit => 50,                  :null => false
    t.string   "description",  :limit => 2000
    t.integer  "lock_version",                 :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fsk_line_items", :force => true do |t|
    t.integer  "product_id",   :default => 0, :null => false
    t.integer  "order_id",     :default => 0, :null => false
    t.integer  "quantity",     :default => 0, :null => false
    t.integer  "lock_version", :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fsk_line_items", ["order_id"], :name => "FK_fsk_line_items_fsk_orders"
  add_index "fsk_line_items", ["product_id"], :name => "FK_fsk_line_items_fsk_products"

  create_table "fsk_orders", :force => true do |t|
    t.string   "location_name",      :limit => 128
    t.datetime "updated_at"
    t.integer  "allocation_id"
    t.string   "contact_first_name", :limit => 30
    t.string   "contact_last_name",  :limit => 30
    t.string   "contact_phone",      :limit => 24
    t.string   "contact_cell",       :limit => 24
    t.string   "contact_email",      :limit => 50
    t.string   "ship_first_name",    :limit => 30
    t.string   "ship_address1",      :limit => 50
    t.string   "ship_address2",      :limit => 50
    t.string   "ship_city",          :limit => 30
    t.string   "ship_state",         :limit => 6
    t.string   "ship_zip",           :limit => 10
    t.string   "ship_phone",         :limit => 24
    t.integer  "total_kits"
    t.string   "business_unit",      :limit => 20
    t.string   "operating_unit",     :limit => 20
    t.string   "dept_id",            :limit => 20
    t.string   "project_id",         :limit => 10
    t.string   "type",               :limit => 20
    t.string   "order_year",         :limit => 10
    t.integer  "ssm_id"
    t.integer  "lock_version",                             :default => 0,     :null => false
    t.datetime "created_at"
    t.string   "ship_last_name"
    t.boolean  "freeze_order",                             :default => false
    t.text     "target_audience",    :limit => 2147483647
    t.text     "how_used",           :limit => 2147483647
  end

  add_index "fsk_orders", ["ssm_id"], :name => "FK_fsk_orders_simplesecuritymanager_user"

  create_table "fsk_products", :force => true do |t|
    t.string   "name",            :limit => 100,        :default => "",     :null => false
    t.text     "description",     :limit => 2147483647
    t.string   "image_filename",  :limit => 1000
    t.float    "price"
    t.integer  "quantity",                              :default => 0,      :null => false
    t.integer  "lock_version",                          :default => 0,      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "kit_category_id"
    t.string   "availability",    :limit => 20,         :default => "both", :null => false
    t.integer  "box_quantity",                          :default => 100
  end

  add_index "fsk_products", ["kit_category_id"], :name => "FK_fsk_products_fsk_kit_categories"

  create_table "fsk_roles", :force => true do |t|
    t.string "name", :limit => 50
  end

  create_table "fsk_users", :force => true do |t|
    t.integer "role_id", :default => 0, :null => false
    t.integer "ssm_id",  :default => 0, :null => false
  end

  add_index "fsk_users", ["role_id"], :name => "FK_fsk_users_fsk_roles"
  add_index "fsk_users", ["ssm_id"], :name => "FK_fsk_users_simplesecuritymanager_user"

  create_table "hr_ms_payment", :primary_key => "paymentID", :force => true do |t|
    t.datetime "paymentDate"
    t.float    "debit"
    t.float    "credit"
    t.string   "type",                :limit => 80
    t.string   "authCode",            :limit => 80
    t.string   "businessUnit",        :limit => 50
    t.string   "dept",                :limit => 50
    t.string   "region",              :limit => 50
    t.string   "project",             :limit => 50
    t.string   "accountNo",           :limit => 80
    t.string   "comment"
    t.boolean  "posted"
    t.datetime "postedDate"
    t.integer  "fk_WsnApplicationID"
    t.string   "paymentFor",          :limit => 50
  end

  add_index "hr_ms_payment", ["fk_WsnApplicationID"], :name => "fk_WsnApplicationID"

  create_table "hr_review360_review360", :primary_key => "Review360ID", :force => true do |t|
    t.string   "reviewedByID",        :limit => 64
    t.datetime "dateStarted"
    t.datetime "dateCompleted"
    t.datetime "dateDue"
    t.string   "currentPosition",     :limit => 128
    t.string   "leadershipLevel",     :limit => 128
    t.string   "relationship",        :limit => 128
    t.text     "q1",                  :limit => 16777215
    t.integer  "q2"
    t.text     "q3",                  :limit => 16777215
    t.text     "q4",                  :limit => 16777215
    t.text     "q5",                  :limit => 16777215
    t.text     "q6",                  :limit => 16777215
    t.text     "q7",                  :limit => 16777215
    t.integer  "q8"
    t.text     "q9",                  :limit => 16777215
    t.integer  "q10"
    t.text     "q11",                 :limit => 16777215
    t.integer  "q12"
    t.text     "q13",                 :limit => 16777215
    t.integer  "q14"
    t.text     "q15",                 :limit => 16777215
    t.integer  "q16"
    t.text     "q17",                 :limit => 16777215
    t.integer  "q18"
    t.text     "q19",                 :limit => 16777215
    t.integer  "q20"
    t.text     "q21",                 :limit => 16777215
    t.integer  "q22"
    t.text     "q23",                 :limit => 16777215
    t.integer  "q24"
    t.text     "q25",                 :limit => 16777215
    t.text     "q26",                 :limit => 16777215
    t.text     "q27",                 :limit => 16777215
    t.text     "q28f1",               :limit => 16777215
    t.integer  "q28f2"
    t.text     "q28l1",               :limit => 16777215
    t.integer  "q28l2"
    t.text     "q28o1",               :limit => 16777215
    t.integer  "q28o2"
    t.text     "q28a1",               :limit => 16777215
    t.integer  "q28a2"
    t.text     "q28t1",               :limit => 16777215
    t.integer  "q28t2"
    t.text     "q28s1",               :limit => 16777215
    t.integer  "q28s2"
    t.text     "q29",                 :limit => 16777215
    t.text     "q30",                 :limit => 16777215
    t.text     "q31",                 :limit => 16777215
    t.text     "q32",                 :limit => 16777215
    t.text     "q33",                 :limit => 16777215
    t.text     "q34",                 :limit => 16777215
    t.integer  "fk_ReviewSessionID"
    t.string   "reviewedByTitle",     :limit => 5
    t.string   "reviewedByFirstName", :limit => 30
    t.string   "reviewedByLastName",  :limit => 30
    t.string   "reviewedByEmail",     :limit => 50
  end

  add_index "hr_review360_review360", ["fk_ReviewSessionID"], :name => "index1"

  create_table "hr_review360_review360light", :primary_key => "Review360LightID", :force => true do |t|
    t.string   "reviewedByID",            :limit => 64
    t.string   "reviewedByTitle",         :limit => 5
    t.string   "reviewedByFirstName",     :limit => 30
    t.string   "reviewedByLastName",      :limit => 30
    t.string   "reviewedByEmail",         :limit => 50
    t.datetime "dateStarted"
    t.datetime "dateCompleted"
    t.datetime "dateDue"
    t.string   "currentPosition",         :limit => 128
    t.string   "leadershipLevel",         :limit => 128
    t.string   "relationship",            :limit => 128
    t.text     "q1",                      :limit => 16777215
    t.text     "q2",                      :limit => 16777215
    t.text     "q3",                      :limit => 16777215
    t.text     "q4",                      :limit => 16777215
    t.text     "q5",                      :limit => 16777215
    t.text     "q6",                      :limit => 16777215
    t.text     "q7",                      :limit => 16777215
    t.text     "q8",                      :limit => 16777215
    t.text     "q9",                      :limit => 16777215
    t.integer  "fk_ReviewSessionLightID"
  end

  add_index "hr_review360_review360light", ["fk_ReviewSessionLightID"], :name => "index1"

  create_table "hr_review360_reviewsession", :primary_key => "ReviewSessionID", :force => true do |t|
    t.string   "name",            :limit => 80
    t.string   "purpose"
    t.datetime "dateDue"
    t.datetime "dateStarted"
    t.string   "revieweeID",      :limit => 128
    t.string   "administratorID", :limit => 128
    t.string   "requestedByID",   :limit => 128
  end

  create_table "hr_review360_reviewsessionlight", :primary_key => "ReviewSessionLightID", :force => true do |t|
    t.string   "name",            :limit => 80
    t.string   "purpose"
    t.datetime "dateDue"
    t.datetime "dateStarted"
    t.string   "revieweeID",      :limit => 128
    t.string   "administratorID", :limit => 128
    t.string   "requestedByID",   :limit => 128
  end

  create_table "hr_si_application_2003_deprecated", :id => false, :force => true do |t|
    t.integer  "applicationID",                                                                              :null => false
    t.integer  "locationA"
    t.string   "locationAExplanation",                    :limit => 90
    t.integer  "locationB"
    t.string   "locationBExplanation",                    :limit => 90
    t.integer  "locationC"
    t.string   "locationCExplanation",                    :limit => 90
    t.string   "availableMonth",                          :limit => 2
    t.string   "availableYear",                           :limit => 4
    t.integer  "hasMinistryConflict"
    t.text     "ministryConflictExplanation",             :limit => 16777215
    t.integer  "hasSpecificLocation"
    t.string   "specificLocationRecruiterName",           :limit => 50
    t.text     "teamMembers",                             :limit => 16777215
    t.integer  "isDating"
    t.text     "datingLocation",                          :limit => 16777215
    t.integer  "hasCampusPartnership"
    t.integer  "isDatingStint"
    t.text     "datingStintName",                         :limit => 16777215
    t.string   "language1",                               :limit => 50
    t.string   "language1YearsStudied",                   :limit => 20
    t.integer  "language1Fluency"
    t.string   "language2",                               :limit => 50
    t.string   "language2YearsStudied",                   :limit => 20
    t.integer  "language2Fluency"
    t.text     "previousMinistryExperience",              :limit => 16777215
    t.text     "ministryTraining",                        :limit => 16777215
    t.text     "evangelismAttitude",                      :limit => 16777215
    t.integer  "isEvangelismTrainable"
    t.text     "participationExplanation",                :limit => 16777215
    t.integer  "isFamiliarFourSpiritualLaws"
    t.integer  "hasExperienceFourSpiritualLaws"
    t.integer  "confidenceFourSpiritualLaws"
    t.integer  "isFamiliarLifeAtLarge"
    t.integer  "hasExperienceLifeAtLarge"
    t.integer  "confidenceLifeAtLarge"
    t.integer  "isFamiliarPersonalTestimony"
    t.integer  "hasExperiencePersonalTestimony"
    t.integer  "confidencePersonalTestimony"
    t.integer  "isFamiliarExplainingGospel"
    t.integer  "hasExperienceExplainingGospel"
    t.integer  "confidenceExplainingGospel"
    t.integer  "isFamiliarSharingFaith"
    t.integer  "hasExperienceSharingFaith"
    t.integer  "confidenceSharingFaith"
    t.integer  "isFamiliarHolySpiritBooklet"
    t.integer  "hasExperienceHolySpiritBooklet"
    t.integer  "confidenceHolySpiritBooklet"
    t.integer  "isFamiliarFollowUp"
    t.integer  "hasExperienceFollowUp"
    t.integer  "confidenceFollowUp"
    t.integer  "isFamiliarHelpGrowInFaith"
    t.integer  "hasExperienceHelpGrowInFaith"
    t.integer  "confidenceHelpGrowInFaith"
    t.integer  "isFamiliarTrainShareFaith"
    t.integer  "hasExperienceTrainShareFaith"
    t.integer  "confidenceTrainShareFaith"
    t.integer  "isFamiliarOtherReligions"
    t.integer  "hasExperienceOtherReligions"
    t.integer  "confidenceOtherReligions"
    t.text     "leadershipPositions",                     :limit => 16777215
    t.integer  "hasLedDiscipleshipGroup"
    t.string   "discipleshipGroupSize",                   :limit => 50
    t.text     "leadershipEvaluation",                    :limit => 16777215
    t.integer  "conversionMonth"
    t.integer  "conversionYear"
    t.string   "memberChurchDenomination",                :limit => 50
    t.string   "memberChurchDuration",                    :limit => 50
    t.string   "attendingChurchDenomination",             :limit => 50
    t.string   "attendingChurchDuration",                 :limit => 50
    t.text     "attendingChurchInvolvement",              :limit => 16777215
    t.text     "quietTimeQuantity",                       :limit => 16777215
    t.text     "quietTimeDescription",                    :limit => 16777215
    t.text     "explanationOfSalvation",                  :limit => 16777215
    t.text     "explanationOfSpiritFilled",               :limit => 16777215
    t.integer  "hasInvolvementSpeakingTongues"
    t.text     "differenceIndwellingFilled",              :limit => 16777215
    t.integer  "hasCrimeConviction"
    t.text     "crimeConvictionExplanation",              :limit => 16777215
    t.integer  "hasDrugUse"
    t.integer  "isTobaccoUser"
    t.integer  "isWillingChangeHabits"
    t.text     "authorityResponseExplanation",            :limit => 16777215
    t.text     "alcoholUseFrequency",                     :limit => 16777215
    t.text     "alcoholUseDecision",                      :limit => 16777215
    t.integer  "isWillingRefrainAlcohol"
    t.text     "unwillingRefrainAlcoholExplanation",      :limit => 16777215
    t.text     "drugUseExplanation",                      :limit => 16777215
    t.text     "tobaccoUseExplanation",                   :limit => 16777215
    t.integer  "isWillingAbstainTobacco"
    t.integer  "hasRequestedPhoneCall"
    t.string   "contactPhoneNumber",                      :limit => 50
    t.string   "contactBestTime",                         :limit => 50
    t.string   "contactTimeZone",                         :limit => 50
    t.text     "sexualInvolvementExplanation",            :limit => 16777215
    t.integer  "hasSexualGuidelines"
    t.text     "sexualGuidelineExplanation",              :limit => 16777215
    t.integer  "isCurrentlyDating"
    t.text     "currentlyDatingLocation",                 :limit => 16777215
    t.integer  "hasHomosexualInvolvement"
    t.text     "homosexualInvolvementExplanation",        :limit => 16777215
    t.integer  "hasRecentPornographicInvolvement"
    t.integer  "pornographicInvolvementMonth"
    t.integer  "pornographicInvolvementYear"
    t.text     "pornographicInvolvementExplanation",      :limit => 16777215
    t.integer  "hasRecentSexualImmorality"
    t.integer  "sexualImmoralityMonth"
    t.integer  "sexualImmoralityYear"
    t.text     "sexualImmoralityExplanation",             :limit => 16777215
    t.integer  "hasOtherDateSinceImmorality"
    t.text     "singleImmoralityResultsExplanation",      :limit => 16777215
    t.text     "marriedImmoralityResultsExplanation",     :limit => 16777215
    t.text     "immoralityLifeChangeExplanation",         :limit => 16777215
    t.text     "immoralityCurrentStrugglesExplanation",   :limit => 16777215
    t.text     "additionalMoralComments",                 :limit => 16777215
    t.integer  "isAwareMustRaiseSupport"
    t.integer  "isInDebt"
    t.string   "debtNature1",                             :limit => 50
    t.string   "debtTotal1",                              :limit => 50
    t.string   "debtMonthlyPayment1",                     :limit => 50
    t.string   "debtNature2",                             :limit => 50
    t.string   "debtTotal2",                              :limit => 50
    t.string   "debtMonthlyPayment2",                     :limit => 50
    t.string   "debtNature3",                             :limit => 50
    t.string   "debtTotal3",                              :limit => 50
    t.string   "debtMonthlyPayment3",                     :limit => 50
    t.integer  "hasOtherFinancialResponsibility"
    t.text     "otherFinancialResponsibilityExplanation", :limit => 16777215
    t.text     "debtPaymentPlan",                         :limit => 16777215
    t.text     "debtPaymentTimeframe",                    :limit => 16777215
    t.text     "developingPartnersExplanation",           :limit => 16777215
    t.integer  "isWillingDevelopPartners"
    t.text     "unwillingDevelopPartnersExplanation",     :limit => 16777215
    t.integer  "isCommittedDevelopPartners"
    t.text     "uncommittedDevelopPartnersExplanation",   :limit => 16777215
    t.text     "personalTestimonyGrowth",                 :limit => 16777215
    t.text     "internshipParticipationExplanation",      :limit => 16777215
    t.text     "internshipObjectives",                    :limit => 16777215
    t.text     "currentMinistryDescription",              :limit => 16777215
    t.text     "personalStrengthA",                       :limit => 16777215
    t.text     "personalStrengthB",                       :limit => 16777215
    t.text     "personalStrengthC",                       :limit => 16777215
    t.text     "personalDevelopmentA",                    :limit => 16777215
    t.text     "personalDevelopmentB",                    :limit => 16777215
    t.text     "personalDevelopmentC",                    :limit => 16777215
    t.text     "personalDescriptionA",                    :limit => 16777215
    t.text     "personalDescriptionB",                    :limit => 16777215
    t.text     "personalDescriptionC",                    :limit => 16777215
    t.text     "familyRelationshipDescription",           :limit => 16777215
    t.string   "electronicSignature",                     :limit => 90
    t.string   "ssn",                                     :limit => 50
    t.integer  "fk_ssmUserID"
    t.integer  "fk_PersonID",                                                                                :null => false
    t.boolean  "isPaid"
    t.decimal  "appFee",                                                      :precision => 18, :scale => 0
    t.datetime "dateAppLastChanged"
    t.datetime "dateAppStarted"
    t.datetime "dateSubmitted"
    t.boolean  "isSubmitted"
    t.string   "appStatus",                               :limit => 15
    t.integer  "assignedToProject"
    t.integer  "finalProject"
    t.string   "siYear",                                  :limit => 50
    t.datetime "submitDate"
    t.string   "status",                                  :limit => 22
    t.string   "appType",                                 :limit => 64
  end

  add_index "hr_si_application_2003_deprecated", ["fk_ssmUserID"], :name => "fk_ssmUserID"

  create_table "hr_si_application_2004_deprecated", :primary_key => "applicationID", :force => true do |t|
    t.integer  "locationA"
    t.string   "locationAExplanation",                    :limit => 90
    t.integer  "locationB"
    t.string   "locationBExplanation",                    :limit => 90
    t.integer  "locationC"
    t.string   "locationCExplanation",                    :limit => 90
    t.string   "availableMonth",                          :limit => 2
    t.string   "availableYear",                           :limit => 4
    t.integer  "hasMinistryConflict"
    t.text     "ministryConflictExplanation",             :limit => 16777215
    t.integer  "hasSpecificLocation"
    t.string   "specificLocationRecruiterName",           :limit => 50
    t.text     "teamMembers",                             :limit => 16777215
    t.integer  "isDating"
    t.text     "datingLocation",                          :limit => 16777215
    t.integer  "hasCampusPartnership"
    t.integer  "isDatingStint"
    t.text     "datingStintName",                         :limit => 16777215
    t.string   "language1",                               :limit => 50
    t.string   "language1YearsStudied",                   :limit => 20
    t.integer  "language1Fluency"
    t.string   "language2",                               :limit => 50
    t.string   "language2YearsStudied",                   :limit => 20
    t.integer  "language2Fluency"
    t.text     "previousMinistryExperience",              :limit => 16777215
    t.text     "ministryTraining",                        :limit => 16777215
    t.text     "evangelismAttitude",                      :limit => 16777215
    t.integer  "isEvangelismTrainable"
    t.text     "participationExplanation",                :limit => 16777215
    t.integer  "isFamiliarFourSpiritualLaws"
    t.integer  "hasExperienceFourSpiritualLaws"
    t.integer  "confidenceFourSpiritualLaws"
    t.integer  "isFamiliarLifeAtLarge"
    t.integer  "hasExperienceLifeAtLarge"
    t.integer  "confidenceLifeAtLarge"
    t.integer  "isFamiliarPersonalTestimony"
    t.integer  "hasExperiencePersonalTestimony"
    t.integer  "confidencePersonalTestimony"
    t.integer  "isFamiliarExplainingGospel"
    t.integer  "hasExperienceExplainingGospel"
    t.integer  "confidenceExplainingGospel"
    t.integer  "isFamiliarSharingFaith"
    t.integer  "hasExperienceSharingFaith"
    t.integer  "confidenceSharingFaith"
    t.integer  "isFamiliarHolySpiritBooklet"
    t.integer  "hasExperienceHolySpiritBooklet"
    t.integer  "confidenceHolySpiritBooklet"
    t.integer  "isFamiliarFollowUp"
    t.integer  "hasExperienceFollowUp"
    t.integer  "confidenceFollowUp"
    t.integer  "isFamiliarHelpGrowInFaith"
    t.integer  "hasExperienceHelpGrowInFaith"
    t.integer  "confidenceHelpGrowInFaith"
    t.integer  "isFamiliarTrainShareFaith"
    t.integer  "hasExperienceTrainShareFaith"
    t.integer  "confidenceTrainShareFaith"
    t.integer  "isFamiliarOtherReligions"
    t.integer  "hasExperienceOtherReligions"
    t.integer  "confidenceOtherReligions"
    t.text     "leadershipPositions",                     :limit => 16777215
    t.integer  "hasLedDiscipleshipGroup"
    t.string   "discipleshipGroupSize",                   :limit => 50
    t.text     "leadershipEvaluation",                    :limit => 16777215
    t.integer  "conversionMonth"
    t.integer  "conversionYear"
    t.string   "memberChurchDenomination",                :limit => 50
    t.string   "memberChurchDuration",                    :limit => 50
    t.string   "attendingChurchDenomination",             :limit => 50
    t.string   "attendingChurchDuration",                 :limit => 50
    t.text     "attendingChurchInvolvement",              :limit => 16777215
    t.text     "quietTimeQuantity",                       :limit => 16777215
    t.text     "quietTimeDescription",                    :limit => 16777215
    t.text     "explanationOfSalvation",                  :limit => 16777215
    t.text     "explanationOfSpiritFilled",               :limit => 16777215
    t.integer  "hasInvolvementSpeakingTongues"
    t.text     "differenceIndwellingFilled",              :limit => 16777215
    t.integer  "hasCrimeConviction"
    t.text     "crimeConvictionExplanation",              :limit => 16777215
    t.integer  "hasDrugUse"
    t.integer  "isTobaccoUser"
    t.integer  "isWillingChangeHabits"
    t.text     "authorityResponseExplanation",            :limit => 16777215
    t.text     "alcoholUseFrequency",                     :limit => 16777215
    t.text     "alcoholUseDecision",                      :limit => 16777215
    t.integer  "isWillingRefrainAlcohol"
    t.text     "unwillingRefrainAlcoholExplanation",      :limit => 16777215
    t.text     "drugUseExplanation",                      :limit => 16777215
    t.text     "tobaccoUseExplanation",                   :limit => 16777215
    t.integer  "isWillingAbstainTobacco"
    t.integer  "hasRequestedPhoneCall"
    t.string   "contactPhoneNumber",                      :limit => 50
    t.string   "contactBestTime",                         :limit => 50
    t.string   "contactTimeZone",                         :limit => 50
    t.text     "sexualInvolvementExplanation",            :limit => 16777215
    t.integer  "hasSexualGuidelines"
    t.text     "sexualGuidelineExplanation",              :limit => 16777215
    t.integer  "isCurrentlyDating"
    t.text     "currentlyDatingLocation",                 :limit => 16777215
    t.integer  "hasHomosexualInvolvement"
    t.text     "homosexualInvolvementExplanation",        :limit => 16777215
    t.integer  "hasRecentPornographicInvolvement"
    t.integer  "pornographicInvolvementMonth"
    t.integer  "pornographicInvolvementYear"
    t.text     "pornographicInvolvementExplanation",      :limit => 16777215
    t.integer  "hasRecentSexualImmorality"
    t.integer  "sexualImmoralityMonth"
    t.integer  "sexualImmoralityYear"
    t.text     "sexualImmoralityExplanation",             :limit => 16777215
    t.integer  "hasOtherDateSinceImmorality"
    t.text     "singleImmoralityResultsExplanation",      :limit => 16777215
    t.text     "marriedImmoralityResultsExplanation",     :limit => 16777215
    t.text     "immoralityLifeChangeExplanation",         :limit => 16777215
    t.text     "immoralityCurrentStrugglesExplanation",   :limit => 16777215
    t.text     "additionalMoralComments",                 :limit => 16777215
    t.integer  "isAwareMustRaiseSupport"
    t.integer  "isInDebt"
    t.string   "debtNature1",                             :limit => 50
    t.string   "debtTotal1",                              :limit => 50
    t.string   "debtMonthlyPayment1",                     :limit => 50
    t.string   "debtNature2",                             :limit => 50
    t.string   "debtTotal2",                              :limit => 50
    t.string   "debtMonthlyPayment2",                     :limit => 50
    t.string   "debtNature3",                             :limit => 50
    t.string   "debtTotal3",                              :limit => 50
    t.string   "debtMonthlyPayment3",                     :limit => 50
    t.integer  "hasOtherFinancialResponsibility"
    t.text     "otherFinancialResponsibilityExplanation", :limit => 16777215
    t.text     "debtPaymentPlan",                         :limit => 16777215
    t.text     "debtPaymentTimeframe",                    :limit => 16777215
    t.text     "developingPartnersExplanation",           :limit => 16777215
    t.integer  "isWillingDevelopPartners"
    t.text     "unwillingDevelopPartnersExplanation",     :limit => 16777215
    t.integer  "isCommittedDevelopPartners"
    t.text     "uncommittedDevelopPartnersExplanation",   :limit => 16777215
    t.text     "personalTestimonyGrowth",                 :limit => 16777215
    t.text     "internshipParticipationExplanation",      :limit => 16777215
    t.text     "internshipObjectives",                    :limit => 16777215
    t.text     "currentMinistryDescription",              :limit => 16777215
    t.text     "personalStrengthA",                       :limit => 16777215
    t.text     "personalStrengthB",                       :limit => 16777215
    t.text     "personalStrengthC",                       :limit => 16777215
    t.text     "personalDevelopmentA",                    :limit => 16777215
    t.text     "personalDevelopmentB",                    :limit => 16777215
    t.text     "personalDevelopmentC",                    :limit => 16777215
    t.text     "personalDescriptionA",                    :limit => 16777215
    t.text     "personalDescriptionB",                    :limit => 16777215
    t.text     "personalDescriptionC",                    :limit => 16777215
    t.text     "familyRelationshipDescription",           :limit => 16777215
    t.string   "electronicSignature",                     :limit => 90
    t.string   "ssn",                                     :limit => 50
    t.integer  "fk_ssmUserID"
    t.integer  "fk_PersonID"
    t.boolean  "isPaid"
    t.decimal  "appFee",                                                      :precision => 18, :scale => 0
    t.datetime "dateAppLastChanged"
    t.datetime "dateAppStarted"
    t.datetime "dateSubmitted"
    t.boolean  "isSubmitted"
    t.string   "appStatus",                               :limit => 15
    t.integer  "assignedToProject"
    t.integer  "finalProject"
    t.string   "siYear",                                  :limit => 50
    t.datetime "submitDate"
    t.string   "status",                                  :limit => 22
    t.string   "appType",                                 :limit => 64
  end

  add_index "hr_si_application_2004_deprecated", ["fk_PersonID"], :name => "fk_SIPersonID"
  add_index "hr_si_application_2004_deprecated", ["fk_ssmUserID"], :name => "fk_ssmUserID"

  create_table "hr_si_application_2005_deprecated", :primary_key => "applicationID", :force => true do |t|
    t.integer  "locationA"
    t.string   "locationAExplanation",                    :limit => 90
    t.integer  "locationB"
    t.string   "locationBExplanation",                    :limit => 90
    t.integer  "locationC"
    t.string   "locationCExplanation",                    :limit => 90
    t.string   "availableMonth",                          :limit => 2
    t.string   "availableYear",                           :limit => 4
    t.integer  "hasMinistryConflict"
    t.text     "ministryConflictExplanation",             :limit => 16777215
    t.integer  "hasSpecificLocation"
    t.string   "specificLocationRecruiterName",           :limit => 50
    t.text     "teamMembers",                             :limit => 16777215
    t.integer  "isDating"
    t.text     "datingLocation",                          :limit => 16777215
    t.integer  "hasCampusPartnership"
    t.integer  "isDatingStint"
    t.text     "datingStintName",                         :limit => 16777215
    t.string   "language1",                               :limit => 50
    t.string   "language1YearsStudied",                   :limit => 20
    t.integer  "language1Fluency"
    t.string   "language2",                               :limit => 50
    t.string   "language2YearsStudied",                   :limit => 20
    t.integer  "language2Fluency"
    t.text     "previousMinistryExperience",              :limit => 16777215
    t.text     "ministryTraining",                        :limit => 16777215
    t.text     "evangelismAttitude",                      :limit => 16777215
    t.integer  "isEvangelismTrainable"
    t.text     "participationExplanation",                :limit => 16777215
    t.integer  "isFamiliarFourSpiritualLaws"
    t.integer  "hasExperienceFourSpiritualLaws"
    t.integer  "confidenceFourSpiritualLaws"
    t.integer  "isFamiliarLifeAtLarge"
    t.integer  "hasExperienceLifeAtLarge"
    t.integer  "confidenceLifeAtLarge"
    t.integer  "isFamiliarPersonalTestimony"
    t.integer  "hasExperiencePersonalTestimony"
    t.integer  "confidencePersonalTestimony"
    t.integer  "isFamiliarExplainingGospel"
    t.integer  "hasExperienceExplainingGospel"
    t.integer  "confidenceExplainingGospel"
    t.integer  "isFamiliarSharingFaith"
    t.integer  "hasExperienceSharingFaith"
    t.integer  "confidenceSharingFaith"
    t.integer  "isFamiliarHolySpiritBooklet"
    t.integer  "hasExperienceHolySpiritBooklet"
    t.integer  "confidenceHolySpiritBooklet"
    t.integer  "isFamiliarFollowUp"
    t.integer  "hasExperienceFollowUp"
    t.integer  "confidenceFollowUp"
    t.integer  "isFamiliarHelpGrowInFaith"
    t.integer  "hasExperienceHelpGrowInFaith"
    t.integer  "confidenceHelpGrowInFaith"
    t.integer  "isFamiliarTrainShareFaith"
    t.integer  "hasExperienceTrainShareFaith"
    t.integer  "confidenceTrainShareFaith"
    t.integer  "isFamiliarOtherReligions"
    t.integer  "hasExperienceOtherReligions"
    t.integer  "confidenceOtherReligions"
    t.text     "leadershipPositions",                     :limit => 16777215
    t.integer  "hasLedDiscipleshipGroup"
    t.string   "discipleshipGroupSize",                   :limit => 50
    t.text     "leadershipEvaluation",                    :limit => 16777215
    t.integer  "conversionMonth"
    t.integer  "conversionYear"
    t.string   "memberChurchDenomination",                :limit => 75
    t.string   "memberChurchDuration",                    :limit => 50
    t.string   "attendingChurchDenomination",             :limit => 50
    t.string   "attendingChurchDuration",                 :limit => 50
    t.text     "attendingChurchInvolvement",              :limit => 16777215
    t.text     "quietTimeQuantity",                       :limit => 16777215
    t.text     "quietTimeDescription",                    :limit => 16777215
    t.text     "explanationOfSalvation",                  :limit => 16777215
    t.text     "explanationOfSpiritFilled",               :limit => 16777215
    t.integer  "hasInvolvementSpeakingTongues"
    t.text     "differenceIndwellingFilled",              :limit => 16777215
    t.integer  "hasCrimeConviction"
    t.text     "crimeConvictionExplanation",              :limit => 16777215
    t.integer  "hasDrugUse"
    t.integer  "isTobaccoUser"
    t.integer  "isWillingChangeHabits"
    t.text     "authorityResponseExplanation",            :limit => 16777215
    t.text     "alcoholUseFrequency",                     :limit => 16777215
    t.text     "alcoholUseDecision",                      :limit => 16777215
    t.integer  "isWillingRefrainAlcohol"
    t.text     "unwillingRefrainAlcoholExplanation",      :limit => 16777215
    t.text     "drugUseExplanation",                      :limit => 16777215
    t.text     "tobaccoUseExplanation",                   :limit => 16777215
    t.integer  "isWillingAbstainTobacco"
    t.integer  "hasRequestedPhoneCall"
    t.string   "contactPhoneNumber",                      :limit => 50
    t.string   "contactBestTime",                         :limit => 50
    t.string   "contactTimeZone",                         :limit => 50
    t.text     "sexualInvolvementExplanation",            :limit => 16777215
    t.integer  "hasSexualGuidelines"
    t.text     "sexualGuidelineExplanation",              :limit => 16777215
    t.integer  "isCurrentlyDating"
    t.text     "currentlyDatingLocation",                 :limit => 16777215
    t.integer  "hasHomosexualInvolvement"
    t.text     "homosexualInvolvementExplanation",        :limit => 16777215
    t.integer  "hasRecentPornographicInvolvement"
    t.integer  "pornographicInvolvementMonth"
    t.integer  "pornographicInvolvementYear"
    t.text     "pornographicInvolvementExplanation",      :limit => 16777215
    t.integer  "hasRecentSexualImmorality"
    t.integer  "sexualImmoralityMonth"
    t.integer  "sexualImmoralityYear"
    t.text     "sexualImmoralityExplanation",             :limit => 16777215
    t.integer  "hasOtherDateSinceImmorality"
    t.text     "singleImmoralityResultsExplanation",      :limit => 16777215
    t.text     "marriedImmoralityResultsExplanation",     :limit => 16777215
    t.text     "immoralityLifeChangeExplanation",         :limit => 16777215
    t.text     "immoralityCurrentStrugglesExplanation",   :limit => 16777215
    t.text     "additionalMoralComments",                 :limit => 16777215
    t.integer  "isAwareMustRaiseSupport"
    t.integer  "isInDebt"
    t.string   "debtNature1",                             :limit => 50
    t.string   "debtTotal1",                              :limit => 50
    t.string   "debtMonthlyPayment1",                     :limit => 50
    t.string   "debtNature2",                             :limit => 50
    t.string   "debtTotal2",                              :limit => 50
    t.string   "debtMonthlyPayment2",                     :limit => 50
    t.string   "debtNature3",                             :limit => 50
    t.string   "debtTotal3",                              :limit => 50
    t.string   "debtMonthlyPayment3",                     :limit => 50
    t.integer  "hasOtherFinancialResponsibility"
    t.text     "otherFinancialResponsibilityExplanation", :limit => 16777215
    t.text     "debtPaymentPlan",                         :limit => 16777215
    t.text     "debtPaymentTimeframe",                    :limit => 16777215
    t.text     "developingPartnersExplanation",           :limit => 16777215
    t.integer  "isWillingDevelopPartners"
    t.text     "unwillingDevelopPartnersExplanation",     :limit => 16777215
    t.integer  "isCommittedDevelopPartners"
    t.text     "uncommittedDevelopPartnersExplanation",   :limit => 16777215
    t.text     "personalTestimonyGrowth",                 :limit => 16777215
    t.text     "internshipParticipationExplanation",      :limit => 16777215
    t.text     "internshipObjectives",                    :limit => 16777215
    t.text     "currentMinistryDescription",              :limit => 16777215
    t.text     "personalStrengthA",                       :limit => 16777215
    t.text     "personalStrengthB",                       :limit => 16777215
    t.text     "personalStrengthC",                       :limit => 16777215
    t.text     "personalDevelopmentA",                    :limit => 16777215
    t.text     "personalDevelopmentB",                    :limit => 16777215
    t.text     "personalDevelopmentC",                    :limit => 16777215
    t.text     "personalDescriptionA",                    :limit => 16777215
    t.text     "personalDescriptionB",                    :limit => 16777215
    t.text     "personalDescriptionC",                    :limit => 16777215
    t.text     "familyRelationshipDescription",           :limit => 16777215
    t.string   "electronicSignature",                     :limit => 90
    t.string   "ssn",                                     :limit => 50
    t.integer  "fk_ssmUserID"
    t.integer  "fk_PersonID"
    t.boolean  "isPaid"
    t.decimal  "appFee",                                                      :precision => 18, :scale => 0
    t.datetime "dateAppLastChanged"
    t.datetime "dateAppStarted"
    t.datetime "dateSubmitted"
    t.boolean  "isSubmitted"
    t.string   "appStatus",                               :limit => 15
    t.integer  "assignedToProject"
    t.integer  "finalProject"
    t.string   "siYear",                                  :limit => 50
    t.datetime "submitDate"
    t.string   "status",                                  :limit => 22
    t.string   "appType",                                 :limit => 64
  end

  add_index "hr_si_application_2005_deprecated", ["fk_PersonID"], :name => "fk_SIPersonID"
  add_index "hr_si_application_2005_deprecated", ["fk_ssmUserID"], :name => "fk_ssmUserID"

  create_table "hr_si_application_2006_deprecated", :primary_key => "applicationID", :force => true do |t|
    t.integer  "locationA"
    t.string   "locationAExplanation",                    :limit => 90
    t.integer  "locationB"
    t.string   "locationBExplanation",                    :limit => 90
    t.integer  "locationC"
    t.string   "locationCExplanation",                    :limit => 90
    t.string   "availableMonth",                          :limit => 2
    t.string   "availableYear",                           :limit => 4
    t.integer  "hasMinistryConflict"
    t.text     "ministryConflictExplanation",             :limit => 16777215
    t.integer  "hasSpecificLocation"
    t.string   "specificLocationRecruiterName",           :limit => 50
    t.text     "teamMembers",                             :limit => 16777215
    t.integer  "isDating"
    t.text     "datingLocation",                          :limit => 16777215
    t.integer  "hasCampusPartnership"
    t.integer  "isDatingStint"
    t.text     "datingStintName",                         :limit => 16777215
    t.string   "language1",                               :limit => 50
    t.string   "language1YearsStudied",                   :limit => 20
    t.integer  "language1Fluency"
    t.string   "language2",                               :limit => 50
    t.string   "language2YearsStudied",                   :limit => 20
    t.integer  "language2Fluency"
    t.text     "previousMinistryExperience",              :limit => 16777215
    t.text     "ministryTraining",                        :limit => 16777215
    t.text     "evangelismAttitude",                      :limit => 16777215
    t.integer  "isEvangelismTrainable"
    t.text     "participationExplanation",                :limit => 16777215
    t.integer  "isFamiliarFourSpiritualLaws"
    t.integer  "hasExperienceFourSpiritualLaws"
    t.integer  "confidenceFourSpiritualLaws"
    t.integer  "isFamiliarLifeAtLarge"
    t.integer  "hasExperienceLifeAtLarge"
    t.integer  "confidenceLifeAtLarge"
    t.integer  "isFamiliarPersonalTestimony"
    t.integer  "hasExperiencePersonalTestimony"
    t.integer  "confidencePersonalTestimony"
    t.integer  "isFamiliarExplainingGospel"
    t.integer  "hasExperienceExplainingGospel"
    t.integer  "confidenceExplainingGospel"
    t.integer  "isFamiliarSharingFaith"
    t.integer  "hasExperienceSharingFaith"
    t.integer  "confidenceSharingFaith"
    t.integer  "isFamiliarHolySpiritBooklet"
    t.integer  "hasExperienceHolySpiritBooklet"
    t.integer  "confidenceHolySpiritBooklet"
    t.integer  "isFamiliarFollowUp"
    t.integer  "hasExperienceFollowUp"
    t.integer  "confidenceFollowUp"
    t.integer  "isFamiliarHelpGrowInFaith"
    t.integer  "hasExperienceHelpGrowInFaith"
    t.integer  "confidenceHelpGrowInFaith"
    t.integer  "isFamiliarTrainShareFaith"
    t.integer  "hasExperienceTrainShareFaith"
    t.integer  "confidenceTrainShareFaith"
    t.integer  "isFamiliarOtherReligions"
    t.integer  "hasExperienceOtherReligions"
    t.integer  "confidenceOtherReligions"
    t.text     "leadershipPositions",                     :limit => 16777215
    t.integer  "hasLedDiscipleshipGroup"
    t.string   "discipleshipGroupSize",                   :limit => 50
    t.text     "leadershipEvaluation",                    :limit => 16777215
    t.integer  "conversionMonth"
    t.integer  "conversionYear"
    t.string   "memberChurchDenomination",                :limit => 75
    t.string   "memberChurchDuration",                    :limit => 50
    t.string   "attendingChurchDenomination",             :limit => 50
    t.string   "attendingChurchDuration",                 :limit => 50
    t.text     "attendingChurchInvolvement",              :limit => 16777215
    t.text     "quietTimeQuantity",                       :limit => 16777215
    t.text     "quietTimeDescription",                    :limit => 16777215
    t.text     "explanationOfSalvation",                  :limit => 16777215
    t.text     "explanationOfSpiritFilled",               :limit => 16777215
    t.integer  "hasInvolvementSpeakingTongues"
    t.text     "differenceIndwellingFilled",              :limit => 16777215
    t.integer  "hasCrimeConviction"
    t.text     "crimeConvictionExplanation",              :limit => 16777215
    t.integer  "hasDrugUse"
    t.integer  "isTobaccoUser"
    t.integer  "isWillingChangeHabits"
    t.text     "authorityResponseExplanation",            :limit => 16777215
    t.text     "alcoholUseFrequency",                     :limit => 16777215
    t.text     "alcoholUseDecision",                      :limit => 16777215
    t.integer  "isWillingRefrainAlcohol"
    t.text     "unwillingRefrainAlcoholExplanation",      :limit => 16777215
    t.text     "drugUseExplanation",                      :limit => 16777215
    t.text     "tobaccoUseExplanation",                   :limit => 16777215
    t.integer  "isWillingAbstainTobacco"
    t.integer  "hasRequestedPhoneCall"
    t.string   "contactPhoneNumber",                      :limit => 50
    t.string   "contactBestTime",                         :limit => 50
    t.string   "contactTimeZone",                         :limit => 50
    t.text     "sexualInvolvementExplanation",            :limit => 16777215
    t.integer  "hasSexualGuidelines"
    t.text     "sexualGuidelineExplanation",              :limit => 16777215
    t.integer  "isCurrentlyDating"
    t.text     "currentlyDatingLocation",                 :limit => 16777215
    t.integer  "hasHomosexualInvolvement"
    t.text     "homosexualInvolvementExplanation",        :limit => 16777215
    t.integer  "hasRecentPornographicInvolvement"
    t.integer  "pornographicInvolvementMonth"
    t.integer  "pornographicInvolvementYear"
    t.text     "pornographicInvolvementExplanation",      :limit => 16777215
    t.integer  "hasRecentSexualImmorality"
    t.integer  "sexualImmoralityMonth"
    t.integer  "sexualImmoralityYear"
    t.text     "sexualImmoralityExplanation",             :limit => 16777215
    t.integer  "hasOtherDateSinceImmorality"
    t.text     "singleImmoralityResultsExplanation",      :limit => 16777215
    t.text     "marriedImmoralityResultsExplanation",     :limit => 16777215
    t.text     "immoralityLifeChangeExplanation",         :limit => 16777215
    t.text     "immoralityCurrentStrugglesExplanation",   :limit => 16777215
    t.text     "additionalMoralComments",                 :limit => 16777215
    t.integer  "isAwareMustRaiseSupport"
    t.integer  "isInDebt"
    t.string   "debtNature1",                             :limit => 50
    t.string   "debtTotal1",                              :limit => 50
    t.string   "debtMonthlyPayment1",                     :limit => 50
    t.string   "debtNature2",                             :limit => 50
    t.string   "debtTotal2",                              :limit => 50
    t.string   "debtMonthlyPayment2",                     :limit => 50
    t.string   "debtNature3",                             :limit => 50
    t.string   "debtTotal3",                              :limit => 50
    t.string   "debtMonthlyPayment3",                     :limit => 50
    t.integer  "hasOtherFinancialResponsibility"
    t.text     "otherFinancialResponsibilityExplanation", :limit => 16777215
    t.text     "debtPaymentPlan",                         :limit => 16777215
    t.text     "debtPaymentTimeframe",                    :limit => 16777215
    t.text     "developingPartnersExplanation",           :limit => 16777215
    t.integer  "isWillingDevelopPartners"
    t.text     "unwillingDevelopPartnersExplanation",     :limit => 16777215
    t.integer  "isCommittedDevelopPartners"
    t.text     "uncommittedDevelopPartnersExplanation",   :limit => 16777215
    t.text     "personalTestimonyGrowth",                 :limit => 16777215
    t.text     "internshipParticipationExplanation",      :limit => 16777215
    t.text     "internshipObjectives",                    :limit => 16777215
    t.text     "currentMinistryDescription",              :limit => 16777215
    t.text     "personalStrengthA",                       :limit => 16777215
    t.text     "personalStrengthB",                       :limit => 16777215
    t.text     "personalStrengthC",                       :limit => 16777215
    t.text     "personalDevelopmentA",                    :limit => 16777215
    t.text     "personalDevelopmentB",                    :limit => 16777215
    t.text     "personalDevelopmentC",                    :limit => 16777215
    t.text     "personalDescriptionA",                    :limit => 16777215
    t.text     "personalDescriptionB",                    :limit => 16777215
    t.text     "personalDescriptionC",                    :limit => 16777215
    t.text     "familyRelationshipDescription",           :limit => 16777215
    t.string   "electronicSignature",                     :limit => 90
    t.string   "ssn",                                     :limit => 50
    t.integer  "fk_ssmUserID"
    t.integer  "fk_personID"
    t.boolean  "isPaid"
    t.decimal  "appFee",                                                      :precision => 18, :scale => 0
    t.datetime "dateAppLastChanged"
    t.datetime "dateAppStarted"
    t.datetime "dateSubmitted"
    t.boolean  "isSubmitted"
    t.string   "appStatus",                               :limit => 15
    t.integer  "assignedToProject"
    t.integer  "finalProject"
    t.string   "siYear",                                  :limit => 50
    t.datetime "submitDate"
    t.string   "status",                                  :limit => 22
    t.string   "appType",                                 :limit => 64
  end

  add_index "hr_si_application_2006_deprecated", ["fk_ssmUserID"], :name => "IX_hr_si_Application_2006_1"

  create_table "hr_si_applications", :primary_key => "applicationID", :force => true do |t|
    t.integer  "oldApplicationID"
    t.integer  "locationA"
    t.string   "locationAExplanation",                    :limit => 90
    t.integer  "locationB"
    t.string   "locationBExplanation",                    :limit => 90
    t.integer  "locationC"
    t.string   "locationCExplanation",                    :limit => 90
    t.string   "availableMonth",                          :limit => 2
    t.string   "availableYear",                           :limit => 4
    t.integer  "hasMinistryConflict"
    t.text     "ministryConflictExplanation",             :limit => 2147483647
    t.integer  "hasSpecificLocation"
    t.string   "specificLocationRecruiterName",           :limit => 50
    t.text     "teamMembers",                             :limit => 2147483647
    t.integer  "isDating"
    t.text     "datingLocation",                          :limit => 2147483647
    t.integer  "hasCampusPartnership"
    t.integer  "isDatingStint"
    t.text     "datingStintName",                         :limit => 2147483647
    t.string   "language1",                               :limit => 50
    t.string   "language1YearsStudied",                   :limit => 20
    t.integer  "language1Fluency"
    t.string   "language2",                               :limit => 50
    t.string   "language2YearsStudied",                   :limit => 20
    t.integer  "language2Fluency"
    t.text     "previousMinistryExperience",              :limit => 2147483647
    t.text     "ministryTraining",                        :limit => 2147483647
    t.text     "evangelismAttitude",                      :limit => 2147483647
    t.integer  "isEvangelismTrainable"
    t.text     "participationExplanation",                :limit => 2147483647
    t.integer  "isFamiliarFourSpiritualLaws"
    t.integer  "hasExperienceFourSpiritualLaws"
    t.integer  "confidenceFourSpiritualLaws"
    t.integer  "isFamiliarLifeAtLarge"
    t.integer  "hasExperienceLifeAtLarge"
    t.integer  "confidenceLifeAtLarge"
    t.integer  "isFamiliarPersonalTestimony"
    t.integer  "hasExperiencePersonalTestimony"
    t.integer  "confidencePersonalTestimony"
    t.integer  "isFamiliarExplainingGospel"
    t.integer  "hasExperienceExplainingGospel"
    t.integer  "confidenceExplainingGospel"
    t.integer  "isFamiliarSharingFaith"
    t.integer  "hasExperienceSharingFaith"
    t.integer  "confidenceSharingFaith"
    t.integer  "isFamiliarHolySpiritBooklet"
    t.integer  "hasExperienceHolySpiritBooklet"
    t.integer  "confidenceHolySpiritBooklet"
    t.integer  "isFamiliarFollowUp"
    t.integer  "hasExperienceFollowUp"
    t.integer  "confidenceFollowUp"
    t.integer  "isFamiliarHelpGrowInFaith"
    t.integer  "hasExperienceHelpGrowInFaith"
    t.integer  "confidenceHelpGrowInFaith"
    t.integer  "isFamiliarTrainShareFaith"
    t.integer  "hasExperienceTrainShareFaith"
    t.integer  "confidenceTrainShareFaith"
    t.integer  "isFamiliarOtherReligions"
    t.integer  "hasExperienceOtherReligions"
    t.integer  "confidenceOtherReligions"
    t.text     "leadershipPositions",                     :limit => 2147483647
    t.integer  "hasLedDiscipleshipGroup"
    t.string   "discipleshipGroupSize",                   :limit => 50
    t.text     "leadershipEvaluation",                    :limit => 2147483647
    t.integer  "conversionMonth"
    t.integer  "conversionYear"
    t.string   "memberChurchDenomination",                :limit => 75
    t.string   "memberChurchDuration",                    :limit => 50
    t.string   "attendingChurchDenomination",             :limit => 50
    t.string   "attendingChurchDuration",                 :limit => 50
    t.text     "attendingChurchInvolvement",              :limit => 2147483647
    t.text     "quietTimeQuantity",                       :limit => 2147483647
    t.text     "quietTimeDescription",                    :limit => 2147483647
    t.text     "explanationOfSalvation",                  :limit => 2147483647
    t.text     "explanationOfSpiritFilled",               :limit => 2147483647
    t.integer  "hasInvolvementSpeakingTongues"
    t.text     "differenceIndwellingFilled",              :limit => 2147483647
    t.integer  "hasCrimeConviction"
    t.text     "crimeConvictionExplanation",              :limit => 2147483647
    t.integer  "hasDrugUse"
    t.integer  "isTobaccoUser"
    t.integer  "isWillingChangeHabits"
    t.text     "authorityResponseExplanation",            :limit => 2147483647
    t.text     "alcoholUseFrequency",                     :limit => 2147483647
    t.text     "alcoholUseDecision",                      :limit => 2147483647
    t.integer  "isWillingRefrainAlcohol"
    t.text     "unwillingRefrainAlcoholExplanation",      :limit => 2147483647
    t.text     "drugUseExplanation",                      :limit => 2147483647
    t.text     "tobaccoUseExplanation",                   :limit => 2147483647
    t.integer  "isWillingAbstainTobacco"
    t.integer  "hasRequestedPhoneCall"
    t.string   "contactPhoneNumber",                      :limit => 50
    t.string   "contactBestTime",                         :limit => 50
    t.string   "contactTimeZone",                         :limit => 50
    t.text     "sexualInvolvementExplanation",            :limit => 2147483647
    t.integer  "hasSexualGuidelines"
    t.text     "sexualGuidelineExplanation",              :limit => 2147483647
    t.integer  "isCurrentlyDating"
    t.text     "currentlyDatingLocation",                 :limit => 2147483647
    t.integer  "hasHomosexualInvolvement"
    t.text     "homosexualInvolvementExplanation",        :limit => 2147483647
    t.integer  "hasRecentPornographicInvolvement"
    t.integer  "pornographicInvolvementMonth"
    t.integer  "pornographicInvolvementYear"
    t.text     "pornographicInvolvementExplanation",      :limit => 2147483647
    t.integer  "hasRecentSexualImmorality"
    t.integer  "sexualImmoralityMonth"
    t.integer  "sexualImmoralityYear"
    t.text     "sexualImmoralityExplanation",             :limit => 2147483647
    t.integer  "hasOtherDateSinceImmorality"
    t.text     "singleImmoralityResultsExplanation",      :limit => 2147483647
    t.text     "marriedImmoralityResultsExplanation",     :limit => 2147483647
    t.text     "immoralityLifeChangeExplanation",         :limit => 2147483647
    t.text     "immoralityCurrentStrugglesExplanation",   :limit => 2147483647
    t.text     "additionalMoralComments",                 :limit => 2147483647
    t.integer  "isAwareMustRaiseSupport"
    t.integer  "isInDebt"
    t.string   "debtNature1",                             :limit => 50
    t.string   "debtTotal1",                              :limit => 50
    t.string   "debtMonthlyPayment1",                     :limit => 50
    t.string   "debtNature2",                             :limit => 50
    t.string   "debtTotal2",                              :limit => 50
    t.string   "debtMonthlyPayment2",                     :limit => 50
    t.string   "debtNature3",                             :limit => 50
    t.string   "debtTotal3",                              :limit => 50
    t.string   "debtMonthlyPayment3",                     :limit => 50
    t.integer  "hasOtherFinancialResponsibility"
    t.text     "otherFinancialResponsibilityExplanation", :limit => 2147483647
    t.text     "debtPaymentPlan",                         :limit => 2147483647
    t.text     "debtPaymentTimeframe",                    :limit => 2147483647
    t.text     "developingPartnersExplanation",           :limit => 2147483647
    t.integer  "isWillingDevelopPartners"
    t.text     "unwillingDevelopPartnersExplanation",     :limit => 2147483647
    t.integer  "isCommittedDevelopPartners"
    t.text     "uncommittedDevelopPartnersExplanation",   :limit => 2147483647
    t.text     "personalTestimonyGrowth",                 :limit => 2147483647
    t.text     "internshipParticipationExplanation",      :limit => 2147483647
    t.text     "internshipObjectives",                    :limit => 2147483647
    t.text     "currentMinistryDescription",              :limit => 2147483647
    t.text     "personalStrengthA",                       :limit => 2147483647
    t.text     "personalStrengthB",                       :limit => 2147483647
    t.text     "personalStrengthC",                       :limit => 2147483647
    t.text     "personalDevelopmentA",                    :limit => 2147483647
    t.text     "personalDevelopmentB",                    :limit => 2147483647
    t.text     "personalDevelopmentC",                    :limit => 2147483647
    t.text     "personalDescriptionA",                    :limit => 2147483647
    t.text     "personalDescriptionB",                    :limit => 2147483647
    t.text     "personalDescriptionC",                    :limit => 2147483647
    t.text     "familyRelationshipDescription",           :limit => 2147483647
    t.string   "electronicSignature",                     :limit => 90
    t.string   "ssn",                                     :limit => 50
    t.integer  "fk_ssmUserID"
    t.integer  "fk_personID",                                                                                  :null => false
    t.boolean  "isPaid"
    t.decimal  "appFee",                                                        :precision => 18, :scale => 0
    t.datetime "dateAppLastChanged"
    t.datetime "dateAppStarted"
    t.datetime "dateSubmitted"
    t.boolean  "isSubmitted"
    t.string   "appStatus",                               :limit => 15
    t.integer  "assignedToProject"
    t.decimal  "finalProject",                                                  :precision => 10, :scale => 0
    t.string   "siYear",                                  :limit => 50
    t.datetime "submitDate"
    t.string   "status",                                  :limit => 22
    t.string   "appType",                                 :limit => 64
    t.integer  "apply_id"
  end

  add_index "hr_si_applications", ["apply_id"], :name => "apply_id"
  add_index "hr_si_applications", ["fk_personID"], :name => "fk_PersonID"
  add_index "hr_si_applications", ["locationA"], :name => "locationA"
  add_index "hr_si_applications", ["locationB"], :name => "locationB"
  add_index "hr_si_applications", ["locationC"], :name => "locationC"
  add_index "hr_si_applications", ["oldApplicationID"], :name => "oldApplicationID"
  add_index "hr_si_applications", ["siYear"], :name => "siYear"

  create_table "hr_si_payment", :primary_key => "paymentID", :force => true do |t|
    t.datetime "paymentDate"
    t.float    "debit"
    t.float    "credit"
    t.string   "type",             :limit => 80
    t.string   "authCode",         :limit => 80
    t.string   "businessUnit",     :limit => 50
    t.string   "dept",             :limit => 50
    t.string   "region",           :limit => 50
    t.string   "project",          :limit => 50
    t.string   "accountNo",        :limit => 80
    t.string   "comment"
    t.string   "posted",           :limit => 1
    t.datetime "postedDate"
    t.integer  "fk_ApplicationID"
    t.string   "paymentFor",       :limit => 50
  end

  add_index "hr_si_payment", ["fk_ApplicationID"], :name => "fk_ApplicationID"

  create_table "hr_si_project", :primary_key => "SIProjectID", :force => true do |t|
    t.string   "name"
    t.string   "partnershipRegion",             :limit => 50
    t.string   "history",                       :limit => 8000
    t.string   "city"
    t.string   "country"
    t.string   "details",                       :limit => 8000
    t.string   "status"
    t.string   "destinationGatewayCity"
    t.datetime "departDateFromGateCity"
    t.datetime "arrivalDateAtLocation"
    t.string   "locationGatewayCity"
    t.datetime "departDateFromLocation"
    t.datetime "arrivalDateAtGatewayCity"
    t.integer  "flightBudget"
    t.string   "gatewayCitytoLocationFlightNo"
    t.string   "locationToGatewayCityFlightNo"
    t.string   "inCountryContact"
    t.string   "scholarshipAccountNo"
    t.string   "operatingAccountNo"
    t.string   "AOA"
    t.string   "MPTA"
    t.integer  "staffCost"
    t.integer  "studentCost"
    t.text     "studentCostExplaination"
    t.boolean  "insuranceFormsReceived"
    t.boolean  "CAPSFeePaid"
    t.boolean  "adminFeePaid"
    t.string   "storiesXX"
    t.string   "stats"
    t.boolean  "secure"
    t.boolean  "projEvalCompleted"
    t.integer  "evangelisticExposures"
    t.integer  "receivedChrist"
    t.integer  "jesusFilmExposures"
    t.integer  "jesusFilmReveivedChrist"
    t.integer  "coverageActivitiesExposures"
    t.integer  "coverageActivitiesDecisions"
    t.integer  "holySpiritDecisions"
    t.string   "website"
    t.string   "destinationAddress"
    t.string   "destinationPhone"
    t.string   "siYear"
    t.integer  "fk_isCoord"
    t.integer  "fk_isAPD"
    t.integer  "fk_isPD"
    t.string   "projectType",                   :limit => 1
    t.datetime "studentStartDate"
    t.datetime "studentEndDate"
    t.datetime "staffStartDate"
    t.datetime "staffEndDate"
    t.datetime "leadershipStartDate"
    t.datetime "leadershipEndDate"
    t.datetime "createDate"
    t.binary   "lastChangedDate",               :limit => 8
    t.integer  "lastChangedBy"
    t.string   "displayLocation"
    t.boolean  "partnershipRegionOnly"
    t.integer  "internCost"
    t.boolean  "onHold"
    t.integer  "maxNoStaffPMale"
    t.integer  "maxNoStaffPFemale"
    t.integer  "maxNoStaffPCouples"
    t.integer  "maxNoStaffPFamilies"
    t.integer  "maxNoStaffP"
    t.integer  "maxNoInternAMale"
    t.integer  "maxNoInternAFemale"
    t.integer  "maxNoInternACouples"
    t.integer  "maxNoInternAFamilies"
    t.integer  "maxNoInternA"
    t.integer  "maxNoInternPMale"
    t.integer  "maxNoInternPFemale"
    t.integer  "maxNoInternPCouples"
    t.integer  "maxNoInternPFamilies"
    t.integer  "maxNoInternP"
    t.integer  "maxNoStudentAMale"
    t.integer  "maxNoStudentAFemale"
    t.integer  "maxNoStudentACouples"
    t.integer  "maxNoStudentAFamilies"
    t.integer  "maxNoStudentA"
    t.integer  "maxNoStudentPMale"
    t.integer  "maxNoStudentPFemale"
    t.integer  "maxNoStudentPCouples"
    t.integer  "maxNoStudentPFamilies"
    t.integer  "maxNoStudentP"
  end

  create_table "hr_si_reference", :primary_key => "referenceID", :force => true do |t|
    t.integer  "oldReferenceID"
    t.string   "formWorkflowStatus", :limit => 1
    t.datetime "createDate"
    t.datetime "lastChangedDate"
    t.string   "lastChangedBy",      :limit => 30
    t.boolean  "isFormSubmitted"
    t.datetime "formSubmittedDate"
    t.string   "referenceType",      :limit => 2
    t.string   "title",              :limit => 5
    t.string   "firstName",          :limit => 30
    t.string   "lastName",           :limit => 30
    t.boolean  "isStaff"
    t.string   "staffNumber",        :limit => 16
    t.string   "currentAddress1",    :limit => 35
    t.string   "currentAddress2",    :limit => 35
    t.string   "currentCity",        :limit => 35
    t.string   "currentState",       :limit => 6
    t.string   "currentZip",         :limit => 10
    t.string   "cellPhone",          :limit => 24
    t.string   "homePhone",          :limit => 24
    t.string   "workPhone",          :limit => 24
    t.string   "currentEmail",       :limit => 50
    t.string   "howKnown",           :limit => 64
    t.string   "howLongKnown",       :limit => 64
    t.integer  "howWellKnown"
    t.integer  "howWellComm"
    t.integer  "_rg1"
    t.integer  "_rg2"
    t.integer  "_rg3"
    t.integer  "_rg4"
    t.integer  "_rg5"
    t.string   "_rg1c",              :limit => 50
    t.string   "_rg2c",              :limit => 50
    t.string   "_rg3c",              :limit => 50
    t.string   "_rg4c",              :limit => 50
    t.string   "_rg5c",              :limit => 50
    t.string   "_rg6",               :limit => 8000
    t.boolean  "_rg7"
    t.text     "_rg8",               :limit => 2147483647
    t.text     "_rg9",               :limit => 2147483647
    t.integer  "_ro1"
    t.integer  "_ro2"
    t.integer  "_ro3"
    t.integer  "_ro4"
    t.integer  "_ro5"
    t.integer  "_ro6"
    t.integer  "_ro7"
    t.string   "_ro1c",              :limit => 50
    t.string   "_ro2c",              :limit => 50
    t.string   "_ro3c",              :limit => 50
    t.string   "_ro4c",              :limit => 50
    t.string   "_ro5c",              :limit => 50
    t.string   "_ro6c",              :limit => 50
    t.string   "_ro7c",              :limit => 50
    t.text     "_ro8",               :limit => 2147483647
    t.text     "_ro9",               :limit => 2147483647
    t.text     "_ro10",              :limit => 2147483647
    t.integer  "_dd1"
    t.integer  "_dd2"
    t.integer  "_dd3"
    t.integer  "_dd4"
    t.string   "_dd1c",              :limit => 50
    t.string   "_dd2c",              :limit => 50
    t.string   "_dd3c",              :limit => 50
    t.string   "_dd4c",              :limit => 50
    t.text     "_dd5",               :limit => 2147483647
    t.text     "_dd6",               :limit => 2147483647
    t.integer  "_if1"
    t.integer  "_if2"
    t.integer  "_if3"
    t.integer  "_if4"
    t.string   "_if1c",              :limit => 50
    t.string   "_if2c",              :limit => 50
    t.string   "_if3c",              :limit => 50
    t.string   "_if4c",              :limit => 50
    t.text     "_if5",               :limit => 2147483647
    t.text     "_if6",               :limit => 2147483647
    t.integer  "_ch1"
    t.integer  "_ch2"
    t.integer  "_ch3"
    t.integer  "_ch4"
    t.integer  "_ch5"
    t.string   "_ch1c",              :limit => 50
    t.string   "_ch2c",              :limit => 50
    t.string   "_ch3c",              :limit => 50
    t.string   "_ch4c",              :limit => 50
    t.string   "_ch5c",              :limit => 50
    t.text     "_ch6",               :limit => 2147483647
    t.text     "_ch7",               :limit => 2147483647
    t.text     "_ch8",               :limit => 2147483647
    t.integer  "_ew1"
    t.integer  "_ew2"
    t.integer  "_ew3"
    t.integer  "_ew4"
    t.integer  "_ew5"
    t.string   "_ew1c",              :limit => 50
    t.string   "_ew2c",              :limit => 50
    t.string   "_ew3c",              :limit => 50
    t.string   "_ew4c",              :limit => 50
    t.string   "_ew5c",              :limit => 50
    t.text     "_ew6",               :limit => 2147483647
    t.boolean  "_ew7"
    t.text     "_ew8",               :limit => 2147483647
    t.boolean  "_ew9"
    t.text     "_ew10",              :limit => 2147483647
    t.integer  "_ms1"
    t.integer  "_ms2"
    t.integer  "_ms3"
    t.integer  "_ms4"
    t.string   "_ms1c",              :limit => 50
    t.string   "_ms2c",              :limit => 50
    t.string   "_ms3c",              :limit => 50
    t.string   "_ms4c",              :limit => 50
    t.text     "_ms5",               :limit => 2147483647
    t.integer  "_ls1"
    t.integer  "_ls2"
    t.integer  "_ls3"
    t.integer  "_ls4"
    t.integer  "_ls5"
    t.string   "_ls1c",              :limit => 50
    t.string   "_ls2c",              :limit => 50
    t.string   "_ls3c",              :limit => 50
    t.string   "_ls4c",              :limit => 50
    t.string   "_ls5c",              :limit => 50
    t.text     "_ls6",               :limit => 2147483647
    t.text     "_ls7",               :limit => 2147483647
    t.text     "_ls8",               :limit => 2147483647
    t.text     "_re1",               :limit => 2147483647
    t.text     "_re2",               :limit => 2147483647
    t.text     "_re3",               :limit => 2147483647
    t.integer  "_re4"
    t.text     "_re5",               :limit => 2147483647
    t.integer  "oldSIApplicationID"
    t.integer  "fk_SIApplicationID"
    t.string   "siYear",             :limit => 4
  end

  add_index "hr_si_reference", ["fk_SIApplicationID"], :name => "fk_SIApplicationID"
  add_index "hr_si_reference", ["oldReferenceID"], :name => "oldReferenceID"
  add_index "hr_si_reference", ["oldSIApplicationID"], :name => "IX_hr_si_Reference_2006"
  add_index "hr_si_reference", ["siYear"], :name => "siYear"

  create_table "hr_si_reference_2003_deprecated", :primary_key => "referenceID", :force => true do |t|
    t.string   "formWorkflowStatus", :limit => 1
    t.datetime "createDate"
    t.datetime "lastChangedDate"
    t.string   "lastChangedBy",      :limit => 30
    t.boolean  "isFormSubmitted"
    t.datetime "formSubmittedDate"
    t.string   "referenceType",      :limit => 2
    t.string   "title",              :limit => 5
    t.string   "firstName",          :limit => 30
    t.string   "lastName",           :limit => 30
    t.boolean  "isStaff"
    t.string   "staffNumber",        :limit => 16
    t.string   "currentAddress1",    :limit => 35
    t.string   "currentAddress2",    :limit => 35
    t.string   "currentCity",        :limit => 35
    t.string   "currentState",       :limit => 6
    t.string   "currentZip",         :limit => 10
    t.string   "cellPhone",          :limit => 24
    t.string   "homePhone",          :limit => 24
    t.string   "workPhone",          :limit => 24
    t.string   "currentEmail",       :limit => 50
    t.string   "howKnown",           :limit => 64
    t.string   "howLongKnown",       :limit => 64
    t.integer  "howWellKnown"
    t.integer  "howWellComm"
    t.integer  "_rg1"
    t.integer  "_rg2"
    t.integer  "_rg3"
    t.integer  "_rg4"
    t.integer  "_rg5"
    t.string   "_rg1c",              :limit => 50
    t.string   "_rg2c",              :limit => 50
    t.string   "_rg3c",              :limit => 50
    t.string   "_rg4c",              :limit => 50
    t.string   "_rg5c",              :limit => 50
    t.text     "_rg6",               :limit => 2147483647
    t.boolean  "_rg7"
    t.text     "_rg8",               :limit => 2147483647
    t.text     "_rg9",               :limit => 2147483647
    t.integer  "_ro1"
    t.integer  "_ro2"
    t.integer  "_ro3"
    t.integer  "_ro4"
    t.integer  "_ro5"
    t.integer  "_ro6"
    t.integer  "_ro7"
    t.string   "_ro1c",              :limit => 50
    t.string   "_ro2c",              :limit => 50
    t.string   "_ro3c",              :limit => 50
    t.string   "_ro4c",              :limit => 50
    t.string   "_ro5c",              :limit => 50
    t.string   "_ro6c",              :limit => 50
    t.string   "_ro7c",              :limit => 50
    t.text     "_ro8",               :limit => 2147483647
    t.text     "_ro9",               :limit => 2147483647
    t.text     "_ro10",              :limit => 2147483647
    t.integer  "_dd1"
    t.integer  "_dd2"
    t.integer  "_dd3"
    t.integer  "_dd4"
    t.string   "_dd1c",              :limit => 50
    t.string   "_dd2c",              :limit => 50
    t.string   "_dd3c",              :limit => 50
    t.string   "_dd4c",              :limit => 50
    t.text     "_dd5",               :limit => 2147483647
    t.text     "_dd6",               :limit => 2147483647
    t.integer  "_if1"
    t.integer  "_if2"
    t.integer  "_if3"
    t.integer  "_if4"
    t.string   "_if1c",              :limit => 50
    t.string   "_if2c",              :limit => 50
    t.string   "_if3c",              :limit => 50
    t.string   "_if4c",              :limit => 50
    t.text     "_if5",               :limit => 2147483647
    t.text     "_if6",               :limit => 2147483647
    t.integer  "_ch1"
    t.integer  "_ch2"
    t.integer  "_ch3"
    t.integer  "_ch4"
    t.integer  "_ch5"
    t.string   "_ch1c",              :limit => 50
    t.string   "_ch2c",              :limit => 50
    t.string   "_ch3c",              :limit => 50
    t.string   "_ch4c",              :limit => 50
    t.string   "_ch5c",              :limit => 50
    t.text     "_ch6",               :limit => 2147483647
    t.text     "_ch7",               :limit => 2147483647
    t.text     "_ch8",               :limit => 2147483647
    t.integer  "_ew1"
    t.integer  "_ew2"
    t.integer  "_ew3"
    t.integer  "_ew4"
    t.integer  "_ew5"
    t.string   "_ew1c",              :limit => 50
    t.string   "_ew2c",              :limit => 50
    t.string   "_ew3c",              :limit => 50
    t.string   "_ew4c",              :limit => 50
    t.string   "_ew5c",              :limit => 50
    t.text     "_ew6",               :limit => 2147483647
    t.boolean  "_ew7"
    t.text     "_ew8",               :limit => 2147483647
    t.boolean  "_ew9"
    t.text     "_ew10",              :limit => 2147483647
    t.integer  "_ms1"
    t.integer  "_ms2"
    t.integer  "_ms3"
    t.integer  "_ms4"
    t.string   "_ms1c",              :limit => 50
    t.string   "_ms2c",              :limit => 50
    t.string   "_ms3c",              :limit => 50
    t.string   "_ms4c",              :limit => 50
    t.text     "_ms5",               :limit => 2147483647
    t.integer  "_ls1"
    t.integer  "_ls2"
    t.integer  "_ls3"
    t.integer  "_ls4"
    t.integer  "_ls5"
    t.string   "_ls1c",              :limit => 50
    t.string   "_ls2c",              :limit => 50
    t.string   "_ls3c",              :limit => 50
    t.string   "_ls4c",              :limit => 50
    t.string   "_ls5c",              :limit => 50
    t.text     "_ls6",               :limit => 2147483647
    t.text     "_ls7",               :limit => 2147483647
    t.text     "_ls8",               :limit => 2147483647
    t.text     "_re1",               :limit => 2147483647
    t.text     "_re2",               :limit => 2147483647
    t.text     "_re3",               :limit => 2147483647
    t.integer  "_re4"
    t.text     "_re5",               :limit => 2147483647
    t.integer  "fk_SIApplicationID"
  end

  add_index "hr_si_reference_2003_deprecated", ["fk_SIApplicationID"], :name => "fk_SIApplicationID"

  create_table "hr_si_reference_2004_deprecated", :primary_key => "referenceID", :force => true do |t|
    t.string   "formWorkflowStatus", :limit => 1
    t.datetime "createDate"
    t.datetime "lastChangedDate"
    t.string   "lastChangedBy",      :limit => 30
    t.boolean  "isFormSubmitted"
    t.datetime "formSubmittedDate"
    t.string   "referenceType",      :limit => 2
    t.string   "title",              :limit => 5
    t.string   "firstName",          :limit => 30
    t.string   "lastName",           :limit => 30
    t.boolean  "isStaff"
    t.string   "staffNumber",        :limit => 16
    t.string   "currentAddress1",    :limit => 35
    t.string   "currentAddress2",    :limit => 35
    t.string   "currentCity",        :limit => 35
    t.string   "currentState",       :limit => 6
    t.string   "currentZip",         :limit => 10
    t.string   "cellPhone",          :limit => 24
    t.string   "homePhone",          :limit => 24
    t.string   "workPhone",          :limit => 24
    t.string   "currentEmail",       :limit => 50
    t.string   "howKnown",           :limit => 64
    t.string   "howLongKnown",       :limit => 64
    t.integer  "howWellKnown"
    t.integer  "howWellComm"
    t.integer  "_rg1"
    t.integer  "_rg2"
    t.integer  "_rg3"
    t.integer  "_rg4"
    t.integer  "_rg5"
    t.string   "_rg1c",              :limit => 50
    t.string   "_rg2c",              :limit => 50
    t.string   "_rg3c",              :limit => 50
    t.string   "_rg4c",              :limit => 50
    t.string   "_rg5c",              :limit => 50
    t.text     "_rg6",               :limit => 2147483647
    t.boolean  "_rg7"
    t.text     "_rg8",               :limit => 2147483647
    t.text     "_rg9",               :limit => 2147483647
    t.integer  "_ro1"
    t.integer  "_ro2"
    t.integer  "_ro3"
    t.integer  "_ro4"
    t.integer  "_ro5"
    t.integer  "_ro6"
    t.integer  "_ro7"
    t.string   "_ro1c",              :limit => 50
    t.string   "_ro2c",              :limit => 50
    t.string   "_ro3c",              :limit => 50
    t.string   "_ro4c",              :limit => 50
    t.string   "_ro5c",              :limit => 50
    t.string   "_ro6c",              :limit => 50
    t.string   "_ro7c",              :limit => 50
    t.text     "_ro8",               :limit => 2147483647
    t.text     "_ro9",               :limit => 2147483647
    t.text     "_ro10",              :limit => 2147483647
    t.integer  "_dd1"
    t.integer  "_dd2"
    t.integer  "_dd3"
    t.integer  "_dd4"
    t.string   "_dd1c",              :limit => 50
    t.string   "_dd2c",              :limit => 50
    t.string   "_dd3c",              :limit => 50
    t.string   "_dd4c",              :limit => 50
    t.text     "_dd5",               :limit => 2147483647
    t.text     "_dd6",               :limit => 2147483647
    t.integer  "_if1"
    t.integer  "_if2"
    t.integer  "_if3"
    t.integer  "_if4"
    t.string   "_if1c",              :limit => 50
    t.string   "_if2c",              :limit => 50
    t.string   "_if3c",              :limit => 50
    t.string   "_if4c",              :limit => 50
    t.text     "_if5",               :limit => 2147483647
    t.text     "_if6",               :limit => 2147483647
    t.integer  "_ch1"
    t.integer  "_ch2"
    t.integer  "_ch3"
    t.integer  "_ch4"
    t.integer  "_ch5"
    t.string   "_ch1c",              :limit => 50
    t.string   "_ch2c",              :limit => 50
    t.string   "_ch3c",              :limit => 50
    t.string   "_ch4c",              :limit => 50
    t.string   "_ch5c",              :limit => 50
    t.text     "_ch6",               :limit => 2147483647
    t.text     "_ch7",               :limit => 2147483647
    t.text     "_ch8",               :limit => 2147483647
    t.integer  "_ew1"
    t.integer  "_ew2"
    t.integer  "_ew3"
    t.integer  "_ew4"
    t.integer  "_ew5"
    t.string   "_ew1c",              :limit => 50
    t.string   "_ew2c",              :limit => 50
    t.string   "_ew3c",              :limit => 50
    t.string   "_ew4c",              :limit => 50
    t.string   "_ew5c",              :limit => 50
    t.text     "_ew6",               :limit => 2147483647
    t.boolean  "_ew7"
    t.text     "_ew8",               :limit => 2147483647
    t.boolean  "_ew9"
    t.text     "_ew10",              :limit => 2147483647
    t.integer  "_ms1"
    t.integer  "_ms2"
    t.integer  "_ms3"
    t.integer  "_ms4"
    t.string   "_ms1c",              :limit => 50
    t.string   "_ms2c",              :limit => 50
    t.string   "_ms3c",              :limit => 50
    t.string   "_ms4c",              :limit => 50
    t.text     "_ms5",               :limit => 2147483647
    t.integer  "_ls1"
    t.integer  "_ls2"
    t.integer  "_ls3"
    t.integer  "_ls4"
    t.integer  "_ls5"
    t.string   "_ls1c",              :limit => 50
    t.string   "_ls2c",              :limit => 50
    t.string   "_ls3c",              :limit => 50
    t.string   "_ls4c",              :limit => 50
    t.string   "_ls5c",              :limit => 50
    t.text     "_ls6",               :limit => 2147483647
    t.text     "_ls7",               :limit => 2147483647
    t.text     "_ls8",               :limit => 2147483647
    t.text     "_re1",               :limit => 2147483647
    t.text     "_re2",               :limit => 2147483647
    t.text     "_re3",               :limit => 2147483647
    t.integer  "_re4"
    t.text     "_re5",               :limit => 2147483647
    t.integer  "fk_SIApplicationID"
  end

  add_index "hr_si_reference_2004_deprecated", ["fk_SIApplicationID"], :name => "fk_SIApplicationID"

  create_table "hr_si_reference_2005_deprecated", :primary_key => "referenceID", :force => true do |t|
    t.string   "formWorkflowStatus", :limit => 1
    t.datetime "createDate"
    t.datetime "lastChangedDate"
    t.string   "lastChangedBy",      :limit => 30
    t.boolean  "isFormSubmitted"
    t.datetime "formSubmittedDate"
    t.string   "referenceType",      :limit => 2
    t.string   "title",              :limit => 5
    t.string   "firstName",          :limit => 30
    t.string   "lastName",           :limit => 30
    t.boolean  "isStaff"
    t.string   "staffNumber",        :limit => 16
    t.string   "currentAddress1",    :limit => 35
    t.string   "currentAddress2",    :limit => 35
    t.string   "currentCity",        :limit => 35
    t.string   "currentState",       :limit => 6
    t.string   "currentZip",         :limit => 10
    t.string   "cellPhone",          :limit => 24
    t.string   "homePhone",          :limit => 24
    t.string   "workPhone",          :limit => 24
    t.string   "currentEmail",       :limit => 50
    t.string   "howKnown",           :limit => 64
    t.string   "howLongKnown",       :limit => 64
    t.integer  "howWellKnown"
    t.integer  "howWellComm"
    t.integer  "_rg1"
    t.integer  "_rg2"
    t.integer  "_rg3"
    t.integer  "_rg4"
    t.integer  "_rg5"
    t.string   "_rg1c",              :limit => 50
    t.string   "_rg2c",              :limit => 50
    t.string   "_rg3c",              :limit => 50
    t.string   "_rg4c",              :limit => 50
    t.string   "_rg5c",              :limit => 50
    t.text     "_rg6",               :limit => 2147483647
    t.boolean  "_rg7"
    t.text     "_rg8",               :limit => 2147483647
    t.text     "_rg9",               :limit => 2147483647
    t.integer  "_ro1"
    t.integer  "_ro2"
    t.integer  "_ro3"
    t.integer  "_ro4"
    t.integer  "_ro5"
    t.integer  "_ro6"
    t.integer  "_ro7"
    t.string   "_ro1c",              :limit => 50
    t.string   "_ro2c",              :limit => 50
    t.string   "_ro3c",              :limit => 50
    t.string   "_ro4c",              :limit => 50
    t.string   "_ro5c",              :limit => 50
    t.string   "_ro6c",              :limit => 50
    t.string   "_ro7c",              :limit => 50
    t.text     "_ro8",               :limit => 2147483647
    t.text     "_ro9",               :limit => 2147483647
    t.text     "_ro10",              :limit => 2147483647
    t.integer  "_dd1"
    t.integer  "_dd2"
    t.integer  "_dd3"
    t.integer  "_dd4"
    t.string   "_dd1c",              :limit => 50
    t.string   "_dd2c",              :limit => 50
    t.string   "_dd3c",              :limit => 50
    t.string   "_dd4c",              :limit => 50
    t.text     "_dd5",               :limit => 2147483647
    t.text     "_dd6",               :limit => 2147483647
    t.integer  "_if1"
    t.integer  "_if2"
    t.integer  "_if3"
    t.integer  "_if4"
    t.string   "_if1c",              :limit => 50
    t.string   "_if2c",              :limit => 50
    t.string   "_if3c",              :limit => 50
    t.string   "_if4c",              :limit => 50
    t.text     "_if5",               :limit => 2147483647
    t.text     "_if6",               :limit => 2147483647
    t.integer  "_ch1"
    t.integer  "_ch2"
    t.integer  "_ch3"
    t.integer  "_ch4"
    t.integer  "_ch5"
    t.string   "_ch1c",              :limit => 50
    t.string   "_ch2c",              :limit => 50
    t.string   "_ch3c",              :limit => 50
    t.string   "_ch4c",              :limit => 50
    t.string   "_ch5c",              :limit => 50
    t.text     "_ch6",               :limit => 2147483647
    t.text     "_ch7",               :limit => 2147483647
    t.text     "_ch8",               :limit => 2147483647
    t.integer  "_ew1"
    t.integer  "_ew2"
    t.integer  "_ew3"
    t.integer  "_ew4"
    t.integer  "_ew5"
    t.string   "_ew1c",              :limit => 50
    t.string   "_ew2c",              :limit => 50
    t.string   "_ew3c",              :limit => 50
    t.string   "_ew4c",              :limit => 50
    t.string   "_ew5c",              :limit => 50
    t.text     "_ew6",               :limit => 2147483647
    t.boolean  "_ew7"
    t.text     "_ew8",               :limit => 2147483647
    t.boolean  "_ew9"
    t.text     "_ew10",              :limit => 2147483647
    t.integer  "_ms1"
    t.integer  "_ms2"
    t.integer  "_ms3"
    t.integer  "_ms4"
    t.string   "_ms1c",              :limit => 50
    t.string   "_ms2c",              :limit => 50
    t.string   "_ms3c",              :limit => 50
    t.string   "_ms4c",              :limit => 50
    t.text     "_ms5",               :limit => 2147483647
    t.integer  "_ls1"
    t.integer  "_ls2"
    t.integer  "_ls3"
    t.integer  "_ls4"
    t.integer  "_ls5"
    t.string   "_ls1c",              :limit => 50
    t.string   "_ls2c",              :limit => 50
    t.string   "_ls3c",              :limit => 50
    t.string   "_ls4c",              :limit => 50
    t.string   "_ls5c",              :limit => 50
    t.text     "_ls6",               :limit => 2147483647
    t.text     "_ls7",               :limit => 2147483647
    t.text     "_ls8",               :limit => 2147483647
    t.text     "_re1",               :limit => 2147483647
    t.text     "_re2",               :limit => 2147483647
    t.text     "_re3",               :limit => 2147483647
    t.integer  "_re4"
    t.text     "_re5",               :limit => 2147483647
    t.integer  "fk_SIApplicationID"
  end

  add_index "hr_si_reference_2005_deprecated", ["fk_SIApplicationID"], :name => "fk_SIApplicationID"

  create_table "hr_si_reference_2006_deprecated", :primary_key => "referenceID", :force => true do |t|
    t.string   "formWorkflowStatus", :limit => 1
    t.datetime "createDate"
    t.datetime "lastChangedDate"
    t.string   "lastChangedBy",      :limit => 30
    t.boolean  "isFormSubmitted"
    t.datetime "formSubmittedDate"
    t.string   "referenceType",      :limit => 2
    t.string   "title",              :limit => 5
    t.string   "firstName",          :limit => 30
    t.string   "lastName",           :limit => 30
    t.boolean  "isStaff"
    t.string   "staffNumber",        :limit => 16
    t.string   "currentAddress1",    :limit => 35
    t.string   "currentAddress2",    :limit => 35
    t.string   "currentCity",        :limit => 35
    t.string   "currentState",       :limit => 6
    t.string   "currentZip",         :limit => 10
    t.string   "cellPhone",          :limit => 24
    t.string   "homePhone",          :limit => 24
    t.string   "workPhone",          :limit => 24
    t.string   "currentEmail",       :limit => 50
    t.string   "howKnown",           :limit => 64
    t.string   "howLongKnown",       :limit => 64
    t.integer  "howWellKnown"
    t.integer  "howWellComm"
    t.integer  "_rg1"
    t.integer  "_rg2"
    t.integer  "_rg3"
    t.integer  "_rg4"
    t.integer  "_rg5"
    t.string   "_rg1c",              :limit => 50
    t.string   "_rg2c",              :limit => 50
    t.string   "_rg3c",              :limit => 50
    t.string   "_rg4c",              :limit => 50
    t.string   "_rg5c",              :limit => 50
    t.text     "_rg6",               :limit => 2147483647
    t.boolean  "_rg7"
    t.text     "_rg8",               :limit => 2147483647
    t.text     "_rg9",               :limit => 2147483647
    t.integer  "_ro1"
    t.integer  "_ro2"
    t.integer  "_ro3"
    t.integer  "_ro4"
    t.integer  "_ro5"
    t.integer  "_ro6"
    t.integer  "_ro7"
    t.string   "_ro1c",              :limit => 50
    t.string   "_ro2c",              :limit => 50
    t.string   "_ro3c",              :limit => 50
    t.string   "_ro4c",              :limit => 50
    t.string   "_ro5c",              :limit => 50
    t.string   "_ro6c",              :limit => 50
    t.string   "_ro7c",              :limit => 50
    t.text     "_ro8",               :limit => 2147483647
    t.text     "_ro9",               :limit => 2147483647
    t.text     "_ro10",              :limit => 2147483647
    t.integer  "_dd1"
    t.integer  "_dd2"
    t.integer  "_dd3"
    t.integer  "_dd4"
    t.string   "_dd1c",              :limit => 50
    t.string   "_dd2c",              :limit => 50
    t.string   "_dd3c",              :limit => 50
    t.string   "_dd4c",              :limit => 50
    t.text     "_dd5",               :limit => 2147483647
    t.text     "_dd6",               :limit => 2147483647
    t.integer  "_if1"
    t.integer  "_if2"
    t.integer  "_if3"
    t.integer  "_if4"
    t.string   "_if1c",              :limit => 50
    t.string   "_if2c",              :limit => 50
    t.string   "_if3c",              :limit => 50
    t.string   "_if4c",              :limit => 50
    t.text     "_if5",               :limit => 2147483647
    t.text     "_if6",               :limit => 2147483647
    t.integer  "_ch1"
    t.integer  "_ch2"
    t.integer  "_ch3"
    t.integer  "_ch4"
    t.integer  "_ch5"
    t.string   "_ch1c",              :limit => 50
    t.string   "_ch2c",              :limit => 50
    t.string   "_ch3c",              :limit => 50
    t.string   "_ch4c",              :limit => 50
    t.string   "_ch5c",              :limit => 50
    t.text     "_ch6",               :limit => 2147483647
    t.text     "_ch7",               :limit => 2147483647
    t.text     "_ch8",               :limit => 2147483647
    t.integer  "_ew1"
    t.integer  "_ew2"
    t.integer  "_ew3"
    t.integer  "_ew4"
    t.integer  "_ew5"
    t.string   "_ew1c",              :limit => 50
    t.string   "_ew2c",              :limit => 50
    t.string   "_ew3c",              :limit => 50
    t.string   "_ew4c",              :limit => 50
    t.string   "_ew5c",              :limit => 50
    t.text     "_ew6",               :limit => 2147483647
    t.boolean  "_ew7"
    t.text     "_ew8",               :limit => 2147483647
    t.boolean  "_ew9"
    t.text     "_ew10",              :limit => 2147483647
    t.integer  "_ms1"
    t.integer  "_ms2"
    t.integer  "_ms3"
    t.integer  "_ms4"
    t.string   "_ms1c",              :limit => 50
    t.string   "_ms2c",              :limit => 50
    t.string   "_ms3c",              :limit => 50
    t.string   "_ms4c",              :limit => 50
    t.text     "_ms5",               :limit => 2147483647
    t.integer  "_ls1"
    t.integer  "_ls2"
    t.integer  "_ls3"
    t.integer  "_ls4"
    t.integer  "_ls5"
    t.string   "_ls1c",              :limit => 50
    t.string   "_ls2c",              :limit => 50
    t.string   "_ls3c",              :limit => 50
    t.string   "_ls4c",              :limit => 50
    t.string   "_ls5c",              :limit => 50
    t.text     "_ls6",               :limit => 2147483647
    t.text     "_ls7",               :limit => 2147483647
    t.text     "_ls8",               :limit => 2147483647
    t.text     "_re1",               :limit => 2147483647
    t.text     "_re2",               :limit => 2147483647
    t.text     "_re3",               :limit => 2147483647
    t.integer  "_re4"
    t.text     "_re5",               :limit => 2147483647
    t.integer  "fk_SIApplicationID"
  end

  add_index "hr_si_reference_2006_deprecated", ["fk_SIApplicationID"], :name => "IX_hr_si_Reference_2006"

  create_table "hr_si_users", :primary_key => "siUserID", :force => true do |t|
    t.integer  "fk_ssmUserID"
    t.string   "role",           :limit => 50
    t.datetime "expirationDate"
  end

  add_index "hr_si_users", ["fk_ssmUserID"], :name => "IX_hr_si_Users_fk_ssmUserID"

  create_table "lat_long_by_zip_code", :force => true do |t|
    t.string  "zip"
    t.decimal "lat",  :precision => 15, :scale => 10
    t.decimal "long", :precision => 15, :scale => 10
  end

  create_table "linczone_contacts", :primary_key => "ContactID", :force => true do |t|
    t.timestamp "EntryDate"
    t.string    "FirstName",            :limit => 120
    t.string    "LastName",             :limit => 120
    t.string    "HomeAddress",          :limit => 200
    t.string    "City",                 :limit => 20
    t.string    "State",                :limit => 20
    t.string    "Zip",                  :limit => 80
    t.string    "Email",                :limit => 120
    t.string    "HighSchool",           :limit => 120
    t.string    "CampusName",           :limit => 200
    t.string    "CampusID",             :limit => 80
    t.string    "ReferrerFirstName",    :limit => 120
    t.string    "ReferrerLastName",     :limit => 120
    t.string    "ReferrerRelationship", :limit => 100
    t.string    "ReferrerEmail",        :limit => 200
    t.string    "InfoCCC",              :limit => 1,   :default => "F"
    t.string    "InfoNav",              :limit => 1,   :default => "F"
    t.string    "InfoIV",               :limit => 1,   :default => "F"
    t.string    "InfoFCA",              :limit => 1,   :default => "F"
    t.string    "InfoBSU",              :limit => 1,   :default => "F"
    t.string    "InfoCACM",             :limit => 1,   :default => "F"
    t.string    "InfoEFCA",             :limit => 1,   :default => "F"
    t.string    "InfoGCM",              :limit => 1,   :default => "F"
    t.string    "InfoWesley",           :limit => 1,   :default => "F"
  end

  create_table "mail_delayed_jobs", :force => true do |t|
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

  create_table "mail_groups", :force => true do |t|
    t.string   "group_id"
    t.string   "group_name"
    t.string   "group_description"
    t.string   "email_permission",               :default => "Domain"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "email_query"
    t.integer  "exists_on_google",  :limit => 1, :default => 0
    t.string   "update_interval"
  end

  add_index "mail_groups", ["group_id"], :name => "index_mail_groups_on_group_id"

  create_table "mail_members", :force => true do |t|
    t.integer  "group_id"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "exception",  :limit => 1, :default => 0
  end

  add_index "mail_members", ["group_id"], :name => "index_mail_members_on_group_id"

  create_table "ministries", :force => true do |t|
    t.string "name"
  end

  create_table "ministry_activity", :primary_key => "ActivityID", :force => true do |t|
    t.string   "status",                   :limit => 2
    t.datetime "periodBegin"
    t.datetime "periodEnd_deprecated"
    t.string   "strategy",                 :limit => 2
    t.string   "transUsername",            :limit => 50
    t.integer  "fk_targetAreaID"
    t.integer  "fk_teamID"
    t.string   "statusHistory_deprecated", :limit => 2
    t.string   "url"
    t.string   "facebook"
    t.integer  "sent_teamID"
  end

  add_index "ministry_activity", ["fk_targetAreaID"], :name => "index1"
  add_index "ministry_activity", ["fk_teamID"], :name => "index2"
  add_index "ministry_activity", ["periodBegin"], :name => "index3"
  add_index "ministry_activity", ["strategy"], :name => "index5"

  create_table "ministry_activity_history", :force => true do |t|
    t.integer  "activity_id",                  :null => false
    t.string   "from_status",    :limit => 2
    t.string   "to_status",      :limit => 2
    t.datetime "period_begin"
    t.datetime "period_end"
    t.string   "trans_username", :limit => 50
    t.string   "fromStrategy"
    t.string   "toStrategy"
  end

  add_index "ministry_activity_history", ["activity_id"], :name => "activity_id"
  add_index "ministry_activity_history", ["period_begin"], :name => "period_begin"
  add_index "ministry_activity_history", ["toStrategy"], :name => "toStrategy"
  add_index "ministry_activity_history", ["to_status"], :name => "to_status"

  create_table "ministry_address", :primary_key => "AddressID", :force => true do |t|
    t.datetime "startdate"
    t.datetime "enddate"
    t.string   "address1",  :limit => 60
    t.string   "address2",  :limit => 60
    t.string   "address3",  :limit => 60
    t.string   "address4",  :limit => 60
    t.string   "city",      :limit => 35
    t.string   "state",     :limit => 6
    t.string   "zip",       :limit => 10
    t.string   "country",   :limit => 64
  end

  create_table "ministry_assoc_activitycontact", :id => false, :force => true do |t|
    t.integer "ActivityID",                                 :null => false
    t.string  "accountNo",  :limit => 11,                   :null => false
    t.boolean "dbioDummy",                :default => true, :null => false
  end

  create_table "ministry_assoc_dependents", :id => false, :force => true do |t|
    t.integer "DependentID",                                 :null => false
    t.string  "accountNo",   :limit => 11,                   :null => false
    t.boolean "dbioDummy",                 :default => true, :null => false
  end

  create_table "ministry_assoc_otherministries", :id => false, :force => true do |t|
    t.string  "NonCccMinID",  :limit => 64,                   :null => false
    t.string  "TargetAreaID", :limit => 64,                   :null => false
    t.boolean "dbioDummy",                  :default => true, :null => false
  end

  create_table "ministry_authorization", :primary_key => "AuthorizationID", :force => true do |t|
    t.datetime "authdate"
    t.string   "role",                 :limit => 30
    t.string   "authorized",           :limit => 1
    t.integer  "sequence"
    t.string   "fk_AuthorizedBy",      :limit => 11
    t.string   "fk_AuthorizationNote", :limit => 64
    t.integer  "fk_changeRequestID"
  end

  add_index "ministry_authorization", ["fk_AuthorizationNote"], :name => "index3"
  add_index "ministry_authorization", ["fk_AuthorizedBy"], :name => "index1"
  add_index "ministry_authorization", ["fk_changeRequestID"], :name => "index2"

  create_table "ministry_changerequest", :primary_key => "ChangeRequestID", :force => true do |t|
    t.datetime "requestdate"
    t.datetime "effectivedate"
    t.datetime "applieddate"
    t.string   "type",           :limit => 30
    t.string   "fk_requestedBy", :limit => 11
    t.string   "updateStaff",    :limit => 11
    t.string   "region",         :limit => 10
  end

  add_index "ministry_changerequest", ["fk_requestedBy"], :name => "index1"

  create_table "ministry_dependent", :primary_key => "DependentID", :force => true do |t|
    t.string   "firstName",  :limit => 80
    t.string   "middleName", :limit => 80
    t.string   "lastName",   :limit => 80
    t.datetime "birthdate"
    t.string   "gender",     :limit => 1
  end

  create_table "ministry_fieldchange", :primary_key => "FieldChangeID", :force => true do |t|
    t.string  "field",              :limit => 30
    t.string  "oldValue"
    t.string  "newValue"
    t.integer "Fk_hasFieldChanges"
  end

  create_table "ministry_involvement", :primary_key => "involvementID", :force => true do |t|
    t.integer "fk_PersonID"
    t.integer "fk_StrategyID"
  end

  create_table "ministry_locallevel", :primary_key => "teamID", :force => true do |t|
    t.string   "name",                   :limit => 100
    t.string   "lane",                   :limit => 10
    t.string   "note"
    t.string   "region",                 :limit => 2
    t.string   "address1",               :limit => 35
    t.string   "address2",               :limit => 35
    t.string   "city",                   :limit => 30
    t.string   "state",                  :limit => 6
    t.string   "zip",                    :limit => 10
    t.string   "country",                :limit => 64
    t.string   "phone",                  :limit => 24
    t.string   "fax",                    :limit => 24
    t.string   "email",                  :limit => 50
    t.string   "url"
    t.string   "isActive",               :limit => 1
    t.datetime "startdate"
    t.datetime "stopdate"
    t.string   "Fk_OrgRel",              :limit => 64
    t.string   "no",                     :limit => 2
    t.string   "abbrv",                  :limit => 2
    t.string   "hasMultiRegionalAccess"
    t.string   "dept_id"
  end

  create_table "ministry_missional_team_member", :force => true do |t|
    t.integer "personID"
    t.integer "teamID"
    t.boolean "is_people_soft"
    t.boolean "is_leader"
  end

  create_table "ministry_movement_contact", :force => true do |t|
    t.integer "personID"
    t.integer "ActivityID"
  end

  add_index "ministry_movement_contact", ["ActivityID"], :name => "ActivityID"
  add_index "ministry_movement_contact", ["personID"], :name => "personID"

  create_table "ministry_newaddress", :primary_key => "addressID", :force => true do |t|
    t.string   "deprecated_startDate", :limit => 25
    t.string   "deprecated_endDate",   :limit => 25
    t.string   "address1",             :limit => 55
    t.string   "address2",             :limit => 55
    t.string   "address3",             :limit => 55
    t.string   "address4",             :limit => 55
    t.string   "city",                 :limit => 50
    t.string   "state",                :limit => 50
    t.string   "zip",                  :limit => 15
    t.string   "country",              :limit => 64
    t.string   "homePhone",            :limit => 25
    t.string   "workPhone",            :limit => 25
    t.string   "cellPhone",            :limit => 25
    t.string   "fax",                  :limit => 25
    t.string   "email",                :limit => 200
    t.string   "url",                  :limit => 100
    t.string   "contactName",          :limit => 50
    t.string   "contactRelationship",  :limit => 50
    t.string   "addressType",          :limit => 20
    t.datetime "dateCreated"
    t.datetime "dateChanged"
    t.string   "createdBy",            :limit => 50
    t.string   "changedBy",            :limit => 50
    t.integer  "fk_PersonID"
    t.string   "email2",               :limit => 200
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "facebook_link"
    t.string   "myspace_link"
    t.string   "title"
    t.string   "dorm"
    t.string   "room"
    t.string   "preferredPhone",       :limit => 25
    t.string   "phone1_type",                         :default => "cell"
    t.string   "phone2_type",                         :default => "home"
    t.string   "phone3_type",                         :default => "work"
  end

  add_index "ministry_newaddress", ["addressType", "fk_PersonID"], :name => "unique_person_addressType", :unique => true
  add_index "ministry_newaddress", ["addressType"], :name => "index_ministry_newAddress_on_addressType"
  add_index "ministry_newaddress", ["email"], :name => "email"
  add_index "ministry_newaddress", ["fk_PersonID"], :name => "fk_PersonID"

  create_table "ministry_newaddress_restore", :primary_key => "addressID", :force => true do |t|
    t.string   "deprecated_startDate", :limit => 25
    t.string   "deprecated_endDate",   :limit => 25
    t.string   "address1",             :limit => 55
    t.string   "address2",             :limit => 55
    t.string   "address3",             :limit => 55
    t.string   "address4",             :limit => 55
    t.string   "city",                 :limit => 50
    t.string   "state",                :limit => 50
    t.string   "zip",                  :limit => 15
    t.string   "country",              :limit => 64
    t.string   "homePhone",            :limit => 25
    t.string   "workPhone",            :limit => 25
    t.string   "cellPhone",            :limit => 25
    t.string   "fax",                  :limit => 25
    t.string   "email",                :limit => 200
    t.string   "url",                  :limit => 100
    t.string   "contactName",          :limit => 50
    t.string   "contactRelationship",  :limit => 50
    t.string   "addressType"
    t.datetime "dateCreated"
    t.datetime "dateChanged"
    t.string   "createdBy",            :limit => 50
    t.string   "changedBy",            :limit => 50
    t.string   "fk_PersonID"
    t.string   "email2",               :limit => 200
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "facebook_link"
    t.string   "myspace_link"
    t.string   "title"
    t.string   "dorm"
    t.string   "room"
  end

  add_index "ministry_newaddress_restore", ["addressType", "fk_PersonID"], :name => "unique_person_addressType", :unique => true
  add_index "ministry_newaddress_restore", ["addressType"], :name => "index_ministry_newaddress_restore_on_addressType"
  add_index "ministry_newaddress_restore", ["email"], :name => "email"
  add_index "ministry_newaddress_restore", ["fk_PersonID"], :name => "fk_PersonID"

  create_table "ministry_noncccmin", :primary_key => "NonCccMinID", :force => true do |t|
    t.string "ministry",    :limit => 50
    t.string "firstName",   :limit => 30
    t.string "lastName",    :limit => 30
    t.string "address1",    :limit => 35
    t.string "address2",    :limit => 35
    t.string "city",        :limit => 30
    t.string "state",       :limit => 6
    t.string "zip",         :limit => 10
    t.string "country",     :limit => 64
    t.string "homePhone",   :limit => 24
    t.string "workPhone",   :limit => 24
    t.string "mobilePhone", :limit => 24
    t.string "email",       :limit => 80
    t.string "url",         :limit => 50
    t.string "pager",       :limit => 24
    t.string "fax",         :limit => 24
    t.string "note"
  end

  create_table "ministry_note", :primary_key => "NoteID", :force => true do |t|
    t.datetime "dateEntered"
    t.string   "title",                :limit => 80
    t.text     "note"
    t.string   "Fk_loaNote",           :limit => 64
    t.string   "Fk_resignationLetter", :limit => 64
    t.string   "Fk_authorizationNote", :limit => 64
  end

  create_table "ministry_person", :primary_key => "personID", :force => true do |t|
    t.string   "accountNo",                     :limit => 11
    t.string   "lastName",                      :limit => 50
    t.string   "firstName",                     :limit => 50
    t.string   "middleName",                    :limit => 50
    t.string   "preferredName",                 :limit => 50
    t.string   "gender",                        :limit => 1
    t.string   "region",                        :limit => 5
    t.boolean  "workInUS",                                            :default => true,  :null => false
    t.boolean  "usCitizen",                                           :default => true,  :null => false
    t.string   "citizenship",                   :limit => 50
    t.boolean  "isStaff"
    t.string   "title",                         :limit => 5
    t.string   "campus",                        :limit => 128
    t.string   "universityState",               :limit => 5
    t.string   "yearInSchool",                  :limit => 20
    t.string   "major",                         :limit => 70
    t.string   "minor",                         :limit => 70
    t.string   "greekAffiliation",              :limit => 50
    t.string   "maritalStatus",                 :limit => 20
    t.string   "numberChildren",                :limit => 2
    t.boolean  "isChild",                                             :default => false, :null => false
    t.text     "bio",                           :limit => 2147483647
    t.string   "image",                         :limit => 100
    t.string   "occupation",                    :limit => 50
    t.string   "blogfeed",                      :limit => 200
    t.datetime "cruCommonsInvite"
    t.datetime "cruCommonsLastLogin"
    t.datetime "dateCreated"
    t.datetime "dateChanged"
    t.string   "createdBy",                     :limit => 50
    t.string   "changedBy",                     :limit => 50
    t.integer  "fk_ssmUserId"
    t.integer  "fk_StaffSiteProfileID"
    t.integer  "fk_spouseID"
    t.integer  "fk_childOf"
    t.datetime "birth_date"
    t.datetime "date_became_christian"
    t.datetime "graduation_date"
    t.string   "level_of_school"
    t.string   "staff_notes"
    t.string   "donor_number",                  :limit => 11
    t.string   "url",                           :limit => 2000
    t.string   "isSecure",                      :limit => 1
    t.integer  "primary_campus_involvement_id"
    t.integer  "mentor_id"
    t.string   "lastAttended",                  :limit => 20
    t.string   "ministry"
  end

  add_index "ministry_person", ["accountNo"], :name => "accountNo_ministry_Person"
  add_index "ministry_person", ["campus"], :name => "campus"
  add_index "ministry_person", ["firstName"], :name => "firstname_ministry_Person"
  add_index "ministry_person", ["fk_ssmUserId"], :name => "fk_ssmUserId"
  add_index "ministry_person", ["lastName"], :name => "lastname_ministry_Person"
  add_index "ministry_person", ["region"], :name => "region_ministry_Person"

  create_table "ministry_person_aug1", :primary_key => "personID", :force => true do |t|
    t.string   "accountNo",                      :limit => 11
    t.string   "lastName",                       :limit => 50
    t.string   "firstName",                      :limit => 50
    t.string   "middleName",                     :limit => 50
    t.string   "preferredName",                  :limit => 50
    t.string   "gender",                         :limit => 1
    t.string   "deprecated_birthDate",           :limit => 25
    t.string   "deprecated_dateBecameChristian", :limit => 35
    t.string   "region",                         :limit => 5
    t.boolean  "workInUS",                                             :default => true,  :null => false
    t.boolean  "usCitizen",                                            :default => true,  :null => false
    t.string   "citizenship",                    :limit => 50
    t.boolean  "isStaff",                                              :default => false, :null => false
    t.string   "title",                          :limit => 5
    t.string   "campus",                         :limit => 128
    t.string   "universityState",                :limit => 5
    t.string   "yearInSchool",                   :limit => 20
    t.string   "deprecated_graduationDate",      :limit => 25
    t.string   "major",                          :limit => 70
    t.string   "minor",                          :limit => 70
    t.string   "greekAffiliation",               :limit => 50
    t.string   "maritalStatus",                  :limit => 20
    t.string   "numberChildren",                 :limit => 2
    t.boolean  "isChild",                                              :default => false, :null => false
    t.text     "bio",                            :limit => 2147483647
    t.string   "image",                          :limit => 100
    t.string   "occupation",                     :limit => 50
    t.string   "blogfeed",                       :limit => 200
    t.datetime "cruCommonsInvite"
    t.datetime "cruCommonsLastLogin"
    t.datetime "dateCreated"
    t.datetime "dateChanged"
    t.string   "createdBy",                      :limit => 50
    t.string   "changedBy",                      :limit => 50
    t.integer  "fk_ssmUserId"
    t.integer  "fk_StaffSiteProfileID"
    t.integer  "fk_spouseID"
    t.integer  "fk_childOf"
    t.datetime "birth_date"
    t.datetime "date_became_christian"
    t.datetime "graduation_date"
  end

  add_index "ministry_person_aug1", ["accountNo"], :name => "accountNo_ministry_Person"
  add_index "ministry_person_aug1", ["campus"], :name => "campus"
  add_index "ministry_person_aug1", ["firstName"], :name => "firstname_ministry_Person"
  add_index "ministry_person_aug1", ["fk_ssmUserId"], :name => "fk_ssmUserId"
  add_index "ministry_person_aug1", ["lastName"], :name => "lastname_ministry_Person"
  add_index "ministry_person_aug1", ["region"], :name => "region_ministry_Person"

  create_table "ministry_regionalstat", :primary_key => "RegionalStatID", :force => true do |t|
    t.datetime "periodBegin"
    t.datetime "periodEnd"
    t.integer  "nsSc"
    t.integer  "nsWsn"
    t.integer  "nsCat"
    t.integer  "nsIcrD"
    t.integer  "nsIcrI"
    t.integer  "nsIcrE"
    t.integer  "niSc"
    t.integer  "niWsn"
    t.integer  "niCat"
    t.integer  "niIcrD"
    t.integer  "niIcrI"
    t.integer  "niIcrE"
    t.string   "fk_regionalTeamID", :limit => 64
  end

  add_index "ministry_regionalstat", ["fk_regionalTeamID"], :name => "fk_regionalTeamID"

  create_table "ministry_regionalteam", :primary_key => "teamID", :force => true do |t|
    t.string   "name",      :limit => 100
    t.string   "note"
    t.string   "region",    :limit => 2
    t.string   "address1",  :limit => 35
    t.string   "address2",  :limit => 35
    t.string   "city",      :limit => 30
    t.string   "state",     :limit => 6
    t.string   "zip",       :limit => 10
    t.string   "country",   :limit => 64
    t.string   "phone",     :limit => 24
    t.string   "fax",       :limit => 24
    t.string   "email",     :limit => 50
    t.string   "url"
    t.string   "isActive",  :limit => 1
    t.datetime "startdate"
    t.datetime "stopdate"
    t.string   "no",        :limit => 80
    t.string   "abbrv",     :limit => 80
    t.string   "hrd",       :limit => 50
    t.string   "spPhone",   :limit => 24
  end

  create_table "ministry_staff", :force => true do |t|
    t.string   "accountNo",                :limit => 11,                    :null => false
    t.string   "firstName",                :limit => 30
    t.string   "middleInitial",            :limit => 1
    t.string   "lastName",                 :limit => 30
    t.string   "isMale",                   :limit => 1
    t.string   "position",                 :limit => 30
    t.string   "countryStatus",            :limit => 10
    t.string   "jobStatus",                :limit => 60
    t.string   "ministry",                 :limit => 35
    t.string   "strategy",                 :limit => 20
    t.string   "isNewStaff",               :limit => 1
    t.string   "primaryEmpLocState",       :limit => 6
    t.string   "primaryEmpLocCountry",     :limit => 64
    t.string   "primaryEmpLocCity",        :limit => 35
    t.string   "primaryEmpLocDesc",        :limit => 128
    t.string   "spouseFirstName",          :limit => 22
    t.string   "spouseMiddleName",         :limit => 15
    t.string   "spouseLastName",           :limit => 30
    t.string   "spouseAccountNo",          :limit => 11
    t.string   "spouseEmail",              :limit => 50
    t.string   "fianceeFirstName",         :limit => 15
    t.string   "fianceeMiddleName",        :limit => 15
    t.string   "fianceeLastName",          :limit => 30
    t.string   "fianceeAccountno",         :limit => 11
    t.string   "isFianceeStaff",           :limit => 1
    t.datetime "fianceeJoinStaffDate"
    t.string   "isFianceeJoiningNS",       :limit => 1
    t.string   "joiningNS",                :limit => 1
    t.string   "homePhone",                :limit => 24
    t.string   "workPhone",                :limit => 24
    t.string   "mobilePhone",              :limit => 24
    t.string   "pager",                    :limit => 24
    t.string   "email",                    :limit => 50
    t.string   "isEmailSecure",            :limit => 1
    t.string   "url"
    t.datetime "newStaffTrainingdate"
    t.string   "fax",                      :limit => 24
    t.string   "note",                     :limit => 2048
    t.string   "region",                   :limit => 10
    t.string   "countryCode",              :limit => 3
    t.string   "ssn",                      :limit => 9
    t.string   "maritalStatus",            :limit => 1
    t.string   "deptId",                   :limit => 10
    t.string   "jobCode",                  :limit => 6
    t.string   "accountCode",              :limit => 25
    t.string   "compFreq",                 :limit => 1
    t.string   "compRate",                 :limit => 20
    t.string   "compChngAmt",              :limit => 21
    t.string   "jobTitle",                 :limit => 80
    t.string   "deptName",                 :limit => 30
    t.string   "coupleTitle",              :limit => 12
    t.string   "otherPhone",               :limit => 24
    t.string   "preferredName",            :limit => 50
    t.string   "namePrefix",               :limit => 4
    t.datetime "origHiredate"
    t.datetime "birthDate"
    t.datetime "marriageDate"
    t.datetime "hireDate"
    t.datetime "rehireDate"
    t.datetime "loaStartDate"
    t.datetime "loaEndDate"
    t.string   "loaReason",                :limit => 80
    t.integer  "severancePayMonthsReq"
    t.datetime "serviceDate"
    t.datetime "lastIncDate"
    t.datetime "jobEntryDate"
    t.datetime "deptEntryDate"
    t.datetime "reportingDate"
    t.string   "employmentType",           :limit => 20
    t.string   "resignationReason",        :limit => 80
    t.datetime "resignationDate"
    t.string   "contributionsToOtherAcct", :limit => 1
    t.string   "contributionsToAcntName",  :limit => 80
    t.string   "contributionsToAcntNo",    :limit => 11
    t.integer  "fk_primaryAddress"
    t.integer  "fk_secondaryAddress"
    t.integer  "fk_teamID"
    t.string   "isSecure",                 :limit => 1
    t.string   "isSupported",              :limit => 1
    t.string   "removedFromPeopleSoft",    :limit => 1,    :default => "N"
    t.string   "isNonUSStaff",             :limit => 1
    t.integer  "person_id"
  end

  add_index "ministry_staff", ["accountNo"], :name => "accountNo", :unique => true
  add_index "ministry_staff", ["firstName"], :name => "index_ministry_staff_on_firstName"
  add_index "ministry_staff", ["fk_primaryAddress"], :name => "index2"
  add_index "ministry_staff", ["fk_secondaryAddress"], :name => "index3"
  add_index "ministry_staff", ["fk_teamID"], :name => "index1"
  add_index "ministry_staff", ["lastName"], :name => "index4"
  add_index "ministry_staff", ["person_id"], :name => "ministry_staff_person_id_index"
  add_index "ministry_staff", ["region"], :name => "index5"

  create_table "ministry_staffchangerequest", :primary_key => "ChangeRequestID", :force => true do |t|
    t.string "updateStaff", :limit => 64
  end

  create_table "ministry_statistic", :primary_key => "StatisticID", :force => true do |t|
    t.datetime "periodBegin"
    t.datetime "periodEnd"
    t.integer  "exposures"
    t.integer  "exposuresViaMedia"
    t.integer  "evangelisticOneOnOne"
    t.integer  "evangelisticGroup"
    t.integer  "decisions"
    t.integer  "attendedLastConf"
    t.integer  "invldNewBlvrs"
    t.integer  "invldStudents"
    t.integer  "invldFreshmen"
    t.integer  "invldSophomores"
    t.integer  "invldJuniors"
    t.integer  "invldSeniors"
    t.integer  "invldGrads"
    t.integer  "studentLeaders"
    t.integer  "volunteers"
    t.integer  "staff"
    t.integer  "nonStaffStint"
    t.integer  "staffStint"
    t.integer  "fk_Activity"
    t.integer  "multipliers"
    t.integer  "laborersSent"
    t.integer  "decisionsHelpedByMedia"
    t.integer  "decisionsHelpedByOneOnOne"
    t.integer  "decisionsHelpedByGroup"
    t.integer  "decisionsHelpedByOngoingReln"
    t.integer  "ongoingEvangReln"
    t.string   "updated_by"
    t.datetime "updated_at"
    t.string   "peopleGroup"
    t.integer  "holySpiritConversations"
    t.integer  "dollars_raised"
  end

  add_index "ministry_statistic", ["fk_Activity"], :name => "index1"
  add_index "ministry_statistic", ["periodBegin"], :name => "index2"
  add_index "ministry_statistic", ["periodEnd", "fk_Activity", "peopleGroup"], :name => "activityWeekPeopleGroup", :unique => true
  add_index "ministry_statistic", ["periodEnd"], :name => "index3"

  create_table "ministry_strategy", :primary_key => "strategyID", :force => true do |t|
    t.string "name"
    t.string "abreviation"
  end

  create_table "ministry_targetarea", :primary_key => "targetAreaID", :force => true do |t|
    t.string   "name",                   :limit => 100
    t.string   "address1",               :limit => 35
    t.string   "address2",               :limit => 35
    t.string   "city",                   :limit => 30
    t.string   "state",                  :limit => 32
    t.string   "zip",                    :limit => 10
    t.string   "country",                :limit => 64
    t.string   "phone",                  :limit => 24
    t.string   "fax",                    :limit => 24
    t.string   "email",                  :limit => 50
    t.string   "url"
    t.string   "abbrv",                  :limit => 32
    t.string   "fice",                   :limit => 32
    t.string   "mainCampusFice",         :limit => 32
    t.string   "isNoFiceOK",             :limit => 1
    t.string   "note"
    t.string   "altName",                :limit => 100
    t.string   "isSecure",               :limit => 1
    t.string   "isClosed",               :limit => 1
    t.string   "region"
    t.string   "mpta",                   :limit => 30
    t.string   "urlToLogo"
    t.string   "enrollment",             :limit => 10
    t.string   "monthSchoolStarts",      :limit => 10
    t.string   "monthSchoolStops",       :limit => 10
    t.string   "isSemester",             :limit => 1
    t.string   "isApproved",             :limit => 1
    t.string   "aoaPriority",            :limit => 10
    t.string   "aoa",                    :limit => 100
    t.string   "ciaUrl"
    t.string   "infoUrl"
    t.string   "calendar",               :limit => 50
    t.string   "program1",               :limit => 50
    t.string   "program2",               :limit => 50
    t.string   "program3",               :limit => 50
    t.string   "program4",               :limit => 50
    t.string   "program5",               :limit => 50
    t.string   "emphasis",               :limit => 50
    t.string   "sex",                    :limit => 50
    t.string   "institutionType",        :limit => 50
    t.string   "highestOffering",        :limit => 65
    t.string   "affiliation",            :limit => 50
    t.string   "carnegieClassification", :limit => 100
    t.string   "irsStatus",              :limit => 50
    t.integer  "establishedDate"
    t.integer  "tuition"
    t.datetime "modified"
    t.string   "eventType",              :limit => 2
    t.integer  "eventKeyID"
    t.string   "type",                   :limit => 20
    t.string   "county"
  end

  add_index "ministry_targetarea", ["country"], :name => "index4"
  add_index "ministry_targetarea", ["isApproved"], :name => "index2"
  add_index "ministry_targetarea", ["isClosed"], :name => "index7"
  add_index "ministry_targetarea", ["isSecure"], :name => "index5"
  add_index "ministry_targetarea", ["name"], :name => "index1"
  add_index "ministry_targetarea", ["region"], :name => "index6"
  add_index "ministry_targetarea", ["state"], :name => "index3"

  create_table "ministry_viewactivitycontacts", :id => false, :force => true do |t|
    t.string   "accountNo",                :limit => 11,                    :null => false
    t.string   "firstName",                :limit => 30
    t.string   "middleInitial",            :limit => 1
    t.string   "lastName",                 :limit => 30
    t.string   "isMale",                   :limit => 1
    t.string   "position",                 :limit => 30
    t.string   "countryStatus",            :limit => 10
    t.string   "jobStatus",                :limit => 60
    t.string   "ministry",                 :limit => 35
    t.string   "strategy",                 :limit => 20
    t.string   "isNewStaff",               :limit => 1
    t.string   "primaryEmpLocState",       :limit => 6
    t.string   "primaryEmpLocCountry",     :limit => 64
    t.string   "primaryEmpLocCity",        :limit => 35
    t.string   "spouseFirstName",          :limit => 22
    t.string   "spouseMiddleName",         :limit => 15
    t.string   "spouseLastName",           :limit => 30
    t.string   "spouseAccountNo",          :limit => 11
    t.string   "spouseEmail",              :limit => 50
    t.string   "fianceeFirstName",         :limit => 15
    t.string   "fianceeMiddleName",        :limit => 15
    t.string   "fianceeLastName",          :limit => 30
    t.string   "isFianceeStaff",           :limit => 1
    t.datetime "fianceeJoinStaffDate"
    t.string   "isFianceeJoiningNS",       :limit => 1
    t.string   "joiningNS",                :limit => 1
    t.string   "homePhone",                :limit => 24
    t.string   "workPhone",                :limit => 24
    t.string   "mobilePhone",              :limit => 24
    t.string   "pager",                    :limit => 24
    t.string   "email",                    :limit => 50
    t.string   "isEmailSecure",            :limit => 1
    t.string   "url"
    t.datetime "newStaffTrainingdate"
    t.string   "fax",                      :limit => 24
    t.string   "note",                     :limit => 2048
    t.string   "region",                   :limit => 10
    t.string   "countryCode",              :limit => 3
    t.string   "ssn",                      :limit => 9
    t.string   "maritalStatus",            :limit => 1
    t.string   "deptId",                   :limit => 10
    t.string   "jobCode",                  :limit => 6
    t.string   "accountCode",              :limit => 25
    t.string   "compFreq",                 :limit => 1
    t.string   "compRate",                 :limit => 20
    t.string   "compChngAmt",              :limit => 21
    t.string   "jobTitle",                 :limit => 80
    t.string   "deptName",                 :limit => 30
    t.string   "coupleTitle",              :limit => 12
    t.string   "otherPhone",               :limit => 24
    t.string   "preferredName",            :limit => 50
    t.string   "namePrefix",               :limit => 4
    t.datetime "origHiredate"
    t.datetime "birthDate"
    t.datetime "marriageDate"
    t.datetime "hireDate"
    t.datetime "rehireDate"
    t.datetime "loaStartDate"
    t.datetime "loaEndDate"
    t.string   "loaReason",                :limit => 80
    t.integer  "severancePayMonthsReq"
    t.datetime "serviceDate"
    t.datetime "lastIncDate"
    t.datetime "jobEntryDate"
    t.datetime "deptEntryDate"
    t.datetime "reportingDate"
    t.string   "employmentType",           :limit => 20
    t.string   "resignationReason",        :limit => 80
    t.datetime "resignationDate"
    t.string   "contributionsToOtherAcct", :limit => 1
    t.string   "contributionsToAcntName",  :limit => 80
    t.string   "contributionsToAcntNo",    :limit => 11
    t.integer  "fk_primaryAddress"
    t.integer  "fk_secondaryAddress"
    t.integer  "fk_teamID"
    t.string   "isSecure",                 :limit => 1
    t.string   "isSupported",              :limit => 1
    t.integer  "ActivityID",                                                :null => false
    t.string   "fianceeAccountno",         :limit => 11
    t.string   "removedFromPeopleSoft",    :limit => 1,    :default => "N"
    t.string   "isNonUSStaff",             :limit => 1
    t.string   "primaryEmpLocDesc",        :limit => 128
    t.integer  "person_id"
  end

  create_table "ministry_viewdependentsstaff", :id => false, :force => true do |t|
    t.string   "accountNo",                :limit => 11,                    :null => false
    t.string   "firstName",                :limit => 30
    t.string   "middleInitial",            :limit => 1
    t.string   "lastName",                 :limit => 30
    t.string   "isMale",                   :limit => 1
    t.string   "position",                 :limit => 30
    t.string   "countryStatus",            :limit => 10
    t.string   "jobStatus",                :limit => 60
    t.string   "ministry",                 :limit => 35
    t.string   "strategy",                 :limit => 20
    t.string   "isNewStaff",               :limit => 1
    t.string   "primaryEmpLocState",       :limit => 6
    t.string   "primaryEmpLocCountry",     :limit => 64
    t.string   "primaryEmpLocCity",        :limit => 35
    t.string   "spouseFirstName",          :limit => 22
    t.string   "spouseMiddleName",         :limit => 15
    t.string   "spouseLastName",           :limit => 30
    t.string   "spouseAccountNo",          :limit => 11
    t.string   "spouseEmail",              :limit => 50
    t.string   "fianceeFirstName",         :limit => 15
    t.string   "fianceeMiddleName",        :limit => 15
    t.string   "fianceeLastName",          :limit => 30
    t.string   "isFianceeStaff",           :limit => 1
    t.datetime "fianceeJoinStaffDate"
    t.string   "isFianceeJoiningNS",       :limit => 1
    t.string   "joiningNS",                :limit => 1
    t.string   "homePhone",                :limit => 24
    t.string   "workPhone",                :limit => 24
    t.string   "mobilePhone",              :limit => 24
    t.string   "pager",                    :limit => 24
    t.string   "email",                    :limit => 50
    t.string   "isEmailSecure",            :limit => 1
    t.string   "url"
    t.datetime "newStaffTrainingdate"
    t.string   "fax",                      :limit => 24
    t.string   "note",                     :limit => 2048
    t.string   "region",                   :limit => 10
    t.string   "countryCode",              :limit => 3
    t.string   "ssn",                      :limit => 9
    t.string   "maritalStatus",            :limit => 1
    t.string   "deptId",                   :limit => 10
    t.string   "jobCode",                  :limit => 6
    t.string   "accountCode",              :limit => 25
    t.string   "compFreq",                 :limit => 1
    t.string   "compRate",                 :limit => 20
    t.string   "compChngAmt",              :limit => 21
    t.string   "jobTitle",                 :limit => 80
    t.string   "deptName",                 :limit => 30
    t.string   "coupleTitle",              :limit => 12
    t.string   "otherPhone",               :limit => 24
    t.string   "preferredName",            :limit => 50
    t.string   "namePrefix",               :limit => 4
    t.datetime "origHiredate"
    t.datetime "birthDate"
    t.datetime "marriageDate"
    t.datetime "hireDate"
    t.datetime "rehireDate"
    t.datetime "loaStartDate"
    t.datetime "loaEndDate"
    t.string   "loaReason",                :limit => 80
    t.integer  "severancePayMonthsReq"
    t.datetime "serviceDate"
    t.datetime "lastIncDate"
    t.datetime "jobEntryDate"
    t.datetime "deptEntryDate"
    t.datetime "reportingDate"
    t.string   "employmentType",           :limit => 20
    t.string   "resignationReason",        :limit => 80
    t.datetime "resignationDate"
    t.string   "contributionsToOtherAcct", :limit => 1
    t.string   "contributionsToAcntName",  :limit => 80
    t.string   "contributionsToAcntNo",    :limit => 11
    t.integer  "fk_primaryAddress"
    t.integer  "fk_secondaryAddress"
    t.integer  "fk_teamID"
    t.string   "isSecure",                 :limit => 1
    t.string   "isSupported",              :limit => 1
    t.integer  "DependentID",                                               :null => false
    t.string   "fianceeAccountno",         :limit => 11
    t.string   "removedFromPeopleSoft",    :limit => 1,    :default => "N"
    t.string   "primaryEmpLocDesc",        :limit => 128
  end

  create_table "ministry_viewnoncccmintargetarea", :id => false, :force => true do |t|
    t.string  "NonCccMinID",       :limit => 64,                 :null => false
    t.integer "TargetAreaID",                     :default => 0, :null => false
    t.string  "name",              :limit => 100
    t.string  "address1",          :limit => 35
    t.string  "address2",          :limit => 35
    t.string  "city",              :limit => 30
    t.string  "state",             :limit => 32
    t.string  "zip",               :limit => 10
    t.string  "country",           :limit => 64
    t.string  "phone",             :limit => 24
    t.string  "fax",               :limit => 24
    t.string  "email",             :limit => 50
    t.string  "url"
    t.string  "abbrv",             :limit => 32
    t.string  "fice",              :limit => 32
    t.string  "note"
    t.string  "altName",           :limit => 100
    t.string  "isSecure",          :limit => 1
    t.string  "isClosed",          :limit => 1
    t.string  "region"
    t.string  "mpta",              :limit => 30
    t.string  "urlToLogo"
    t.string  "enrollment",        :limit => 10
    t.string  "monthSchoolStarts", :limit => 10
    t.string  "monthSchoolStops",  :limit => 10
    t.string  "isSemester",        :limit => 1
    t.string  "isApproved",        :limit => 1
    t.string  "aoaPriority",       :limit => 10
    t.string  "aoa",               :limit => 100
    t.string  "ciaUrl"
    t.string  "infoUrl"
  end

  create_table "ministry_viewsortedactivities", :id => false, :force => true do |t|
    t.string   "name",            :limit => 100
    t.string   "url"
    t.string   "facebook"
    t.integer  "ActivityID",                     :default => 0, :null => false
    t.string   "status",          :limit => 2
    t.datetime "periodBegin"
    t.string   "strategy",        :limit => 2
    t.string   "transUsername",   :limit => 50
    t.integer  "fk_teamID"
    t.integer  "fk_targetAreaID"
  end

  create_table "ministry_viewstaffdependents", :id => false, :force => true do |t|
    t.integer  "DependentID",               :default => 0, :null => false
    t.string   "firstName",   :limit => 80
    t.string   "middleName",  :limit => 80
    t.string   "lastName",    :limit => 80
    t.datetime "birthdate"
    t.string   "gender",      :limit => 1
    t.string   "accountNo",   :limit => 11,                :null => false
  end

  create_table "ministry_viewtargetareanoncccmin", :id => false, :force => true do |t|
    t.integer "NonCccMinID",                :default => 0, :null => false
    t.string  "ministry",     :limit => 50
    t.string  "firstName",    :limit => 30
    t.string  "lastName",     :limit => 30
    t.string  "address1",     :limit => 35
    t.string  "address2",     :limit => 35
    t.string  "city",         :limit => 30
    t.string  "state",        :limit => 6
    t.string  "zip",          :limit => 10
    t.string  "country",      :limit => 64
    t.string  "homePhone",    :limit => 24
    t.string  "workPhone",    :limit => 24
    t.string  "mobilePhone",  :limit => 24
    t.string  "email",        :limit => 80
    t.string  "url",          :limit => 50
    t.string  "pager",        :limit => 24
    t.string  "fax",          :limit => 24
    t.string  "note"
    t.string  "TargetAreaID", :limit => 64,                :null => false
  end

  create_table "mpd_contact_actions", :force => true do |t|
    t.integer  "mpd_contact_id"
    t.integer  "event_id"
    t.float    "gift_amount"
    t.boolean  "letter_sent",    :default => false
    t.boolean  "call_made",      :default => false
    t.boolean  "thankyou_sent",  :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mpd_contact_actions", ["event_id"], :name => "event_id"
  add_index "mpd_contact_actions", ["mpd_contact_id", "event_id"], :name => "index_mpd_contact_actions_on_mpd_contact_id_and_event_id", :unique => true
  add_index "mpd_contact_actions", ["mpd_contact_id"], :name => "mpd_contact_id"

  create_table "mpd_contacts", :force => true do |t|
    t.integer  "mpd_user_id"
    t.integer  "mpd_priority_id"
    t.string   "full_name",                     :default => "", :null => false
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip",             :limit => 10
    t.string   "phone",           :limit => 15
    t.string   "email_address"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "salutation"
  end

  add_index "mpd_contacts", ["mpd_priority_id"], :name => "mpd_contacts_mpd_priority_id_index"
  add_index "mpd_contacts", ["mpd_user_id"], :name => "mpd_contacts_mpd_user_id_index"

  create_table "mpd_events", :force => true do |t|
    t.string   "name"
    t.date     "start_date"
    t.integer  "cost"
    t.integer  "mpd_user_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mpd_events", ["mpd_user_id"], :name => "mpd_user_id"
  add_index "mpd_events", ["project_id"], :name => "project_id"

  create_table "mpd_expense_types", :force => true do |t|
    t.string "name",                            :null => false
    t.float  "default_amount", :default => 0.0
  end

  create_table "mpd_expenses", :force => true do |t|
    t.integer "mpd_user_id"
    t.integer "mpd_expense_type_id"
    t.integer "amount",              :default => 0, :null => false
    t.integer "mpd_event_id"
  end

  add_index "mpd_expenses", ["mpd_event_id"], :name => "mpd_event_id"
  add_index "mpd_expenses", ["mpd_expense_type_id"], :name => "mpd_expenses_mpd_expense_type_id_index"
  add_index "mpd_expenses", ["mpd_user_id"], :name => "mpd_expenses_mpd_user_id_index"

  create_table "mpd_letter_images", :force => true do |t|
    t.integer "mpd_letter_id"
    t.string  "image"
    t.integer "parent_id"
    t.string  "content_type"
    t.string  "filename"
    t.string  "thumbnail"
    t.integer "size"
    t.integer "width"
    t.integer "height"
  end

  add_index "mpd_letter_images", ["mpd_letter_id"], :name => "mpd_letter_id"
  add_index "mpd_letter_images", ["parent_id"], :name => "parent_id"

  create_table "mpd_letter_templates", :force => true do |t|
    t.string  "name",                                 :null => false
    t.string  "thumbnail_filename",   :default => ""
    t.string  "pdf_preview_filename", :default => ""
    t.text    "description"
    t.integer "number_of_images",     :default => 0
  end

  create_table "mpd_letters", :force => true do |t|
    t.integer "mpd_letter_template_id"
    t.date    "date"
    t.string  "salutation",             :default => "Dear [[SALUTATION]],"
    t.text    "update_section"
    t.text    "educate_section"
    t.text    "needs_section"
    t.text    "involve_section"
    t.text    "acknowledge_section"
    t.string  "closing",                :default => "Thank you,"
  end

  add_index "mpd_letters", ["mpd_letter_template_id"], :name => "mpd_letters_mpd_letter_template_id_index"

  create_table "mpd_priorities", :force => true do |t|
    t.integer  "mpd_user_id",                 :default => 0,  :null => false
    t.integer  "rateable_id",                 :default => 0,  :null => false
    t.integer  "priority",                    :default => 0
    t.datetime "created_at",                                  :null => false
    t.string   "rateable_type", :limit => 15, :default => "", :null => false
  end

  add_index "mpd_priorities", ["mpd_user_id"], :name => "fk_mpd_priorities_mpd_user"
  add_index "mpd_priorities", ["rateable_id"], :name => "rateable_id"

  create_table "mpd_roles", :force => true do |t|
    t.string "name"
  end

  create_table "mpd_roles_users", :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "mpd_roles_users", ["role_id"], :name => "role_id"
  add_index "mpd_roles_users", ["user_id"], :name => "user_id"

  create_table "mpd_sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mpd_sessions", ["session_id"], :name => "index_mpd_sessions_on_session_id"
  add_index "mpd_sessions", ["updated_at"], :name => "index_mpd_sessions_on_updated_at"

  create_table "mpd_users", :force => true do |t|
    t.integer  "user_id"
    t.integer  "mpd_letter_id"
    t.integer  "mpd_role_id"
    t.datetime "last_login"
    t.string   "type"
    t.boolean  "show_welcome",        :default => true
    t.boolean  "show_follow_up_help", :default => true
    t.boolean  "show_calculator",     :default => true
    t.boolean  "show_thank_help",     :default => true
    t.datetime "created_at"
    t.integer  "current_event_id"
  end

  add_index "mpd_users", ["current_event_id"], :name => "current_event_id"
  add_index "mpd_users", ["mpd_letter_id"], :name => "mpd_users_mpd_letter_id_index"
  add_index "mpd_users", ["mpd_role_id"], :name => "mpd_users_mpd_role_id_index"
  add_index "mpd_users", ["user_id"], :name => "mpd_users_ssm_id_index"

  create_table "nag_users", :force => true do |t|
    t.integer  "ssm_id"
    t.datetime "last_login"
    t.datetime "created_at",                :null => false
    t.integer  "created_by", :default => 0, :null => false
    t.datetime "updated_at"
    t.integer  "updated_by"
  end

  create_table "nags", :force => true do |t|
    t.text   "query"
    t.string "email"
    t.string "subject"
    t.text   "body"
    t.string "emailfield"
    t.text   "userbody"
    t.text   "usersubject"
    t.string "period"
  end

  create_table "old_wsn_sp_wsnapplication", :primary_key => "WsnApplicationID", :force => true do |t|
    t.string   "oldPrimaryKey",                 :limit => 64
    t.string   "surferID",                      :limit => 64
    t.string   "role",                          :limit => 1
    t.string   "region",                        :limit => 2
    t.string   "legalLastName",                 :limit => 50
    t.string   "legalFirstName",                :limit => 50
    t.string   "ssn",                           :limit => 11
    t.string   "currentAddress",                :limit => 50
    t.string   "currentAddress2",               :limit => 35
    t.string   "currentCity",                   :limit => 35
    t.string   "currentState",                  :limit => 6
    t.string   "currentZip",                    :limit => 10
    t.string   "currentPhone",                  :limit => 24
    t.string   "currentEmail",                  :limit => 50
    t.string   "dateAddressGoodUntil",          :limit => 22
    t.string   "birthdate",                     :limit => 22
    t.string   "dateBecameChristian",           :limit => 30
    t.string   "maritalStatus",                 :limit => 22
    t.string   "universityFullName",            :limit => 100
    t.string   "major",                         :limit => 50
    t.string   "yearInSchool",                  :limit => 12
    t.string   "graduationDate",                :limit => 22
    t.string   "earliestAvailableDate",         :limit => 22
    t.string   "dateMustReturn",                :limit => 22
    t.boolean  "willingForDifferentProject",                          :default => true
    t.boolean  "usCitizen",                                           :default => true
    t.string   "citizenship",                   :limit => 50
    t.boolean  "isApplicationComplete",                               :default => false
    t.boolean  "applicationCompleteNote",                             :default => false
    t.string   "projectPref1",                  :limit => 64
    t.string   "projectPref2",                  :limit => 64
    t.string   "projectPref3",                  :limit => 64
    t.string   "projectPref4",                  :limit => 64
    t.string   "projectPref5",                  :limit => 64
    t.string   "applAccountNo",                 :limit => 11
    t.integer  "supportGoal"
    t.integer  "supportReceived"
    t.float    "supportBalance"
    t.boolean  "insuranceReceived",                                   :default => false
    t.boolean  "waiverReceived",                                      :default => false
    t.boolean  "didGo",                                               :default => false
    t.boolean  "participantEvaluation",                               :default => false
    t.string   "destinationGatewayCity",        :limit => 50
    t.string   "gatewayCityToLocationFlightNo", :limit => 50
    t.string   "departGatewayCityToLocation",   :limit => 22
    t.string   "arrivalGatewayCityToLocation",  :limit => 22
    t.string   "locationToGatewayCityFlightNo", :limit => 50
    t.string   "departLocationToGatewayCity",   :limit => 22
    t.string   "arrrivalLocationToGatewayCity", :limit => 22
    t.string   "domesticOrigin",                :limit => 50
    t.string   "domesticOriginToGCFlightNo",    :limit => 50
    t.string   "departDomesticToGatewayCity",   :limit => 22
    t.string   "arrivalDomesticToGatewayCity",  :limit => 22
    t.string   "arrivalAtDomesticOrigin",       :limit => 22
    t.boolean  "travelPlans",                                         :default => false
    t.boolean  "travelDeviation",                                     :default => false
    t.string   "passportNo",                    :limit => 25
    t.string   "passportCountry",               :limit => 50
    t.string   "passportIssueDate",             :limit => 22
    t.string   "passportExpirationDate",        :limit => 22
    t.string   "visaCountry",                   :limit => 50
    t.string   "visaNo",                        :limit => 50
    t.string   "visaType",                      :limit => 50
    t.boolean  "visaIsMultipleEntry",                                 :default => false
    t.string   "visaIssueDate",                 :limit => 22
    t.string   "visaExpirationDate",            :limit => 22
    t.string   "emergName",                     :limit => 50
    t.string   "emergAddress",                  :limit => 50
    t.string   "emergCity",                     :limit => 50
    t.string   "emergState",                    :limit => 6
    t.string   "emergZip",                      :limit => 10
    t.string   "emergPhone",                    :limit => 24
    t.string   "emergWorkPhone",                :limit => 24
    t.string   "emergEmail",                    :limit => 50
    t.string   "gender",                        :limit => 1
    t.string   "dateUpdated",                   :limit => 22
    t.boolean  "isStaff",                                             :default => false
    t.boolean  "prevIsp",                                             :default => false
    t.boolean  "child",                                               :default => false
    t.string   "status",                        :limit => 22
    t.string   "wsnYear",                       :limit => 4
    t.string   "fk_isMember",                   :limit => 64
    t.string   "fk_wsnSpouse",                  :limit => 64
    t.string   "fk_childOf",                    :limit => 64
    t.string   "fk_infobaseID",                 :limit => 64
    t.integer  "fk_ssmUserID"
    t.boolean  "inSchool",                                            :default => true
    t.integer  "weight"
    t.integer  "heightFeet"
    t.integer  "heightInches"
    t.boolean  "participateImpact",                                   :default => false
    t.boolean  "participateDestino",                                  :default => false
    t.boolean  "participateEpic"
    t.datetime "springBreakStart"
    t.datetime "springBreakEnd"
    t.boolean  "isIntern",                                            :default => false
    t.boolean  "_1a",                                                 :default => false
    t.boolean  "_1b",                                                 :default => false
    t.boolean  "_1c",                                                 :default => false
    t.boolean  "_1d",                                                 :default => false
    t.boolean  "_1e",                                                 :default => false
    t.text     "_1f",                           :limit => 2147483647
    t.boolean  "_2a"
    t.text     "_2b",                           :limit => 2147483647
    t.boolean  "_2c"
    t.boolean  "_3a"
    t.boolean  "_3b"
    t.boolean  "_3c"
    t.boolean  "_3d"
    t.boolean  "_3e"
    t.boolean  "_3f"
    t.boolean  "_3g"
    t.text     "_3h",                           :limit => 2147483647
    t.boolean  "_4a"
    t.boolean  "_4b"
    t.boolean  "_4c"
    t.boolean  "_4d"
    t.boolean  "_4e"
    t.boolean  "_4f"
    t.boolean  "_4g"
    t.boolean  "_4h"
    t.text     "_4i",                           :limit => 2147483647
    t.boolean  "_5a"
    t.boolean  "_5b"
    t.boolean  "_5c"
    t.boolean  "_5d"
    t.text     "_5e",                           :limit => 2147483647
    t.boolean  "_5f"
    t.text     "_5g",                           :limit => 2147483647
    t.boolean  "_5h"
    t.text     "_6",                            :limit => 2147483647
    t.text     "_7",                            :limit => 2147483647
    t.text     "_8a",                           :limit => 2147483647
    t.text     "_8b",                           :limit => 2147483647
    t.text     "_9",                            :limit => 2147483647
    t.text     "_10",                           :limit => 2147483647
    t.boolean  "_11a"
    t.text     "_11b",                          :limit => 2147483647
    t.boolean  "_12a"
    t.text     "_12b",                          :limit => 2147483647
    t.boolean  "_13a"
    t.boolean  "_13b"
    t.boolean  "_13c"
    t.text     "_14",                           :limit => 2147483647
    t.boolean  "_15"
    t.integer  "_16"
    t.integer  "_17"
    t.integer  "_18"
    t.boolean  "_19a"
    t.boolean  "_19b"
    t.boolean  "_19c"
    t.boolean  "_19d"
    t.boolean  "_19e"
    t.string   "_19f"
    t.text     "_20a",                          :limit => 2147483647
    t.text     "_20b",                          :limit => 2147483647
    t.text     "_20c",                          :limit => 2147483647
    t.boolean  "_21a"
    t.boolean  "_21b"
    t.boolean  "_21c"
    t.boolean  "_21d"
    t.boolean  "_21e"
    t.boolean  "_21f"
    t.boolean  "_21g"
    t.boolean  "_21h"
    t.text     "_21i",                          :limit => 2147483647
    t.string   "_21j",                          :limit => 1
    t.boolean  "_22a"
    t.text     "_22b",                          :limit => 2147483647
    t.boolean  "_23a"
    t.text     "_23b",                          :limit => 2147483647
    t.boolean  "_24a"
    t.text     "_24b",                          :limit => 2147483647
    t.text     "_25",                           :limit => 2147483647
    t.boolean  "_26a"
    t.text     "_26b",                          :limit => 2147483647
    t.boolean  "_27a"
    t.text     "_27b",                          :limit => 2147483647
    t.boolean  "_28a"
    t.text     "_28b",                          :limit => 2147483647
    t.boolean  "_29a"
    t.text     "_29b",                          :limit => 2147483647
    t.boolean  "_29c"
    t.boolean  "_29d"
    t.text     "_29e",                          :limit => 2147483647
    t.text     "_29f",                          :limit => 2147483647
    t.text     "_30",                           :limit => 2147483647
    t.text     "_31",                           :limit => 2147483647
    t.text     "_32",                           :limit => 2147483647
    t.text     "_33",                           :limit => 2147483647
    t.text     "_34",                           :limit => 2147483647
    t.text     "_35",                           :limit => 2147483647
    t.boolean  "isPaid"
    t.string   "applicationStatus",             :limit => 50
    t.boolean  "isApplyingForStaffInternship"
    t.datetime "createDate"
    t.datetime "lastChangedDate"
    t.string   "lastChangedBy",                 :limit => 30
    t.string   "currentCellPhone",              :limit => 24
    t.string   "emergAddress2",                 :limit => 35
    t.string   "legalMiddleName",               :limit => 50
    t.string   "title",                         :limit => 10
    t.boolean  "isRecruited"
    t.string   "assignedToProject",             :limit => 64
    t.datetime "datePaymentRecieved"
    t.string   "evaluationStatus",              :limit => 50
    t.string   "universityState",               :limit => 2
    t.string   "finalProject",                  :limit => 64
    t.string   "electronicSignature",           :limit => 50
    t.datetime "submittedDate"
    t.datetime "assignedDate"
    t.datetime "dateReferencesDone"
    t.datetime "acceptedDate"
    t.datetime "notAcceptedDate"
    t.datetime "withdrawnDate"
    t.string   "finalWsnProjectID",             :limit => 64
    t.string   "preferredContactMethod",        :limit => 1
    t.string   "howOftenCheckEmail",            :limit => 30
    t.string   "otherClassDetails",             :limit => 30
    t.boolean  "participateOtherProjects"
    t.boolean  "campusHasStaffTeam"
    t.boolean  "campusHasStaffCoach"
    t.boolean  "campusHasMetroTeam"
    t.boolean  "campusHasOther"
    t.string   "campusHasOtherDetails",         :limit => 30
    t.boolean  "inSchoolNextFall"
    t.boolean  "participateCCC"
    t.boolean  "participateNone"
    t.boolean  "ciPhoneCallRequested"
    t.string   "ciPhoneNumber",                 :limit => 24
    t.string   "ciBestTimeToCall",              :limit => 10
    t.string   "ciTimeZone",                    :limit => 10
    t.string   "_26date",                       :limit => 10
    t.string   "appType",                       :limit => 64
    t.integer  "fk_personID"
  end

  add_index "old_wsn_sp_wsnapplication", ["applAccountNo"], :name => "index10"
  add_index "old_wsn_sp_wsnapplication", ["fk_childOf"], :name => "index3"
  add_index "old_wsn_sp_wsnapplication", ["fk_isMember"], :name => "index1"
  add_index "old_wsn_sp_wsnapplication", ["fk_personID"], :name => "fk_personID"
  add_index "old_wsn_sp_wsnapplication", ["fk_wsnSpouse"], :name => "index2"
  add_index "old_wsn_sp_wsnapplication", ["region"], :name => "index11"
  add_index "old_wsn_sp_wsnapplication", ["status"], :name => "index8"
  add_index "old_wsn_sp_wsnapplication", ["wsnYear"], :name => "index9"

  create_table "oncampus_orders", :force => true do |t|
    t.integer  "person_id"
    t.string   "purpose",                    :limit => 100,                          :null => false
    t.string   "payment",                    :limit => 100,                          :null => false
    t.boolean  "format_dvd",                                :default => true,        :null => false
    t.boolean  "format_quicktime",                          :default => false,       :null => false
    t.boolean  "format_flash",                              :default => false,       :null => false
    t.string   "campus",                     :limit => 100,                          :null => false
    t.string   "campus_state",               :limit => 50,                           :null => false
    t.string   "commercial_movement_name",   :limit => 200,                          :null => false
    t.string   "commercial_school_name",     :limit => 200
    t.text     "commercial_additional_info"
    t.boolean  "user_agreement",                            :default => false,       :null => false
    t.string   "status",                     :limit => 20,  :default => "submitted", :null => false
    t.datetime "created_at",                                                         :null => false
    t.string   "commercial_website",         :limit => 300
    t.boolean  "commercial_logo",                           :default => true
    t.string   "color",                      :limit => 20,  :default => "#FFFFFF"
    t.datetime "produced_at"
    t.datetime "shipped_at"
  end

  create_table "oncampus_uses", :force => true do |t|
    t.integer  "order_id",                                             :null => false
    t.string   "type",               :limit => 20,                     :null => false
    t.string   "context",            :limit => 20,                     :null => false
    t.string   "title",              :limit => 150,                    :null => false
    t.datetime "date_start"
    t.datetime "date_end"
    t.boolean  "single_event",                      :default => false, :null => false
    t.boolean  "commercial_frisbee",                :default => false, :null => false
    t.boolean  "commercial_ramen",                  :default => false, :null => false
    t.text     "description",                                          :null => false
    t.text     "feedback",                                             :null => false
  end

  create_table "plugin_schema_info", :id => false, :force => true do |t|
    t.string  "plugin_name"
    t.integer "version"
  end

  create_table "profile_pictures", :force => true do |t|
    t.integer "person_id"
    t.integer "parent_id"
    t.integer "size"
    t.integer "height"
    t.integer "width"
    t.string  "content_type"
    t.string  "filename"
    t.string  "thumbnail"
    t.date    "uploaded_date"
  end

  add_index "profile_pictures", ["person_id"], :name => "index_profile_pictures_on_person_id"

  create_table "questionnaires", :force => true do |t|
    t.string   "title",      :limit => 200
    t.string   "type",       :limit => 50
    t.datetime "created_at"
  end

  create_table "rails_crons", :force => true do |t|
    t.text    "command"
    t.integer "start"
    t.integer "finish"
    t.integer "every"
    t.boolean "concurrent"
  end

  create_table "rideshare_event", :force => true do |t|
    t.integer "conference_id",               :null => false
    t.string  "event_name",    :limit => 50, :null => false
    t.string  "password",      :limit => 50, :null => false
    t.text    "email_content",               :null => false
  end

  create_table "rideshare_ride", :force => true do |t|
    t.integer "event_id",                        :null => false
    t.integer "driver_ride_id",                  :null => false
    t.integer "person_id",                       :null => false
    t.string  "address1",          :limit => 50, :null => false
    t.string  "address2",          :limit => 50, :null => false
    t.string  "address3",          :limit => 50, :null => false
    t.string  "address4",          :limit => 50, :null => false
    t.string  "city",              :limit => 50, :null => false
    t.string  "state",             :limit => 50, :null => false
    t.string  "zip",               :limit => 20, :null => false
    t.string  "country",           :limit => 50, :null => false
    t.float   "latitude"
    t.float   "longitude"
    t.string  "phone",             :limit => 20, :null => false
    t.string  "contact_method",    :limit => 0
    t.integer "number_passengers", :limit => 1,  :null => false
    t.integer "drive_willingness", :limit => 1,  :null => false
    t.time    "depart_time"
    t.text    "special_info",                    :null => false
    t.string  "email",                           :null => false
  end

  add_index "rideshare_ride", ["drive_willingness"], :name => "drivewillingness"
  add_index "rideshare_ride", ["driver_ride_id"], :name => "fk_driverID"
  add_index "rideshare_ride", ["event_id"], :name => "fk_eventID"
  add_index "rideshare_ride", ["person_id"], :name => "fk_personID"

  create_table "school_years", :force => true do |t|
    t.string   "name"
    t.string   "level"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "si_answer_sheets", :force => true do |t|
    t.integer  "question_sheet_id", :null => false
    t.datetime "created_at",        :null => false
    t.datetime "completed_at"
  end

  add_index "si_answer_sheets", ["question_sheet_id"], :name => "question_sheet_id"

  create_table "si_answers", :force => true do |t|
    t.integer "answer_sheet_id", :null => false
    t.integer "question_id",     :null => false
    t.text    "value"
    t.string  "short_value"
  end

  add_index "si_answers", ["answer_sheet_id"], :name => "answer_sheet_id"
  add_index "si_answers", ["question_id"], :name => "question_id"
  add_index "si_answers", ["short_value"], :name => "index_si_answers_on_short_value"

  create_table "si_applies", :force => true do |t|
    t.integer  "sleeve_id",                  :null => false
    t.integer  "applicant_id",               :null => false
    t.string   "status",       :limit => 36, :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "submitted_at"
  end

  add_index "si_applies", ["applicant_id"], :name => "applicant_id"
  add_index "si_applies", ["sleeve_id"], :name => "sleeve_id"
  add_index "si_applies", ["status"], :name => "index_si_applies_on_status"
  add_index "si_applies", ["submitted_at"], :name => "index_si_applies_on_submitted_at"

  create_table "si_apply_sheets", :force => true do |t|
    t.integer "apply_id",        :null => false
    t.integer "sleeve_sheet_id", :null => false
    t.integer "answer_sheet_id", :null => false
  end

  add_index "si_apply_sheets", ["apply_id"], :name => "apply_id"

  create_table "si_character_references", :force => true do |t|
    t.integer  "apply_id",                                      :null => false
    t.integer  "sleeve_sheet_id",                               :null => false
    t.string   "name",                          :default => "", :null => false
    t.string   "email"
    t.string   "phone"
    t.integer  "months_known"
    t.string   "status",          :limit => 36,                 :null => false
    t.string   "token",                                         :null => false
    t.datetime "submitted_at"
    t.datetime "created_at"
    t.datetime "started_at"
    t.datetime "email_sent_at"
  end

  add_index "si_character_references", ["apply_id"], :name => "apply_id"
  add_index "si_character_references", ["token"], :name => "index_si_character_references_on_token"

  create_table "si_conditions", :force => true do |t|
    t.integer "question_sheet_id", :null => false
    t.integer "trigger_id",        :null => false
    t.string  "expression",        :null => false
    t.integer "toggle_page_id",    :null => false
    t.integer "toggle_id"
  end

  add_index "si_conditions", ["trigger_id"], :name => "trigger_id"

  create_table "si_elements", :force => true do |t|
    t.integer "question_sheet_id",                                  :null => false
    t.integer "page_id",                                            :null => false
    t.string  "kind",              :limit => 40,                    :null => false
    t.string  "style",             :limit => 40
    t.string  "label"
    t.text    "content"
    t.boolean "required"
    t.string  "slug",              :limit => 36
    t.integer "position",                                           :null => false
    t.boolean "is_confidential",                 :default => false
    t.string  "source"
    t.string  "value_xpath"
    t.string  "text_xpath"
    t.string  "object_name"
    t.string  "attribute_name"
    t.integer "question_grid_id"
    t.string  "cols"
  end

  add_index "si_elements", ["question_sheet_id", "position", "page_id"], :name => "index_si_elements_on_question_sheet_id_and_position_and_page_id"
  add_index "si_elements", ["slug"], :name => "index_si_elements_on_slug"

  create_table "si_email_templates", :force => true do |t|
    t.string  "name",    :limit => 60, :null => false
    t.text    "content"
    t.boolean "enabled"
    t.string  "subject"
  end

  create_table "si_pages", :force => true do |t|
    t.integer "question_sheet_id",                                  :null => false
    t.string  "label",             :limit => 60,                    :null => false
    t.integer "number",                                             :null => false
    t.boolean "no_cache",                        :default => false
  end

  add_index "si_pages", ["question_sheet_id", "number"], :name => "page_number", :unique => true

  create_table "si_payments", :force => true do |t|
    t.integer  "apply_id",           :null => false
    t.string   "payment_type"
    t.string   "amount"
    t.string   "payment_account_no"
    t.datetime "created_at"
    t.string   "auth_code"
    t.string   "status"
    t.datetime "updated_at"
  end

  add_index "si_payments", ["apply_id"], :name => "apply_id"

  create_table "si_question_sheets", :force => true do |t|
    t.string "label", :limit => 60, :null => false
  end

  create_table "si_roles", :force => true do |t|
    t.string "role",       :null => false
    t.string "user_class", :null => false
  end

  create_table "si_sleeve_sheets", :force => true do |t|
    t.integer "sleeve_id",                       :null => false
    t.integer "question_sheet_id",               :null => false
    t.string  "title",             :limit => 60, :null => false
    t.string  "assign_to",         :limit => 36, :null => false
  end

  create_table "si_sleeves", :force => true do |t|
    t.string  "title",      :limit => 60,                                                :null => false
    t.string  "slug",       :limit => 36
    t.decimal "fee_amount",               :precision => 9, :scale => 2, :default => 0.0
  end

  add_index "si_sleeves", ["slug"], :name => "index_si_sleeves_on_slug", :unique => true

  create_table "si_users", :force => true do |t|
    t.integer  "ssm_id"
    t.datetime "last_login"
    t.datetime "created_at"
    t.integer  "created_by_id"
    t.string   "type"
    t.string   "role"
  end

  add_index "si_users", ["ssm_id"], :name => "ssm_id"

  create_table "simplesecuritymanager_user", :primary_key => "userID", :force => true do |t|
    t.string   "globallyUniqueID",          :limit => 80
    t.string   "username",                  :limit => 80,                     :null => false
    t.string   "email_deprecated",          :limit => 64
    t.string   "password",                  :limit => 80
    t.string   "passwordQuestion",          :limit => 200
    t.string   "passwordAnswer",            :limit => 200
    t.datetime "lastFailure"
    t.integer  "lastFailureCnt"
    t.datetime "lastLogin"
    t.datetime "createdOn"
    t.boolean  "emailVerified",                            :default => false, :null => false
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.boolean  "developer"
    t.string   "facebook_hash"
    t.string   "facebook_username"
  end

  add_index "simplesecuritymanager_user", ["globallyUniqueID"], :name => "globallyUniqueID", :unique => true
  add_index "simplesecuritymanager_user", ["username"], :name => "CK_simplesecuritymanager_user_username", :unique => true

  create_table "sitrack_application_all_deprecated", :primary_key => "applicationID", :force => true do |t|
    t.string   "locationA",                               :limit => 50
    t.string   "locationAExplanation",                    :limit => 90
    t.string   "locationB",                               :limit => 50
    t.string   "locationBExplanation",                    :limit => 90
    t.string   "locationC",                               :limit => 50
    t.string   "locationCExplanation",                    :limit => 90
    t.string   "availableMonth",                          :limit => 2
    t.string   "availableYear",                           :limit => 4
    t.integer  "hasMinistryConflict"
    t.text     "ministryConflictExplanation",             :limit => 2147483647
    t.integer  "hasSpecificLocation"
    t.string   "specificLocationRecruiterName",           :limit => 50
    t.text     "teamMembers",                             :limit => 2147483647
    t.integer  "isDating"
    t.text     "datingLocation",                          :limit => 2147483647
    t.integer  "hasCampusPartnership"
    t.integer  "isDatingStint"
    t.text     "datingStintName",                         :limit => 2147483647
    t.string   "language1",                               :limit => 50
    t.string   "language1YearsStudied",                   :limit => 20
    t.integer  "language1Fluency"
    t.string   "language2",                               :limit => 50
    t.string   "language2YearsStudied",                   :limit => 20
    t.integer  "language2Fluency"
    t.text     "previousMinistryExperience",              :limit => 2147483647
    t.text     "ministryTraining",                        :limit => 2147483647
    t.text     "evangelismAttitude",                      :limit => 2147483647
    t.integer  "isEvangelismTrainable"
    t.text     "participationExplanation",                :limit => 2147483647
    t.integer  "isFamiliarFourSpiritualLaws"
    t.integer  "hasExperienceFourSpiritualLaws"
    t.integer  "confidenceFourSpiritualLaws"
    t.integer  "isFamiliarLifeAtLarge"
    t.integer  "hasExperienceLifeAtLarge"
    t.integer  "confidenceLifeAtLarge"
    t.integer  "isFamiliarPersonalTestimony"
    t.integer  "hasExperiencePersonalTestimony"
    t.integer  "confidencePersonalTestimony"
    t.integer  "isFamiliarExplainingGospel"
    t.integer  "hasExperienceExplainingGospel"
    t.integer  "confidenceExplainingGospel"
    t.integer  "isFamiliarSharingFaith"
    t.integer  "hasExperienceSharingFaith"
    t.integer  "confidenceSharingFaith"
    t.integer  "isFamiliarHolySpiritBooklet"
    t.integer  "hasExperienceHolySpiritBooklet"
    t.integer  "confidenceHolySpiritBooklet"
    t.integer  "isFamiliarFollowUp"
    t.integer  "hasExperienceFollowUp"
    t.integer  "confidenceFollowUp"
    t.integer  "isFamiliarHelpGrowInFaith"
    t.integer  "hasExperienceHelpGrowInFaith"
    t.integer  "confidenceHelpGrowInFaith"
    t.integer  "isFamiliarTrainShareFaith"
    t.integer  "hasExperienceTrainShareFaith"
    t.integer  "confidenceTrainShareFaith"
    t.integer  "isFamiliarOtherReligions"
    t.integer  "hasExperienceOtherReligions"
    t.integer  "confidenceOtherReligions"
    t.text     "leadershipPositions",                     :limit => 2147483647
    t.integer  "hasLedDiscipleshipGroup"
    t.string   "discipleshipGroupSize",                   :limit => 50
    t.text     "leadershipEvaluation",                    :limit => 2147483647
    t.integer  "conversionMonth"
    t.integer  "conversionYear"
    t.string   "memberChurchDenomination",                :limit => 75
    t.string   "memberChurchDuration",                    :limit => 50
    t.string   "attendingChurchDenomination",             :limit => 50
    t.string   "attendingChurchDuration",                 :limit => 50
    t.text     "attendingChurchInvolvement",              :limit => 2147483647
    t.text     "quietTimeQuantity",                       :limit => 2147483647
    t.text     "quietTimeDescription",                    :limit => 2147483647
    t.text     "explanationOfSalvation",                  :limit => 2147483647
    t.text     "explanationOfSpiritFilled",               :limit => 2147483647
    t.integer  "hasInvolvementSpeakingTongues"
    t.text     "differenceIndwellingFilled",              :limit => 2147483647
    t.integer  "hasCrimeConviction"
    t.text     "crimeConvictionExplanation",              :limit => 2147483647
    t.integer  "hasDrugUse"
    t.integer  "isTobaccoUser"
    t.integer  "isWillingChangeHabits"
    t.text     "authorityResponseExplanation",            :limit => 2147483647
    t.text     "alcoholUseFrequency",                     :limit => 2147483647
    t.text     "alcoholUseDecision",                      :limit => 2147483647
    t.integer  "isWillingRefrainAlcohol"
    t.text     "unwillingRefrainAlcoholExplanation",      :limit => 2147483647
    t.text     "drugUseExplanation",                      :limit => 2147483647
    t.text     "tobaccoUseExplanation",                   :limit => 2147483647
    t.integer  "isWillingAbstainTobacco"
    t.integer  "hasRequestedPhoneCall"
    t.string   "contactPhoneNumber",                      :limit => 50
    t.string   "contactBestTime",                         :limit => 50
    t.string   "contactTimeZone",                         :limit => 50
    t.text     "sexualInvolvementExplanation",            :limit => 2147483647
    t.integer  "hasSexualGuidelines"
    t.text     "sexualGuidelineExplanation",              :limit => 2147483647
    t.integer  "isCurrentlyDating"
    t.text     "currentlyDatingLocation",                 :limit => 2147483647
    t.integer  "hasHomosexualInvolvement"
    t.text     "homosexualInvolvementExplanation",        :limit => 2147483647
    t.integer  "hasRecentPornographicInvolvement"
    t.integer  "pornographicInvolvementMonth"
    t.integer  "pornographicInvolvementYear"
    t.text     "pornographicInvolvementExplanation",      :limit => 2147483647
    t.integer  "hasRecentSexualImmorality"
    t.integer  "sexualImmoralityMonth"
    t.integer  "sexualImmoralityYear"
    t.text     "sexualImmoralityExplanation",             :limit => 2147483647
    t.integer  "hasOtherDateSinceImmorality"
    t.text     "singleImmoralityResultsExplanation",      :limit => 2147483647
    t.text     "marriedImmoralityResultsExplanation",     :limit => 2147483647
    t.text     "immoralityLifeChangeExplanation",         :limit => 2147483647
    t.text     "immoralityCurrentStrugglesExplanation",   :limit => 2147483647
    t.text     "additionalMoralComments",                 :limit => 2147483647
    t.integer  "isAwareMustRaiseSupport"
    t.integer  "isInDebt"
    t.string   "debtNature1",                             :limit => 50
    t.string   "debtTotal1",                              :limit => 50
    t.string   "debtMonthlyPayment1",                     :limit => 50
    t.string   "debtNature2",                             :limit => 50
    t.string   "debtTotal2",                              :limit => 50
    t.string   "debtMonthlyPayment2",                     :limit => 50
    t.string   "debtNature3",                             :limit => 50
    t.string   "debtTotal3",                              :limit => 50
    t.string   "debtMonthlyPayment3",                     :limit => 50
    t.integer  "hasOtherFinancialResponsibility"
    t.text     "otherFinancialResponsibilityExplanation", :limit => 2147483647
    t.text     "debtPaymentPlan",                         :limit => 2147483647
    t.text     "debtPaymentTimeframe",                    :limit => 2147483647
    t.text     "developingPartnersExplanation",           :limit => 2147483647
    t.integer  "isWillingDevelopPartners"
    t.text     "unwillingDevelopPartnersExplanation",     :limit => 2147483647
    t.integer  "isCommittedDevelopPartners"
    t.text     "uncommittedDevelopPartnersExplanation",   :limit => 2147483647
    t.text     "personalTestimonyGrowth",                 :limit => 2147483647
    t.text     "internshipParticipationExplanation",      :limit => 2147483647
    t.text     "internshipObjectives",                    :limit => 2147483647
    t.text     "currentMinistryDescription",              :limit => 2147483647
    t.text     "personalStrengthA",                       :limit => 2147483647
    t.text     "personalStrengthB",                       :limit => 2147483647
    t.text     "personalStrengthC",                       :limit => 2147483647
    t.text     "personalDevelopmentA",                    :limit => 2147483647
    t.text     "personalDevelopmentB",                    :limit => 2147483647
    t.text     "personalDevelopmentC",                    :limit => 2147483647
    t.text     "personalDescriptionA",                    :limit => 2147483647
    t.text     "personalDescriptionB",                    :limit => 2147483647
    t.text     "personalDescriptionC",                    :limit => 2147483647
    t.text     "familyRelationshipDescription",           :limit => 2147483647
    t.string   "electronicSignature",                     :limit => 90
    t.string   "ssn",                                     :limit => 50
    t.integer  "fk_ssmUserID"
    t.integer  "fk_personID"
    t.boolean  "isPaid"
    t.decimal  "appFee",                                                        :precision => 18, :scale => 0
    t.datetime "dateAppLastChanged"
    t.datetime "dateAppStarted"
    t.datetime "dateSubmitted"
    t.boolean  "isSubmitted"
    t.string   "appStatus",                               :limit => 15
    t.integer  "assignedToProject"
    t.decimal  "finalProject",                                                  :precision => 10, :scale => 0
    t.string   "siYear",                                  :limit => 50
    t.datetime "submitDate"
    t.string   "status",                                  :limit => 22
    t.string   "appType",                                 :limit => 64
  end

  add_index "sitrack_application_all_deprecated", ["fk_personID"], :name => "fk_PersonID"

  create_table "sitrack_children", :force => true do |t|
    t.string   "name",        :limit => 50
    t.datetime "birthday"
    t.string   "passport_no", :limit => 50
    t.integer  "person_id"
  end

  add_index "sitrack_children", ["person_id"], :name => "fk_personID"

  create_table "sitrack_columns", :force => true do |t|
    t.string   "name",              :limit => 30,                  :null => false
    t.string   "column_type",       :limit => 20,                  :null => false
    t.string   "select_clause",     :limit => 7000,                :null => false
    t.string   "where_clause"
    t.string   "update_clause",     :limit => 1000
    t.string   "table_clause",      :limit => 100
    t.integer  "show_in_directory", :limit => 1,    :default => 1, :null => false
    t.integer  "writeable",         :limit => 1,    :default => 1, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "maxlength"
  end

  create_table "sitrack_enum_values", :force => true do |t|
    t.integer "sitrack_column_id",                :null => false
    t.string  "value",             :limit => 100, :null => false
    t.string  "name",              :limit => 100, :null => false
    t.integer "position"
  end

  add_index "sitrack_enum_values", ["sitrack_column_id"], :name => "index_sitrack_enum_values_on_sitrack_column_id"

  create_table "sitrack_feeds", :id => false, :force => true do |t|
    t.string   "feed",        :limit => 50, :null => false
    t.datetime "lastRun",                   :null => false
    t.integer  "numImported"
  end

  add_index "sitrack_feeds", ["lastRun"], :name => "IX_sitrack_Feeds"

  create_table "sitrack_forms", :force => true do |t|
    t.integer  "approver_id",                                     :null => false
    t.string   "type",                            :limit => 50,   :null => false
    t.integer  "current_years_salary"
    t.integer  "previous_years_salary"
    t.integer  "additional_salary"
    t.integer  "adoption"
    t.integer  "counseling"
    t.integer  "childrens_expenses"
    t.integer  "college"
    t.integer  "private_school"
    t.integer  "graduate_studies"
    t.integer  "auto_purchase"
    t.integer  "settling_in_expenses"
    t.integer  "reimbursable_expenses"
    t.integer  "tax_rate"
    t.datetime "date_of_change"
    t.string   "action"
    t.string   "reopen_as",                       :limit => 100
    t.datetime "freeze_start"
    t.datetime "freeze_end"
    t.string   "change_assignment_from_team",     :limit => 100
    t.string   "change_assignment_from_location", :limit => 100
    t.string   "change_assignment_to_team",       :limit => 100
    t.string   "change_assignment_to_location",   :limit => 100
    t.string   "restint_location",                :limit => 100
    t.string   "departure_date_certainty",        :limit => 100
    t.integer  "hours_per_week"
    t.string   "other_explanation",               :limit => 1000
    t.datetime "new_staff_training_date"
    t.string   "payroll_action",                  :limit => 100
    t.string   "payroll_reason",                  :limit => 100
    t.string   "hrd",                             :limit => 100
    t.string   "spouse_name",                     :limit => 100
    t.boolean  "spouse_transitioning"
    t.string   "salary_reason",                   :limit => 1000
    t.integer  "annual_salary"
    t.integer  "hr_si_application_id",                            :null => false
    t.text     "additional_notes"
  end

  create_table "sitrack_mpd", :force => true do |t|
    t.integer  "application_id"
    t.integer  "person_id"
    t.string   "coachName",       :limit => 50
    t.string   "coachPhone",      :limit => 20
    t.string   "coachCell",       :limit => 20
    t.string   "coachEmail",      :limit => 50
    t.integer  "monthlyGoal"
    t.integer  "oneTimeGoal"
    t.integer  "monthlyRaised"
    t.integer  "oneTimeRaised"
    t.integer  "totalGoal"
    t.integer  "totalRaised"
    t.integer  "percentRaised"
    t.datetime "updated_at"
    t.string   "goalYear",        :limit => 4
    t.integer  "salary"
    t.datetime "created_at"
    t.integer  "account_balance"
  end

  add_index "sitrack_mpd", ["application_id"], :name => "fk_applicationID"
  add_index "sitrack_mpd", ["person_id"], :name => "fk_personID"

  create_table "sitrack_queries", :force => true do |t|
    t.string   "name",       :limit => 50
    t.integer  "owner",                            :null => false
    t.text     "persons",    :limit => 2147483647, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sitrack_queries", ["owner"], :name => "owner"

  create_table "sitrack_saved_criteria", :force => true do |t|
    t.string   "name",       :limit => 50
    t.integer  "owner",                                           :null => false
    t.text     "criteria",   :limit => 2147483647,                :null => false
    t.integer  "saved",      :limit => 1,          :default => 0, :null => false
    t.text     "options",    :limit => 16777215
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sitrack_saved_criteria", ["owner"], :name => "owner_sitrack_SavedCriteria"
  add_index "sitrack_saved_criteria", ["saved"], :name => "index_sitrack_saved_criteria_on_saved"

  create_table "sitrack_session_values", :force => true do |t|
    t.integer "sitrack_session_id",                               :null => false
    t.string  "attrib",             :limit => 50
    t.string  "value",                            :default => "", :null => false
  end

  add_index "sitrack_session_values", ["attrib"], :name => "index_sitrack_session_values_on_attrib"
  add_index "sitrack_session_values", ["sitrack_session_id"], :name => "sitrack_session_id"

  create_table "sitrack_sessions", :force => true do |t|
    t.integer  "sitrack_user_id", :default => 0, :null => false
    t.datetime "created_at",                     :null => false
  end

  add_index "sitrack_sessions", ["sitrack_user_id"], :name => "index_sitrack_sessions_on_sitrack_user_id"

  create_table "sitrack_tracking", :force => true do |t|
    t.integer  "application_id"
    t.integer  "person_id"
    t.string   "status",               :limit => 20
    t.string   "internType",           :limit => 20
    t.string   "tenure",               :limit => 50
    t.string   "ssn",                  :limit => 50
    t.integer  "teamLeader",           :limit => 1
    t.string   "caringRegion",         :limit => 50
    t.string   "passportNo",           :limit => 20
    t.string   "asgYear",              :limit => 9
    t.string   "asgTeam",              :limit => 50
    t.string   "asgCity",              :limit => 50
    t.string   "asgState",             :limit => 50
    t.string   "asgCountry",           :limit => 50
    t.string   "asgContinent",         :limit => 50
    t.string   "asgSchool",            :limit => 90
    t.string   "spouseName",           :limit => 50
    t.datetime "departureDate"
    t.datetime "terminationDate"
    t.text     "notes",                :limit => 2147483647
    t.integer  "changedByPerson"
    t.datetime "appReadyDate"
    t.string   "evaluator",            :limit => 50
    t.datetime "evalStartDate"
    t.datetime "preADate"
    t.datetime "medPsychDate"
    t.datetime "finalADate"
    t.text     "placementComments",    :limit => 2147483647
    t.datetime "expectReturnDate"
    t.datetime "confirmReturnDate"
    t.string   "maidenName",           :limit => 50
    t.string   "sendLane",             :limit => 20
    t.datetime "mpdEmailSent"
    t.text     "kickoffNotes",         :limit => 2147483647
    t.datetime "addFormSent"
    t.datetime "updateFormSent"
    t.string   "fieldCoach",           :limit => 50
    t.datetime "medPsychSent"
    t.integer  "needsDebtCheck",       :limit => 1
    t.datetime "acceptanceLetter"
    t.datetime "evalDocsRec"
    t.integer  "oneCard",              :limit => 1
    t.datetime "playbookSent"
    t.string   "kickoffRoomate",       :limit => 50
    t.string   "futurePlan",           :limit => 50
    t.datetime "mpReceived"
    t.datetime "physicalSent"
    t.datetime "physicalReceived"
    t.string   "evalType",             :limit => 10
    t.datetime "preIKWSent"
    t.string   "debt",                 :limit => 50
    t.text     "restint",              :limit => 2147483647
    t.datetime "evalSummary"
    t.datetime "returnDate"
    t.datetime "effectiveChange"
    t.datetime "addForm"
    t.datetime "salaryForm"
    t.datetime "acosForm"
    t.datetime "joinStaffForm"
    t.datetime "readyDate"
    t.datetime "additionalSalaryForm"
    t.string   "miniPref",             :limit => 50
    t.string   "birthCity",            :limit => 50
    t.string   "birthState",           :limit => 50
    t.string   "ikw_location",         :limit => 100
    t.string   "summer_preference",    :limit => 100
    t.string   "summer_assignment",    :limit => 100
    t.string   "trainer"
    t.text     "trainer_contact",      :limit => 16777215
    t.string   "vonage"
    t.string   "website"
    t.integer  "send_dept"
    t.string   "regionOfOrigin",       :limit => 50
  end

  add_index "sitrack_tracking", ["application_id"], :name => "fk_applicationID"
  add_index "sitrack_tracking", ["asgTeam"], :name => "asgTeam"
  add_index "sitrack_tracking", ["caringRegion"], :name => "caringRegion"
  add_index "sitrack_tracking", ["internType"], :name => "interntype"
  add_index "sitrack_tracking", ["person_id"], :name => "fk_personID"
  add_index "sitrack_tracking", ["status"], :name => "status"
  add_index "sitrack_tracking", ["teamLeader"], :name => "teamLeader"
  add_index "sitrack_tracking", ["tenure"], :name => "tenure"

  create_table "sitrack_users", :force => true do |t|
    t.integer  "ssm_id"
    t.datetime "last_login"
    t.datetime "created_at"
    t.integer  "created_by"
    t.datetime "updated_at"
    t.integer  "updated_by"
  end

  add_index "sitrack_users", ["ssm_id"], :name => "index_sitrack_users_on_ssm_id"

  create_table "sitrack_view_columns", :force => true do |t|
    t.integer "sitrack_view_id",   :default => 0, :null => false
    t.integer "sitrack_column_id", :default => 0, :null => false
    t.integer "position",          :default => 0
  end

  add_index "sitrack_view_columns", ["sitrack_column_id"], :name => "sitrack_column_id"
  add_index "sitrack_view_columns", ["sitrack_view_id"], :name => "sitrack_view_id"

  create_table "sitrack_views", :force => true do |t|
    t.integer "sitrack_user_id"
    t.string  "name"
  end

  add_index "sitrack_views", ["sitrack_user_id"], :name => "uuid"

  create_table "sn_campus_involvements", :force => true do |t|
    t.integer "person_id"
    t.integer "campus_id"
    t.integer "ministry_id"
    t.date    "start_date"
    t.date    "end_date"
    t.integer "added_by_id"
    t.date    "graduation_date"
    t.integer "school_year_id"
    t.string  "major"
    t.string  "minor"
  end

  add_index "sn_campus_involvements", ["campus_id"], :name => "index_sn_campus_involvements_on_campus_id"
  add_index "sn_campus_involvements", ["ministry_id"], :name => "index_sn_campus_involvements_on_ministry_id"
  add_index "sn_campus_involvements", ["person_id"], :name => "index_sn_campus_involvements_on_person_id"

  create_table "sn_columns", :force => true do |t|
    t.string   "title"
    t.string   "update_clause"
    t.string   "from_clause"
    t.text     "select_clause"
    t.string   "column_type"
    t.string   "writeable"
    t.string   "join_clause"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "source_model"
    t.string   "source_column"
    t.string   "foreign_key"
  end

  create_table "sn_correspondence_types", :force => true do |t|
    t.string  "name"
    t.integer "overdue_lifespan"
    t.integer "expiry_lifespan"
    t.string  "actions_now_task"
    t.string  "actions_overdue_task"
    t.string  "actions_followup_task"
    t.text    "redirect_params"
    t.string  "redirect_target_id_type"
  end

  create_table "sn_correspondences", :force => true do |t|
    t.integer  "correspondence_type_id"
    t.integer  "person_id"
    t.string   "receipt"
    t.string   "state"
    t.date     "visited"
    t.date     "completed"
    t.date     "overdue_at"
    t.date     "expire_at"
    t.text     "token_params"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sn_correspondences", ["receipt"], :name => "index_sn_correspondences_on_receipt"

  create_table "sn_custom_attributes", :force => true do |t|
    t.integer "ministry_id"
    t.string  "name"
    t.string  "value_type"
    t.string  "description"
    t.string  "type"
  end

  add_index "sn_custom_attributes", ["ministry_id"], :name => "index_sn_custom_attributes_on_ministry_id"
  add_index "sn_custom_attributes", ["type"], :name => "index_sn_custom_attributes_on_type"

  create_table "sn_custom_values", :force => true do |t|
    t.integer "person_id"
    t.integer "custom_attribute_id"
    t.string  "value"
  end

  add_index "sn_custom_values", ["person_id", "custom_attribute_id"], :name => "index_sn_custom_values_on_person_id_and_custom_attribute_id", :unique => true

  create_table "sn_delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.string   "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sn_dorms", :force => true do |t|
    t.integer "campus_id"
    t.string  "name"
    t.date    "created_at"
  end

  add_index "sn_dorms", ["campus_id"], :name => "campus_id"

  create_table "sn_email_templates", :force => true do |t|
    t.integer  "correspondence_type_id"
    t.string   "outcome_type"
    t.string   "subject",                :null => false
    t.string   "from",                   :null => false
    t.string   "bcc"
    t.string   "cc"
    t.text     "body",                   :null => false
    t.text     "template"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sn_emails", :force => true do |t|
    t.string   "salutation",          :default => "Hi"
    t.string   "subject"
    t.text     "body"
    t.text     "people_ids"
    t.text     "missing_address_ids"
    t.integer  "search_id"
    t.integer  "sender_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sn_free_times", :force => true do |t|
    t.integer  "start_time"
    t.integer  "end_time"
    t.integer  "day_of_week"
    t.integer  "timetable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "css_class"
    t.decimal  "weight",       :precision => 4, :scale => 2
  end

  create_table "sn_group_involvements", :force => true do |t|
    t.integer "person_id"
    t.integer "group_id"
    t.string  "level"
    t.boolean "requested"
  end

  add_index "sn_group_involvements", ["person_id", "group_id"], :name => "person_group", :unique => true

  create_table "sn_group_types", :force => true do |t|
    t.integer  "ministry_id"
    t.string   "group_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "mentor_priority"
    t.boolean  "public"
    t.integer  "unsuitability_leader"
    t.integer  "unsuitability_coleader"
    t.integer  "unsuitability_participant"
  end

  create_table "sn_groups", :force => true do |t|
    t.string  "name"
    t.string  "address"
    t.string  "address_2"
    t.string  "city"
    t.string  "state"
    t.string  "zip"
    t.string  "country"
    t.string  "email"
    t.string  "url"
    t.integer "dorm_id"
    t.integer "ministry_id"
    t.integer "campus_id"
    t.integer "start_time"
    t.integer "end_time"
    t.integer "day"
    t.integer "group_type_id"
    t.boolean "needs_approval"
  end

  add_index "sn_groups", ["campus_id"], :name => "index_sn_groups_on_campus_id"
  add_index "sn_groups", ["dorm_id"], :name => "index_sn_groups_on_dorm_id"
  add_index "sn_groups", ["ministry_id"], :name => "index_sn_groups_on_ministry_id"

  create_table "sn_imports", :force => true do |t|
    t.integer  "person_id"
    t.integer  "parent_id"
    t.integer  "size"
    t.integer  "height"
    t.integer  "width"
    t.string   "content_type"
    t.string   "filename"
    t.string   "thumbnail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sn_ministries", :force => true do |t|
    t.integer  "parent_id"
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.string   "phone"
    t.string   "fax"
    t.string   "email"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ministries_count"
  end

  add_index "sn_ministries", ["parent_id"], :name => "index_sn_ministries_on_parent_id"

  create_table "sn_ministry_campuses", :force => true do |t|
    t.integer  "ministry_id"
    t.integer  "campus_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sn_ministry_campuses", ["ministry_id", "campus_id"], :name => "ministry_campus", :unique => true

  create_table "sn_ministry_involvements", :force => true do |t|
    t.integer "person_id"
    t.integer "ministry_id"
    t.date    "start_date"
    t.date    "end_date"
    t.boolean "admin"
    t.integer "ministry_role_id"
    t.integer "responsible_person_id"
  end

  add_index "sn_ministry_involvements", ["ministry_id"], :name => "index_sn_ministry_involvements_on_ministry_id"
  add_index "sn_ministry_involvements", ["person_id", "ministry_id"], :name => "index_sn_ministry_involvements_on_person_id_and_ministry_id"

  create_table "sn_ministry_role_permissions", :force => true do |t|
    t.integer "permission_id"
    t.integer "ministry_role_id"
    t.string  "created_at"
  end

  create_table "sn_ministry_roles", :force => true do |t|
    t.integer  "ministry_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
    t.string   "description"
    t.string   "type"
    t.boolean  "involved"
  end

  add_index "sn_ministry_roles", ["ministry_id"], :name => "index_sn_ministry_roles_on_ministry_id"

  create_table "sn_permissions", :force => true do |t|
    t.string "description"
    t.string "controller"
    t.string "action"
  end

  create_table "sn_searches", :force => true do |t|
    t.integer  "person_id"
    t.text     "options"
    t.text     "query"
    t.text     "tables"
    t.boolean  "saved"
    t.string   "name"
    t.string   "order"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sn_sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sn_sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sn_sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "sn_timetables", :force => true do |t|
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sn_training_answers", :force => true do |t|
    t.integer  "training_question_id"
    t.integer  "person_id"
    t.string   "approved_by"
    t.date     "completed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sn_training_answers", ["person_id"], :name => "index_sn_training_answers_on_person_id"

  create_table "sn_training_categories", :force => true do |t|
    t.string   "name"
    t.integer  "position"
    t.integer  "ministry_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sn_training_categories", ["ministry_id"], :name => "index_sn_training_categories_on_ministry_id"

  create_table "sn_training_question_activations", :force => true do |t|
    t.integer  "ministry_id"
    t.integer  "training_question_id"
    t.boolean  "mandate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sn_training_questions", :force => true do |t|
    t.integer  "ministry_id"
    t.integer  "training_category_id"
    t.string   "activity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sn_training_questions", ["ministry_id"], :name => "index_sn_training_questions_on_ministry_id"
  add_index "sn_training_questions", ["training_category_id"], :name => "index_sn_training_questions_on_training_category_id"

  create_table "sn_user_group_permissions", :force => true do |t|
    t.integer "permission_id"
    t.integer "user_group_id"
    t.string  "created_at"
  end

  create_table "sn_user_groups", :force => true do |t|
    t.string  "name"
    t.date    "created_at"
    t.integer "ministry_id"
  end

  create_table "sn_user_memberships", :force => true do |t|
    t.integer "user_id"
    t.integer "user_group_id"
    t.date    "created_at"
  end

  create_table "sn_view_columns", :force => true do |t|
    t.integer  "view_id"
    t.integer  "column_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sn_view_columns", ["column_id"], :name => "index_sn_view_columns_on_column_id"
  add_index "sn_view_columns", ["view_id", "column_id"], :name => "index_sn_view_columns_on_view_id_and_column_id"

  create_table "sn_views", :force => true do |t|
    t.string  "title",         :limit => 2000
    t.text    "select_clause"
    t.text    "tables_clause"
    t.integer "ministry_id"
    t.boolean "default_view"
  end

  add_index "sn_views", ["ministry_id"], :name => "index_sn_views_on_ministry_id"

  create_table "sp_answers", :force => true do |t|
    t.integer "question_id"
    t.integer "instance_id"
    t.text    "answer"
  end

  add_index "sp_answers", ["instance_id", "question_id"], :name => "question_id", :unique => true

  create_table "sp_applications", :force => true do |t|
    t.integer  "person_id"
    t.integer  "project_id"
    t.integer  "designation_number"
    t.integer  "year"
    t.string   "status",                   :limit => 50
    t.integer  "preference1_id"
    t.integer  "preference2_id"
    t.integer  "preference3_id"
    t.integer  "preference4_id"
    t.integer  "preference5_id"
    t.integer  "current_project_queue_id"
    t.datetime "submitted_at"
    t.datetime "completed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by_id"
    t.integer  "updated_by_id"
    t.integer  "old_id"
    t.boolean  "apply_for_leadership"
    t.datetime "withdrawn_at"
    t.string   "su_code"
    t.boolean  "applicant_notified"
    t.integer  "account_balance"
    t.datetime "accepted_at"
  end

  add_index "sp_applications", ["person_id"], :name => "index_sp_applications_on_person_id"
  add_index "sp_applications", ["year"], :name => "index_sp_applications_on_year"

  create_table "sp_donations", :force => true do |t|
    t.integer "designation_number", :null => false
    t.float   "amount",             :null => false
  end

  add_index "sp_donations", ["designation_number"], :name => "sp_donations_designation_number_index"

  create_table "sp_elements", :force => true do |t|
    t.integer  "parent_id"
    t.string   "type",            :limit => 50
    t.text     "text"
    t.boolean  "is_required"
    t.string   "question_table",  :limit => 50
    t.string   "question_column", :limit => 50
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by_id"
    t.integer  "updated_by_id"
    t.integer  "dependency_id"
    t.integer  "max_length",                    :default => 0, :null => false
    t.boolean  "is_confidential"
  end

  create_table "sp_evaluations", :force => true do |t|
    t.integer "application_id",                        :null => false
    t.integer "spiritual_maturity", :default => 0
    t.integer "teachability",       :default => 0
    t.integer "leadership",         :default => 0
    t.integer "stability",          :default => 0
    t.integer "good_evangelism",    :default => 0
    t.integer "reason",             :default => 0
    t.integer "social_maturity",    :default => 0
    t.integer "ccc_involvement",    :default => 0
    t.boolean "charismatic",        :default => false
    t.boolean "morals",             :default => false
    t.boolean "drugs",              :default => false
    t.boolean "bad_evangelism",     :default => false
    t.boolean "authority",          :default => false
    t.boolean "eating",             :default => false
    t.text    "comments"
  end

  create_table "sp_ministry_focuses", :force => true do |t|
    t.string "name"
  end

  create_table "sp_ministry_focuses_projects", :id => false, :force => true do |t|
    t.integer "sp_project_id"
    t.integer "sp_ministry_focus_id"
  end

  create_table "sp_page_elements", :force => true do |t|
    t.integer  "page_id"
    t.integer  "element_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sp_pages", :force => true do |t|
    t.string   "title",         :limit => 50
    t.string   "url_name",      :limit => 50
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by_id"
    t.integer  "updated_by_id"
    t.boolean  "hidden"
  end

  create_table "sp_payments", :force => true do |t|
    t.integer  "application_id"
    t.string   "payment_type"
    t.string   "amount"
    t.string   "payment_account_no"
    t.datetime "created_at"
    t.string   "auth_code"
    t.string   "status"
    t.datetime "updated_at"
  end

  create_table "sp_project_versions", :force => true do |t|
    t.integer  "pd_id"
    t.integer  "apd_id"
    t.integer  "opd_id"
    t.string   "name",                         :limit => 50
    t.string   "city",                         :limit => 50
    t.string   "state",                        :limit => 50
    t.string   "country",                      :limit => 60
    t.string   "aoa",                          :limit => 50
    t.string   "display_location",             :limit => 100
    t.string   "primary_partner",              :limit => 100
    t.string   "secondary_partner",            :limit => 100
    t.boolean  "partner_region_only"
    t.string   "report_stats_to",              :limit => 50
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "weeks"
    t.integer  "primary_ministry_focus_id"
    t.boolean  "job"
    t.text     "description"
    t.string   "operating_business_unit",      :limit => 50
    t.string   "operating_operating_unit",     :limit => 50
    t.string   "operating_department",         :limit => 50
    t.string   "operating_project",            :limit => 50
    t.string   "operating_designation",        :limit => 50
    t.string   "scholarship_business_unit",    :limit => 50
    t.string   "scholarship_operating_unit",   :limit => 50
    t.string   "scholarship_department",       :limit => 50
    t.string   "scholarship_project",          :limit => 50
    t.string   "scholarship_designation",      :limit => 50
    t.integer  "staff_cost"
    t.integer  "intern_cost"
    t.integer  "student_cost"
    t.string   "departure_city",               :limit => 60
    t.datetime "date_of_departure"
    t.string   "destination_city",             :limit => 60
    t.datetime "date_of_return"
    t.text     "in_country_contact"
    t.string   "project_contact_name",         :limit => 50
    t.string   "project_contact_role",         :limit => 40
    t.string   "project_contact_phone",        :limit => 20
    t.string   "project_contact_email",        :limit => 100
    t.integer  "max_student_men_applicants",                   :default => 0,    :null => false
    t.integer  "max_student_women_applicants",                 :default => 0,    :null => false
    t.integer  "housing_capacity_men"
    t.integer  "housing_capacity_women"
    t.integer  "ideal_staff_men",                              :default => 0,    :null => false
    t.integer  "ideal_staff_women",                            :default => 0,    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by_id"
    t.integer  "updated_by_id"
    t.integer  "current_students_men",                         :default => 0
    t.integer  "current_students_women",                       :default => 0
    t.integer  "current_applicants_men",                       :default => 0
    t.integer  "current_applicants_women",                     :default => 0
    t.integer  "year"
    t.integer  "coordinator_id"
    t.integer  "old_id"
    t.string   "project_status"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "url",                          :limit => 1024
    t.string   "url_title"
    t.string   "ds_project_code",              :limit => 50
    t.integer  "sp_project_id"
    t.boolean  "show_on_website",                              :default => true
    t.datetime "apply_by_date"
    t.integer  "version"
    t.boolean  "use_provided_application",                     :default => true
    t.string   "tertiary_partner"
  end

  add_index "sp_project_versions", ["aoa"], :name => "index_sp_project_versions_on_aoa"
  add_index "sp_project_versions", ["city"], :name => "index_sp_project_versions_on_city"
  add_index "sp_project_versions", ["country"], :name => "index_sp_project_versions_on_country"
  add_index "sp_project_versions", ["end_date"], :name => "index_sp_project_versions_on_end_date"
  add_index "sp_project_versions", ["name"], :name => "index_sp_project_versions_on_name"
  add_index "sp_project_versions", ["primary_ministry_focus_id"], :name => "index_sp_project_versions_on_primary_ministry_focus_id"
  add_index "sp_project_versions", ["primary_partner"], :name => "index_sp_project_versions_on_primary_partner"
  add_index "sp_project_versions", ["secondary_partner"], :name => "index_sp_project_versions_on_secondary_partner"
  add_index "sp_project_versions", ["sp_project_id"], :name => "index_sp_project_versions_on_sp_project_id"
  add_index "sp_project_versions", ["start_date"], :name => "index_sp_project_versions_on_start_date"
  add_index "sp_project_versions", ["year"], :name => "index_sp_project_versions_on_year"

  create_table "sp_projects", :force => true do |t|
    t.integer  "pd_id"
    t.integer  "apd_id"
    t.integer  "opd_id"
    t.string   "name",                         :limit => 50
    t.string   "city",                         :limit => 50
    t.string   "state",                        :limit => 50
    t.string   "country",                      :limit => 60
    t.string   "aoa",                          :limit => 50
    t.string   "display_location",             :limit => 100
    t.string   "primary_partner",              :limit => 100
    t.string   "secondary_partner",            :limit => 100
    t.boolean  "partner_region_only"
    t.string   "report_stats_to",              :limit => 50
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "weeks"
    t.integer  "primary_ministry_focus_id"
    t.boolean  "job"
    t.text     "description"
    t.string   "operating_business_unit",      :limit => 50
    t.string   "operating_operating_unit",     :limit => 50
    t.string   "operating_department",         :limit => 50
    t.string   "operating_project",            :limit => 50
    t.string   "operating_designation",        :limit => 50
    t.string   "scholarship_business_unit",    :limit => 50
    t.string   "scholarship_operating_unit",   :limit => 50
    t.string   "scholarship_department",       :limit => 50
    t.string   "scholarship_project",          :limit => 50
    t.string   "scholarship_designation",      :limit => 50
    t.integer  "staff_cost"
    t.integer  "intern_cost"
    t.integer  "student_cost"
    t.string   "departure_city",               :limit => 60
    t.datetime "date_of_departure"
    t.string   "destination_city",             :limit => 60
    t.datetime "date_of_return"
    t.text     "in_country_contact"
    t.string   "project_contact_name",         :limit => 50
    t.string   "project_contact_role",         :limit => 40
    t.string   "project_contact_phone",        :limit => 20
    t.string   "project_contact_email",        :limit => 100
    t.integer  "max_student_men_applicants",                   :default => 0,    :null => false
    t.integer  "max_student_women_applicants",                 :default => 0,    :null => false
    t.integer  "housing_capacity_men"
    t.integer  "housing_capacity_women"
    t.integer  "ideal_staff_men",                              :default => 0,    :null => false
    t.integer  "ideal_staff_women",                            :default => 0,    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by_id"
    t.integer  "updated_by_id"
    t.integer  "current_students_men",                         :default => 0
    t.integer  "current_students_women",                       :default => 0
    t.integer  "current_applicants_men",                       :default => 0
    t.integer  "current_applicants_women",                     :default => 0
    t.integer  "year"
    t.integer  "coordinator_id"
    t.integer  "old_id"
    t.string   "project_status"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "url",                          :limit => 1024
    t.string   "url_title"
    t.string   "ds_project_code",              :limit => 50
    t.boolean  "show_on_website",                              :default => true
    t.datetime "apply_by_date"
    t.integer  "version"
    t.boolean  "use_provided_application",                     :default => true
    t.string   "tertiary_partner"
  end

  add_index "sp_projects", ["name"], :name => "sp_projects_name_index", :unique => true
  add_index "sp_projects", ["primary_partner"], :name => "primary_partner"
  add_index "sp_projects", ["secondary_partner"], :name => "secondary_partner"

  create_table "sp_question_options", :force => true do |t|
    t.integer  "question_id"
    t.string   "option",      :limit => 50
    t.string   "value",       :limit => 50
    t.integer  "position"
    t.datetime "created_at"
  end

  create_table "sp_questionnaire_pages", :force => true do |t|
    t.integer  "questionnaire_id"
    t.integer  "page_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sp_references", :force => true do |t|
    t.integer  "application_id"
    t.string   "type",           :limit => 50
    t.datetime "email_sent_at"
    t.boolean  "is_staff"
    t.string   "title"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "accountNo"
    t.string   "home_phone"
    t.string   "email"
    t.string   "status"
    t.datetime "submitted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by_id"
    t.integer  "updated_by_id"
    t.string   "access_key"
    t.boolean  "mail",                         :default => false
  end

  add_index "sp_references", ["application_id"], :name => "application_id"

  create_table "sp_roles", :force => true do |t|
    t.string "role",       :limit => 50
    t.string "user_class"
  end

  create_table "sp_staff", :force => true do |t|
    t.integer "person_id",                                :null => false
    t.integer "project_id",                               :null => false
    t.string  "type",       :limit => 10, :default => "", :null => false
    t.string  "year"
  end

  add_index "sp_staff", ["project_id", "person_id", "year"], :name => "project_staff_person", :unique => true

  create_table "sp_stats", :force => true do |t|
    t.integer  "project_id"
    t.integer  "spiritual_conversations_initiated"
    t.integer  "gospel_shared"
    t.integer  "received_christ"
    t.integer  "holy_spirit_presentations"
    t.integer  "holy_spirit_filled"
    t.integer  "other_exposures"
    t.integer  "involved_new_believers"
    t.integer  "students_involved"
    t.integer  "spiritual_multipliers"
    t.string   "type",                              :limit => 50
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by_id"
    t.integer  "updated_by_id"
    t.integer  "gospel_shared_personal"
    t.integer  "gospel_shared_group"
    t.integer  "gospel_shared_media"
    t.integer  "pioneer_campuses"
    t.integer  "key_contact_campuses"
    t.integer  "launched_campuses"
    t.integer  "movements_launched"
  end

  create_table "sp_users", :force => true do |t|
    t.integer  "ssm_id"
    t.datetime "last_login"
    t.datetime "created_at"
    t.integer  "created_by_id"
    t.string   "type"
    t.string   "role"
  end

  add_index "sp_users", ["ssm_id"], :name => "sp_users_ssm_id_index", :unique => true

  create_table "staffsite_staffsitepref", :primary_key => "StaffSitePrefID", :force => true do |t|
    t.string "name",                :limit => 64
    t.string "displayName"
    t.string "value"
    t.string "fk_StaffSiteProfile", :limit => 64
  end

  add_index "staffsite_staffsitepref", ["fk_StaffSiteProfile"], :name => "index1"
  add_index "staffsite_staffsitepref", ["name"], :name => "index2"

  create_table "staffsite_staffsiteprofile", :primary_key => "StaffSiteProfileID", :force => true do |t|
    t.string  "firstName",        :limit => 64
    t.string  "lastName",         :limit => 64
    t.string  "userName",         :limit => 64
    t.boolean "changePassword"
    t.boolean "captureHRinfo"
    t.string  "accountNo",        :limit => 64
    t.boolean "isStaff"
    t.string  "email",            :limit => 64
    t.string  "passwordQuestion", :limit => 64
    t.string  "passwordAnswer",   :limit => 64
  end

  add_index "staffsite_staffsiteprofile", ["userName"], :name => "index1"

  create_table "states", :force => true do |t|
    t.string "state", :limit => 100
    t.string "code",  :limit => 10
  end

  create_table "summer_placement_preferences", :force => true do |t|
    t.integer  "person_id"
    t.datetime "submitted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wsn_sp_answer_deprecated", :primary_key => "answerID", :force => true do |t|
    t.string  "body",                :limit => 1000
    t.integer "fk_QuestionID"
    t.integer "fk_WsnApplicationID"
  end

  add_index "wsn_sp_answer_deprecated", ["fk_QuestionID", "fk_WsnApplicationID"], :name => "fk_WsnApplicationID"

  create_table "wsn_sp_question_deprecated", :primary_key => "questionID", :force => true do |t|
    t.string  "required",          :limit => 1
    t.integer "displayOrder"
    t.integer "fk_WsnProjectID"
    t.integer "fk_QuestionTextID"
  end

  add_index "wsn_sp_question_deprecated", ["fk_QuestionTextID"], :name => "fk_QuestionTextID"
  add_index "wsn_sp_question_deprecated", ["fk_WsnProjectID"], :name => "fk_WsnProjectID"

  create_table "wsn_sp_questiontext_deprecated", :primary_key => "questionTextID", :force => true do |t|
    t.string "body",       :limit => 250
    t.string "answerType", :limit => 50
    t.string "status",     :limit => 50
  end

  create_table "wsn_sp_reference_deprecated", :primary_key => "referenceID", :force => true do |t|
    t.string   "formWorkflowStatus",  :limit => 1
    t.datetime "createDate"
    t.datetime "lastChangedDate"
    t.string   "lastChangedBy",       :limit => 30
    t.boolean  "isFormSubmitted"
    t.datetime "formSubmittedDate"
    t.string   "referenceType",       :limit => 2
    t.string   "title",               :limit => 5
    t.string   "firstName",           :limit => 30
    t.string   "lastName",            :limit => 30
    t.boolean  "isStaff"
    t.string   "staffNumber",         :limit => 16
    t.string   "currentAddress1",     :limit => 50
    t.string   "currentAddress2",     :limit => 50
    t.string   "currentCity",         :limit => 35
    t.string   "currentState",        :limit => 6
    t.string   "currentZip",          :limit => 10
    t.string   "cellPhone",           :limit => 24
    t.string   "homePhone",           :limit => 24
    t.string   "workPhone",           :limit => 24
    t.string   "currentEmail",        :limit => 50
    t.string   "howKnown",            :limit => 64
    t.string   "howLongKnown",        :limit => 64
    t.string   "howWellKnown",        :limit => 64
    t.boolean  "sendMidEval"
    t.integer  "_1a"
    t.integer  "_2a"
    t.integer  "_3a"
    t.integer  "_4a"
    t.integer  "_5a"
    t.integer  "_6a"
    t.integer  "_7a"
    t.integer  "_8a"
    t.integer  "_9a"
    t.integer  "_10a"
    t.integer  "_11a"
    t.integer  "_12a"
    t.integer  "_13a"
    t.integer  "_14a"
    t.integer  "_15a"
    t.integer  "_16a"
    t.integer  "_17a"
    t.integer  "_18a"
    t.integer  "_19a"
    t.integer  "_20a"
    t.integer  "_21a"
    t.text     "_1sa",                :limit => 16777215
    t.text     "_2sa",                :limit => 16777215
    t.text     "_3sa",                :limit => 16777215
    t.text     "_4sa",                :limit => 16777215
    t.text     "_5sa",                :limit => 16777215
    t.text     "_6sa",                :limit => 16777215
    t.string   "_6sb",                :limit => 1
    t.text     "_6sc",                :limit => 16777215
    t.text     "_7sa",                :limit => 16777215
    t.text     "_8sa",                :limit => 16777215
    t.text     "closingRemarks",      :limit => 16777215
    t.integer  "fk_WsnApplicationID"
  end

  add_index "wsn_sp_reference_deprecated", ["fk_WsnApplicationID"], :name => "fk_WsnApplicationID"

  create_table "wsn_sp_wsnapplication_deprecated", :primary_key => "WsnApplicationID", :force => true do |t|
    t.string   "surferID",                      :limit => 64
    t.string   "role",                          :limit => 1
    t.string   "earliestAvailableDate",         :limit => 22
    t.string   "dateMustReturn",                :limit => 22
    t.boolean  "willingForDifferentProject",                          :default => true
    t.boolean  "usCitizen",                                           :default => true
    t.boolean  "isApplicationComplete",                               :default => false
    t.integer  "projectPref1"
    t.integer  "projectPref2"
    t.integer  "projectPref3"
    t.integer  "projectPref4"
    t.integer  "projectPref5"
    t.string   "applAccountNo",                 :limit => 11
    t.float    "supportBalance"
    t.boolean  "insuranceReceived",                                   :default => false
    t.boolean  "waiverReceived",                                      :default => false
    t.boolean  "didGo",                                               :default => false
    t.boolean  "participantEvaluation",                               :default => false
    t.string   "arrivalGatewayCityToLocation",  :limit => 22
    t.string   "locationToGatewayCityFlightNo", :limit => 50
    t.string   "departLocationToGatewayCity",   :limit => 22
    t.string   "passportNo",                    :limit => 25
    t.string   "passportCountry",               :limit => 50
    t.string   "passportIssueDate",             :limit => 22
    t.string   "passportExpirationDate",        :limit => 22
    t.string   "visaCountry",                   :limit => 50
    t.string   "visaNo",                        :limit => 50
    t.string   "visaType",                      :limit => 50
    t.boolean  "visaIsMultipleEntry",                                 :default => false
    t.string   "visaIssueDate",                 :limit => 22
    t.string   "visaExpirationDate",            :limit => 22
    t.string   "dateUpdated",                   :limit => 22
    t.boolean  "isStaff",                                             :default => false
    t.boolean  "prevIsp",                                             :default => false
    t.boolean  "child",                                               :default => false
    t.string   "status",                        :limit => 22
    t.string   "wsnYear",                       :limit => 4
    t.integer  "fk_isMember"
    t.boolean  "participateImpact",                                   :default => false
    t.boolean  "participateDestino",                                  :default => false
    t.boolean  "participateEpic"
    t.datetime "springBreakStart"
    t.datetime "springBreakEnd"
    t.boolean  "isIntern",                                            :default => false
    t.boolean  "_1a",                                                 :default => false
    t.boolean  "_1b",                                                 :default => false
    t.boolean  "_1c",                                                 :default => false
    t.boolean  "_1d",                                                 :default => false
    t.boolean  "_1e",                                                 :default => false
    t.text     "_1f",                           :limit => 2147483647
    t.boolean  "_2a"
    t.text     "_2b",                           :limit => 2147483647
    t.boolean  "_2c"
    t.boolean  "_3a"
    t.boolean  "_3b"
    t.boolean  "_3c"
    t.boolean  "_3d"
    t.boolean  "_3e"
    t.boolean  "_3f"
    t.boolean  "_3g"
    t.text     "_3h",                           :limit => 2147483647
    t.boolean  "_4a"
    t.boolean  "_4b"
    t.boolean  "_4c"
    t.boolean  "_4d"
    t.boolean  "_4e"
    t.boolean  "_4f"
    t.boolean  "_4g"
    t.boolean  "_4h"
    t.text     "_4i",                           :limit => 2147483647
    t.boolean  "_5a"
    t.boolean  "_5b"
    t.boolean  "_5c"
    t.boolean  "_5d"
    t.text     "_5e",                           :limit => 2147483647
    t.boolean  "_5f"
    t.text     "_5g",                           :limit => 2147483647
    t.boolean  "_5h"
    t.text     "_6",                            :limit => 2147483647
    t.text     "_7",                            :limit => 2147483647
    t.text     "_8a",                           :limit => 2147483647
    t.text     "_8b",                           :limit => 2147483647
    t.text     "_9",                            :limit => 2147483647
    t.text     "_10",                           :limit => 2147483647
    t.boolean  "_11a"
    t.text     "_11b",                          :limit => 2147483647
    t.boolean  "_12a"
    t.text     "_12b",                          :limit => 2147483647
    t.boolean  "_13a"
    t.boolean  "_13b"
    t.boolean  "_13c"
    t.text     "_14",                           :limit => 2147483647
    t.boolean  "_15"
    t.integer  "_16"
    t.integer  "_17"
    t.integer  "_18"
    t.boolean  "_19a"
    t.boolean  "_19b"
    t.boolean  "_19c"
    t.boolean  "_19d"
    t.boolean  "_19e"
    t.string   "_19f"
    t.text     "_20a",                          :limit => 2147483647
    t.text     "_20b",                          :limit => 2147483647
    t.text     "_20c",                          :limit => 2147483647
    t.boolean  "_21a"
    t.boolean  "_21b"
    t.boolean  "_21c"
    t.boolean  "_21d"
    t.boolean  "_21e"
    t.boolean  "_21f"
    t.boolean  "_21g"
    t.boolean  "_21h"
    t.text     "_21i",                          :limit => 2147483647
    t.string   "_21j",                          :limit => 1
    t.boolean  "_22a"
    t.text     "_22b",                          :limit => 2147483647
    t.boolean  "_23a"
    t.text     "_23b",                          :limit => 2147483647
    t.boolean  "_24a"
    t.text     "_24b",                          :limit => 2147483647
    t.text     "_25",                           :limit => 2147483647
    t.boolean  "_26a"
    t.text     "_26b",                          :limit => 2147483647
    t.boolean  "_27a"
    t.text     "_27b",                          :limit => 2147483647
    t.boolean  "_28a"
    t.text     "_28b",                          :limit => 2147483647
    t.boolean  "_29a"
    t.text     "_29b",                          :limit => 2147483647
    t.boolean  "_29c"
    t.boolean  "_29d"
    t.text     "_29e",                          :limit => 2147483647
    t.text     "_29f",                          :limit => 2147483647
    t.text     "_30",                           :limit => 2147483647
    t.text     "_31",                           :limit => 2147483647
    t.text     "_32",                           :limit => 2147483647
    t.text     "_33",                           :limit => 2147483647
    t.text     "_34",                           :limit => 2147483647
    t.text     "_35",                           :limit => 2147483647
    t.boolean  "isPaid"
    t.boolean  "isApplyingForStaffInternship"
    t.datetime "createDate"
    t.datetime "lastChangedDate"
    t.integer  "lastChangedBy"
    t.boolean  "isRecruited"
    t.integer  "assignedToProject"
    t.string   "electronicSignature",           :limit => 50
    t.datetime "submittedDate"
    t.datetime "assignedDate"
    t.datetime "acceptedDate"
    t.datetime "notAcceptedDate"
    t.datetime "withdrawnDate"
    t.string   "preferredContactMethod",        :limit => 1
    t.string   "howOftenCheckEmail",            :limit => 30
    t.string   "otherClassDetails",             :limit => 30
    t.boolean  "participateOtherProjects"
    t.boolean  "campusHasStaffTeam"
    t.boolean  "campusHasStaffCoach"
    t.boolean  "campusHasMetroTeam"
    t.boolean  "campusHasOther"
    t.string   "campusHasOtherDetails",         :limit => 30
    t.boolean  "inSchoolNextFall"
    t.boolean  "participateCCC"
    t.boolean  "participateNone"
    t.boolean  "ciPhoneCallRequested"
    t.string   "ciPhoneNumber",                 :limit => 24
    t.string   "ciBestTimeToCall",              :limit => 10
    t.string   "ciTimeZone",                    :limit => 10
    t.string   "_26date",                       :limit => 10
    t.integer  "fk_personID"
  end

  add_index "wsn_sp_wsnapplication_deprecated", ["applAccountNo"], :name => "index10"
  add_index "wsn_sp_wsnapplication_deprecated", ["fk_isMember"], :name => "index1"
  add_index "wsn_sp_wsnapplication_deprecated", ["fk_personID"], :name => "fk_personID"
  add_index "wsn_sp_wsnapplication_deprecated", ["status"], :name => "index8"
  add_index "wsn_sp_wsnapplication_deprecated", ["status"], :name => "status"
  add_index "wsn_sp_wsnapplication_deprecated", ["wsnYear"], :name => "index9"

  create_table "wsn_sp_wsndonations_deprecated", :primary_key => "WsnDonationsID", :force => true do |t|
    t.string "accountno",       :limit => 11
    t.float  "monetary_amount",               :null => false
  end

  add_index "wsn_sp_wsndonations_deprecated", ["accountno"], :name => "accountno"

  create_table "wsn_sp_wsnevaluation_deprecated", :primary_key => "evalID", :force => true do |t|
    t.boolean  "applicantNotified"
    t.integer  "_Qual1"
    t.integer  "_Qual2"
    t.integer  "_Qual3"
    t.integer  "_Qual4"
    t.integer  "_Qual5"
    t.integer  "_Qual6"
    t.integer  "_Qual7"
    t.integer  "_Qual8"
    t.boolean  "_DeQual1"
    t.boolean  "_DeQual2"
    t.boolean  "_DeQual3"
    t.boolean  "_DeQual4"
    t.boolean  "_DeQual5"
    t.boolean  "_DeQual6"
    t.string   "comment",              :limit => 2000
    t.integer  "score"
    t.integer  "fk_WsnApplicationID"
    t.datetime "parent_dateCreated"
    t.boolean  "parent_haveDiscussed"
    t.integer  "parent_advice"
    t.string   "parent_adviceReason",  :limit => 2000
    t.string   "parent_name",          :limit => 100
    t.string   "parent_signature",     :limit => 100
    t.datetime "parent_dateSigned"
  end

  add_index "wsn_sp_wsnevaluation_deprecated", ["fk_WsnApplicationID"], :name => "IX_wsn_sp_WsnEvaluation"

  create_table "wsn_sp_wsnproject_deprecated", :primary_key => "WsnProjectID", :force => true do |t|
    t.string   "name"
    t.string   "partnershipRegion",             :limit => 50
    t.text     "history",                       :limit => 2147483647
    t.string   "startDate"
    t.string   "stopDate"
    t.string   "city"
    t.string   "country"
    t.text     "details",                       :limit => 2147483647
    t.string   "status"
    t.string   "destinationGatewayCity"
    t.string   "departDateFromGateCity"
    t.string   "arrivalDateAtLocation"
    t.string   "locationGatewayCity"
    t.string   "departureDateFromLocation"
    t.string   "arrivalDateAtGatewayCity"
    t.string   "flightBudget"
    t.string   "GatewayCitytoLocationFlightNo"
    t.string   "locationToGatewayCityFlightNo"
    t.string   "inCountryContact"
    t.string   "scholarshipAccountNo"
    t.string   "operatingAccountNo"
    t.string   "AOA"
    t.string   "MPTA"
    t.string   "staffCost"
    t.string   "studentCost"
    t.boolean  "insuranceFormsReceived"
    t.boolean  "CAPSFeePaid"
    t.boolean  "adminFeePaid"
    t.string   "storiesXX"
    t.string   "stats"
    t.boolean  "secure"
    t.string   "dateCreated"
    t.string   "lastUpdate"
    t.integer  "maxNoStaff"
    t.integer  "maxNoStudents"
    t.boolean  "projEvalCompleted"
    t.integer  "evangelisticExposures"
    t.integer  "receivedChrist"
    t.integer  "jesusFilmExposures"
    t.integer  "jesusFilmReveivedChrist"
    t.integer  "coverageActivitiesExposures"
    t.integer  "coverageActivitiesDecisions"
    t.integer  "holySpiritDecisions"
    t.string   "website"
    t.string   "destinationAddress"
    t.string   "destinationPhone"
    t.string   "wsnYear"
    t.integer  "fk_IsCoord"
    t.integer  "fk_IsAPD"
    t.integer  "fk_IsPD"
    t.string   "projectType",                   :limit => 1
    t.datetime "studentStartDate"
    t.datetime "studentEndDate"
    t.datetime "staffStartDate"
    t.datetime "staffEndDate"
    t.datetime "leadershipStartDate"
    t.datetime "leadershipEndDate"
    t.datetime "createDate"
    t.datetime "lastChangedDate"
    t.string   "lastChangedBy",                 :limit => 50
    t.string   "displayLocation",               :limit => 50
    t.boolean  "partnershipRegionOnly"
    t.string   "internCost",                    :limit => 50
    t.boolean  "onHold"
    t.integer  "maxNoStaffMale"
    t.integer  "maxNoStaffFemale"
    t.integer  "maxNoStaffCouples"
    t.integer  "maxNoStaffFamilies"
    t.integer  "maxNoInternAMale"
    t.integer  "maxNoInternAFemale"
    t.integer  "maxNoInternACouples"
    t.integer  "maxNoInternAFamilies"
    t.integer  "maxNoInternA"
    t.integer  "maxNoInternPMale"
    t.integer  "maxNoInternPFemale"
    t.integer  "maxNoInternPCouples"
    t.integer  "maxNoInternPFamilies"
    t.integer  "maxNoInternP"
    t.integer  "maxNoStudentAMale"
    t.integer  "maxNoStudentAFemale"
    t.integer  "maxNoStudentACouples"
    t.integer  "maxNoStudentAFamilies"
    t.integer  "maxNoStudentA"
    t.integer  "maxNoStudentPMale"
    t.integer  "maxNoStudentPFemale"
    t.integer  "maxNoStudentPCouples"
    t.integer  "maxNoStudentPFamilies"
    t.string   "operatingBusinessUnit"
    t.string   "operatingOperatingUnit"
    t.string   "operatingDeptID"
    t.string   "operatingProjectID"
    t.string   "operatingDesignation"
    t.string   "scholarshipBusinessUnit"
    t.string   "scholarshipOperatingUnit"
    t.string   "scholarshipDeptID"
    t.string   "scholarshipProjectID"
    t.string   "scholarshipDesignation"
    t.string   "statesideContactName",          :limit => 45
    t.string   "statesideContactProjectRole",   :limit => 35
    t.string   "statesideContactPhone",         :limit => 20
    t.string   "statesideContactEmail",         :limit => 75
    t.integer  "currentNoStudentAMale"
    t.integer  "currentNoStudentPMale"
    t.integer  "currentNoStudentAFemale"
    t.integer  "currentNoStudentPFemale"
    t.integer  "numApplicants"
  end

  add_index "wsn_sp_wsnproject_deprecated", ["fk_IsAPD"], :name => "index1"
  add_index "wsn_sp_wsnproject_deprecated", ["fk_IsCoord"], :name => "index3"
  add_index "wsn_sp_wsnproject_deprecated", ["fk_IsPD"], :name => "index2"
  add_index "wsn_sp_wsnproject_deprecated", ["name"], :name => "index6"
  add_index "wsn_sp_wsnproject_deprecated", ["partnershipRegion"], :name => "index7"
  add_index "wsn_sp_wsnproject_deprecated", ["status"], :name => "index5"
  add_index "wsn_sp_wsnproject_deprecated", ["wsnYear"], :name => "index4"

  create_table "wsn_sp_wsnusers_deprecated", :primary_key => "wsnUserID", :force => true do |t|
    t.string   "ssmUserName",    :limit => 200
    t.string   "role",           :limit => 50
    t.datetime "expirationDate"
  end

  add_index "wsn_sp_wsnusers_deprecated", ["ssmUserName"], :name => "IX_wsn_sp_WsnUsers_fk_UserName"

end
