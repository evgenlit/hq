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

ActiveRecord::Schema.define(version: 20130704104945) do

  create_table "acl_position", primary_key: "acl_position_id", force: true do |t|
    t.integer  "acl_position_user",                    null: false
    t.integer  "acl_position_role",                    null: false
    t.integer  "acl_position_department",              null: false
    t.string   "acl_position_title",       limit: 300
    t.datetime "acl_position_appointment"
    t.datetime "acl_position_dismission"
  end

  create_table "acl_role", primary_key: "acl_role_id", force: true do |t|
    t.text     "acl_role_name",                       null: false
    t.text     "acl_role_description",                null: false
    t.integer  "acl_role_parent"
    t.boolean  "active",               default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  create_table "archive_student", primary_key: "archive_student_id", force: true do |t|
    t.integer "archive_order",                                                          null: false
    t.integer "student_id",                                                             null: false
    t.integer "student_status",                                                         null: false
    t.integer "student_oldid",                                                          null: false
    t.integer "student_oldperson",                                                      null: false
    t.boolean "student_homeless",                                       default: false, null: false
    t.boolean "student_gender",                                         default: false, null: false
    t.integer "student_fname",                                                          null: false
    t.integer "student_iname",                                                          null: false
    t.integer "student_oname",                                                          null: false
    t.boolean "student_foreign",                                        default: false, null: false
    t.date    "student_birthday"
    t.string  "student_birthplace",                    limit: 200
    t.integer "student_citizenship"
    t.string  "student_pseries",                       limit: 4
    t.string  "student_pnumber",                       limit: 20
    t.date    "student_pdate"
    t.text    "student_pdepartment",                   limit: 16777215
    t.string  "student_pcode",                         limit: 20
    t.string  "student_pforeign",                      limit: 200
    t.integer "student_married"
    t.integer "student_army"
    t.string  "student_army_voenkom",                  limit: 300
    t.integer "student_benefits"
    t.string  "student_registration_region",           limit: 200
    t.string  "student_registration_zip",              limit: 10
    t.text    "student_registration_address",          limit: 16777215
    t.string  "student_residence_region",              limit: 200
    t.string  "student_residence_zip",                 limit: 10
    t.text    "student_residence_address",             limit: 16777215
    t.string  "student_phone_home",                    limit: 45
    t.string  "student_phone_mobile",                  limit: 45
    t.string  "student_email",                         limit: 300
    t.integer "student_room"
    t.integer "student_hostel_status",                                  default: 1,     null: false
    t.date    "student_hostel_date"
    t.string  "student_hostel_registration_number",    limit: 200
    t.date    "student_hostel_registration_startdate"
    t.date    "student_hostel_registration_date"
    t.string  "student_hostel_contract_number",        limit: 200
    t.date    "student_hostel_contract_startdate"
    t.date    "student_hostel_contract_date"
    t.date    "student_hostel_payment_date"
    t.string  "student_mother_name",                   limit: 300
    t.string  "student_mother_phone",                  limit: 300
    t.string  "student_father_name",                   limit: 300
    t.string  "student_father_phone",                  limit: 300
    t.string  "student_nation",                        limit: 200
    t.string  "student_ticket",                        limit: 200
    t.string  "student_profkom",                       limit: 200
    t.integer "student_region",                                         default: 1,     null: false
    t.integer "student_hostel_temp"
    t.text    "student_commentary",                    limit: 16777215
    t.integer "student_balance_temp"
  end

  add_index "archive_student", ["archive_order"], name: "archive_order", using: :btree

  create_table "archive_student_group", primary_key: "archive_student_group_id", force: true do |t|
    t.integer "archive_student_group_order",                                                         null: false
    t.integer "student_group_id",                                                                    null: false
    t.integer "student_group_student",                                                               null: false
    t.integer "student_group_infin"
    t.integer "student_group_oldstudent",                                                            null: false
    t.integer "student_group_group",                                                                 null: false
    t.integer "student_group_yearin"
    t.integer "student_group_oldgroup",                                                              null: false
    t.string  "student_group_record",              limit: 11
    t.integer "student_group_tax",                                                     default: 1,   null: false
    t.text    "student_group_contract_customer"
    t.integer "student_group_status",                                                  default: 1,   null: false
    t.integer "student_group_speciality"
    t.integer "student_group_form"
    t.string  "student_group_abit",                limit: 100
    t.string  "student_group_abit_contract"
    t.date    "student_group_abitdate"
    t.integer "student_group_abitpoints"
    t.string  "student_group_a_school"
    t.integer "student_group_a_abit_id"
    t.integer "student_group_a_human_id"
    t.integer "student_group_a_naprav"
    t.integer "student_group_a_region_id"
    t.integer "student_group_a_state_line"
    t.integer "student_group_a_profile_mark"
    t.integer "student_group_a_contract_number"
    t.integer "student_group_a_accept"
    t.integer "student_group_a_accept_type"
    t.integer "student_group_a_stags"
    t.integer "student_group_a_olymp"
    t.integer "student_group_a_school_id"
    t.integer "student_group_a_dr_gos"
    t.integer "student_group_a_finish_year"
    t.string  "student_group_a_att_num",           limit: 25
    t.date    "student_group_a_att_date"
    t.integer "student_group_a_flang_id"
    t.integer "student_group_a_kurs"
    t.string  "student_group_a_kurs_num",          limit: 50
    t.integer "student_group_a_stago"
    t.integer "student_group_a_right_id"
    t.integer "student_group_a_marks"
    t.string  "student_group_a_sert_nums"
    t.integer "student_group_a_exam_types"
    t.integer "student_group_a_subjects"
    t.integer "student_group_p_author"
    t.integer "student_group_p_controller"
    t.text    "student_group_rejected"
    t.integer "student_group_rejected_department"
    t.decimal "student_group_vbalance",                        precision: 9, scale: 2, default: 0.0, null: false
    t.decimal "student_group_balance",                         precision: 9, scale: 2, default: 0.0, null: false
  end

  add_index "archive_student_group", ["archive_student_group_order"], name: "archive_student_group_order", using: :btree

  create_table "checkpoint", primary_key: "checkpoint_id", force: true do |t|
    t.integer "checkpoint_subject",                                                    null: false
    t.integer "checkpoint_type",                                          default: 1,  null: false
    t.string  "checkpoint_name",    limit: 200,                           default: ""
    t.string  "checkpoint_details", limit: 1000
    t.date    "checkpoint_date",                                                       null: false
    t.decimal "checkpoint_min",                  precision: 11, scale: 6
    t.decimal "checkpoint_max",                  precision: 11, scale: 6
    t.integer "checkpoint_closed",                                        default: 0,  null: false
  end

  add_index "checkpoint", ["checkpoint_subject"], name: "checkpoint_subject", using: :btree

  create_table "checkpoint_bck", primary_key: "checkpoint_id", force: true do |t|
    t.integer "checkpoint_subject",                                                    null: false
    t.integer "checkpoint_type",                                          default: 1,  null: false
    t.string  "checkpoint_name",    limit: 200,                           default: ""
    t.string  "checkpoint_details", limit: 1000
    t.date    "checkpoint_date",                                                       null: false
    t.decimal "checkpoint_min",                  precision: 11, scale: 6
    t.decimal "checkpoint_max",                  precision: 11, scale: 6
    t.integer "checkpoint_closed",                                        default: 0,  null: false
  end

  add_index "checkpoint_bck", ["checkpoint_subject"], name: "checkpoint_subject", using: :btree

  create_table "checkpoint_mark", primary_key: "checkpoint_mark_id", force: true do |t|
    t.integer   "checkpoint_mark_checkpoint",                 null: false
    t.integer   "checkpoint_mark_student",                    null: false
    t.integer   "checkpoint_mark_mark",                       null: false
    t.timestamp "checkpoint_mark_submitted",                  null: false
    t.boolean   "checkpoint_mark_retake",     default: false, null: false
  end

  add_index "checkpoint_mark", ["checkpoint_mark_checkpoint"], name: "checkpoint_mark_checkpoint", using: :btree
  add_index "checkpoint_mark", ["checkpoint_mark_student"], name: "checkpoint_mark_student", using: :btree

  create_table "department", primary_key: "department_id", force: true do |t|
    t.integer "department_oldid"
    t.string  "department_name",    limit: 200,                      null: false
    t.string  "department_sname",   limit: 200,                      null: false
    t.integer "department_prename"
    t.string  "department_alias",   limit: 45
    t.string  "department_role",    limit: 200, default: "students", null: false
    t.boolean "department_active",              default: true,       null: false
    t.integer "department_parent"
  end

  add_index "department", ["department_prename"], name: "department_prename", using: :btree

  create_table "dictionary", primary_key: "dictionary_id", force: true do |t|
    t.text "dictionary_ip", limit: 16777215, null: false
    t.text "dictionary_rp", limit: 16777215, null: false
    t.text "dictionary_dp", limit: 16777215, null: false
    t.text "dictionary_vp", limit: 16777215, null: false
    t.text "dictionary_tp", limit: 16777215, null: false
    t.text "dictionary_pp", limit: 16777215, null: false
  end

  create_table "discount", primary_key: "discount_id", force: true do |t|
    t.integer "discount_type",                                  null: false
    t.decimal "discount_modifier",      precision: 3, scale: 2, null: false
    t.integer "discount_year",                                  null: false
    t.integer "discount_semester",                              null: false
    t.integer "discount_student_group",                         null: false
    t.integer "discount_order"
    t.text    "discount_commentary"
  end

  add_index "discount", ["discount_semester"], name: "discount_semester", using: :btree
  add_index "discount", ["discount_student_group"], name: "discount_student_group", using: :btree
  add_index "discount", ["discount_type"], name: "discount_type", using: :btree
  add_index "discount", ["discount_year"], name: "discount_year", using: :btree

  create_table "discount_type", primary_key: "discount_type_id", force: true do |t|
    t.text    "discount_type_name",                                                           null: false
    t.boolean "discount_type_constant",                                       default: false, null: false
    t.boolean "discount_type_invert",                                                         null: false
    t.integer "discount_type_imposition", limit: 1,                           default: 1,     null: false
    t.decimal "discount_type_basic",                  precision: 3, scale: 2
    t.string  "discount_type_commentary", limit: 200
  end

  create_table "document", primary_key: "document_id", force: true do |t|
    t.integer   "document_type",                                     null: false
    t.text      "document_number",      limit: 16777215,             null: false
    t.integer   "document_signed",      limit: 1
    t.timestamp "document_create_date",                              null: false
    t.date      "document_expire_date",                              null: false
    t.integer   "document_juridical",   limit: 1,        default: 0, null: false
  end

  create_table "document_meta", primary_key: "document_meta_id", force: true do |t|
    t.integer "document_meta_document",                  null: false
    t.string  "document_meta_pattern",  limit: 200,      null: false
    t.text    "document_meta_text",     limit: 16777215, null: false
  end

  add_index "document_meta", ["document_meta_document"], name: "document_meta_document", using: :btree

  create_table "document_student", primary_key: "document_student_id", force: true do |t|
    t.integer "document_student_document",                                              null: false
    t.integer "student_id",                                                             null: false
    t.integer "student_status",                                                         null: false
    t.integer "student_oldid",                                                          null: false
    t.integer "student_oldperson",                                                      null: false
    t.boolean "student_homeless",                                       default: false, null: false
    t.boolean "student_gender",                                         default: false, null: false
    t.integer "student_fname",                                                          null: false
    t.integer "student_iname",                                                          null: false
    t.integer "student_oname",                                                          null: false
    t.boolean "student_foreign",                                        default: false, null: false
    t.date    "student_birthday"
    t.string  "student_birthplace",                    limit: 200
    t.integer "student_citizenship"
    t.string  "student_pseries",                       limit: 4
    t.string  "student_pnumber",                       limit: 20
    t.date    "student_pdate"
    t.text    "student_pdepartment",                   limit: 16777215
    t.string  "student_pcode",                         limit: 20
    t.string  "student_pforeign",                      limit: 200
    t.integer "student_married"
    t.string  "student_army_voenkom",                  limit: 300
    t.integer "student_army"
    t.integer "student_benefits"
    t.string  "student_registration_region",           limit: 200
    t.string  "student_registration_zip",              limit: 10
    t.text    "student_registration_address",          limit: 16777215
    t.string  "student_residence_region",              limit: 200
    t.string  "student_residence_zip",                 limit: 10
    t.text    "student_residence_address",             limit: 16777215
    t.string  "student_phone_home",                    limit: 45
    t.string  "student_phone_mobile",                  limit: 45
    t.string  "student_profkom",                       limit: 200
    t.string  "student_email",                         limit: 300
    t.integer "student_room"
    t.integer "student_hostel_status",                                  default: 1,     null: false
    t.date    "student_hostel_date"
    t.string  "student_hostel_registration_number",    limit: 200
    t.date    "student_hostel_registration_startdate"
    t.date    "student_hostel_registration_date"
    t.string  "student_hostel_contract_number",        limit: 200
    t.date    "student_hostel_contract_startdate"
    t.date    "student_hostel_contract_date"
    t.date    "student_hostel_payment_date"
    t.string  "student_mother_name",                   limit: 300
    t.string  "student_mother_phone",                  limit: 300
    t.string  "student_father_name",                   limit: 300
    t.string  "student_father_phone",                  limit: 300
    t.string  "student_nation",                        limit: 200
    t.string  "student_ticket",                        limit: 200
    t.integer "student_region",                                         default: 1,     null: false
    t.integer "student_hostel_temp"
    t.text    "student_commentary",                    limit: 16777215
    t.integer "student_balance_temp"
  end

  add_index "document_student", ["document_student_document"], name: "document_student_document", using: :btree
  add_index "document_student", ["student_id"], name: "student_id", using: :btree

  create_table "document_student_group", primary_key: "document_student_group_id", force: true do |t|
    t.integer "document_student_group_document",                                                     null: false
    t.integer "student_group_id",                                                                    null: false
    t.integer "student_group_student",                                                               null: false
    t.integer "student_group_infin"
    t.integer "student_group_oldstudent",                                                            null: false
    t.integer "student_group_group",                                                                 null: false
    t.integer "student_group_yearin"
    t.integer "student_group_oldgroup",                                                              null: false
    t.string  "student_group_record",              limit: 11
    t.integer "student_group_tax",                                                     default: 1,   null: false
    t.text    "student_group_contract_customer"
    t.integer "student_group_status",                                                  default: 1,   null: false
    t.integer "student_group_speciality"
    t.integer "student_group_form"
    t.string  "student_group_abit",                limit: 100
    t.string  "student_group_abit_contract"
    t.date    "student_group_abitdate"
    t.integer "student_group_abitpoints"
    t.string  "student_group_a_school"
    t.integer "student_group_a_abit_id"
    t.integer "student_group_a_human_id"
    t.integer "student_group_a_naprav"
    t.integer "student_group_a_region_id"
    t.integer "student_group_a_state_line"
    t.integer "student_group_a_profile_mark"
    t.integer "student_group_a_contract_number"
    t.integer "student_group_a_accept"
    t.integer "student_group_a_accept_type"
    t.integer "student_group_a_stags"
    t.integer "student_group_a_olymp"
    t.integer "student_group_a_school_id"
    t.integer "student_group_a_dr_gos"
    t.integer "student_group_a_finish_year"
    t.string  "student_group_a_att_num",           limit: 25
    t.date    "student_group_a_att_date"
    t.integer "student_group_a_flang_id"
    t.integer "student_group_a_kurs"
    t.string  "student_group_a_kurs_num",          limit: 50
    t.integer "student_group_a_stago"
    t.integer "student_group_a_right_id"
    t.integer "student_group_a_marks"
    t.string  "student_group_a_sert_nums"
    t.integer "student_group_a_exam_types"
    t.integer "student_group_a_subjects"
    t.integer "student_group_p_author"
    t.integer "student_group_p_controller"
    t.text    "student_group_rejected"
    t.integer "student_group_rejected_department"
    t.decimal "student_group_vbalance",                        precision: 9, scale: 2, default: 0.0, null: false
    t.decimal "student_group_balance",                         precision: 9, scale: 2, default: 0.0, null: false
  end

  add_index "document_student_group", ["document_student_group_document"], name: "document_student_group_document", using: :btree
  add_index "document_student_group", ["student_group_id"], name: "student_group_id", using: :btree
  add_index "document_student_group", ["student_group_student"], name: "student_group_student", using: :btree

  create_table "employee", primary_key: "employee_id", force: true do |t|
    t.integer "employee_dictionary_iname", null: false
    t.integer "employee_dictionary_oname", null: false
    t.integer "employee_dictionary_fname", null: false
  end

  create_table "employee_position", primary_key: "employee_position_id", force: true do |t|
    t.integer  "employee_position_employee",                 null: false
    t.integer  "employee_position_position",                 null: false
    t.boolean  "employee_position_temporary",                null: false
    t.datetime "employee_position_since",                    null: false
    t.boolean  "employee_position_active",    default: true, null: false
  end

  add_index "employee_position", ["employee_position_employee"], name: "employee_position_employee", using: :btree
  add_index "employee_position", ["employee_position_position"], name: "employee_position_position", using: :btree

  create_table "exam", primary_key: "exam_id", force: true do |t|
    t.integer "exam_subject",                       null: false
    t.integer "exam_type",                          null: false
    t.integer "exam_weight",        default: 20
    t.date    "exam_date"
    t.integer "exam_parent"
    t.integer "exam_student"
    t.integer "exam_student_group"
    t.integer "exam_group"
    t.integer "exam_repeat"
    t.boolean "exam_filled",        default: false
    t.boolean "exam_closed",                        null: false
  end

  add_index "exam", ["exam_subject"], name: "exam_subject", using: :btree

  create_table "exam_formreader", primary_key: "exam_formreader_id", force: true do |t|
    t.boolean "exam_formreader_parsed",                  default: false, null: false
    t.string  "DocNumber",              limit: 16
    t.string  "S1Id",                   limit: 16
    t.float   "S1Result"
    t.string  "S2Id",                   limit: 16
    t.float   "S2Result"
    t.string  "S3Id",                   limit: 16
    t.float   "S3Result"
    t.string  "S4Id",                   limit: 16
    t.float   "S4Result"
    t.string  "S5Id",                   limit: 16
    t.float   "S5Result"
    t.string  "S6Id",                   limit: 16
    t.float   "S6Result"
    t.string  "S7Id",                   limit: 16
    t.float   "S7Result"
    t.string  "S8Id",                   limit: 16
    t.float   "S8Result"
    t.string  "S9Id",                   limit: 16
    t.float   "S9Result"
    t.string  "S10Id",                  limit: 16
    t.float   "S10Result"
    t.string  "S11Id",                  limit: 16
    t.float   "S11Result"
    t.string  "S12Id",                  limit: 16
    t.float   "S12Result"
    t.string  "S13Id",                  limit: 16
    t.float   "S13Result"
    t.string  "S14Id",                  limit: 16
    t.float   "S14Result"
    t.string  "S15Id",                  limit: 16
    t.float   "S15Result"
    t.string  "S16Id",                  limit: 16
    t.float   "S16Result"
    t.string  "S17Id",                  limit: 16
    t.float   "S17Result"
    t.string  "S18Id",                  limit: 16
    t.float   "S18Result"
    t.string  "S19Id",                  limit: 16
    t.float   "S19Result"
    t.string  "S20Id",                  limit: 16
    t.float   "S20Result"
    t.string  "S21Id",                  limit: 16
    t.float   "S21Result"
    t.string  "S22Id",                  limit: 16
    t.float   "S22Result"
    t.string  "S23Id",                  limit: 16
    t.float   "S23Result"
    t.string  "S24Id",                  limit: 16
    t.float   "S24Result"
    t.string  "S25Id",                  limit: 16
    t.float   "S25Result"
    t.string  "S26Id",                  limit: 16
    t.float   "S26Result"
    t.string  "S27Id",                  limit: 16
    t.float   "S27Result"
    t.string  "S28Id",                  limit: 16
    t.float   "S28Result"
    t.string  "S29Id",                  limit: 16
    t.float   "S29Result"
    t.string  "S30Id",                  limit: 16
    t.float   "S30Result"
    t.string  "S31Id",                  limit: 16
    t.float   "S31Result"
    t.string  "S32Id",                  limit: 16
    t.float   "S32Result"
    t.string  "S33Id",                  limit: 16
    t.float   "S33Result"
    t.string  "S34Id",                  limit: 16
    t.float   "S34Result"
    t.string  "S35Id",                  limit: 16
    t.float   "S35Result"
    t.string  "S36Id",                  limit: 16
    t.float   "S36Result"
    t.binary  "ImageData",              limit: 16777215
    t.string  "Created",                limit: 32
    t.string  "Recognized",             limit: 32
    t.string  "Verified",               limit: 32
  end

  add_index "exam_formreader", ["DocNumber"], name: "DocNumber", using: :btree

  create_table "exam_student", primary_key: "exam_student_id", force: true do |t|
    t.integer "exam_student_exam",          null: false
    t.integer "exam_student_student",       null: false
    t.integer "exam_student_student_group", null: false
  end

  add_index "exam_student", ["exam_student_exam"], name: "exam_student_exam", using: :btree
  add_index "exam_student", ["exam_student_student_group"], name: "exam_student_student_group", using: :btree

  create_table "finance_discount", primary_key: "finance_discount_id", force: true do |t|
    t.integer "finance_discount_type",                                  null: false
    t.decimal "finance_discount_modifier",      precision: 3, scale: 2, null: false
    t.integer "finance_discount_year",                                  null: false
    t.integer "finance_discount_semester",                              null: false
    t.integer "finance_discount_student_group",                         null: false
    t.integer "finance_discount_order"
    t.text    "finance_discount_commentary"
  end

  add_index "finance_discount", ["finance_discount_semester"], name: "discount_semester", using: :btree
  add_index "finance_discount", ["finance_discount_student_group"], name: "discount_student_group", using: :btree
  add_index "finance_discount", ["finance_discount_type"], name: "discount_type", using: :btree
  add_index "finance_discount", ["finance_discount_year"], name: "discount_year", using: :btree

  create_table "finance_discount_type", primary_key: "finance_discount_type_id", force: true do |t|
    t.text    "finance_discount_type_name",                                                           null: false
    t.boolean "finance_discount_type_constant",                                       default: false, null: false
    t.boolean "finance_discount_type_invert",                                                         null: false
    t.integer "finance_discount_type_imposition", limit: 1,                           default: 1,     null: false
    t.decimal "finance_discount_type_basic",                  precision: 3, scale: 2
    t.string  "finance_discount_type_commentary", limit: 200
  end

  create_table "finance_payment", primary_key: "finance_payment_id", force: true do |t|
    t.integer   "finance_payment_type",                                                               null: false
    t.integer   "finance_payment_student_group",                                                      null: false
    t.timestamp "finance_payment_date",                                                               null: false
    t.decimal   "finance_payment_sum",                        precision: 9, scale: 2
    t.boolean   "finance_payment_deleted",                                            default: false, null: false
    t.integer   "finance_payment_user"
    t.string    "finance_payment_comment",       limit: 1000
  end

  add_index "finance_payment", ["finance_payment_student_group"], name: "speciality_payment_student_group", using: :btree
  add_index "finance_payment", ["finance_payment_type"], name: "speciality_payment_type", using: :btree

  create_table "finance_payment_type", primary_key: "finance_payment_type_id", force: true do |t|
    t.integer "finance_payment_type_year",       null: false
    t.integer "finance_payment_type_form",       null: false
    t.integer "finance_payment_type_speciality", null: false
  end

  add_index "finance_payment_type", ["finance_payment_type_form"], name: "speciality_payment_type_form", using: :btree
  add_index "finance_payment_type", ["finance_payment_type_speciality"], name: "speciality_payment_type_speciality", using: :btree
  add_index "finance_payment_type", ["finance_payment_type_year"], name: "speciality_payment_type_year", using: :btree

  create_table "finance_price", primary_key: "finance_price_id", force: true do |t|
    t.integer "finance_price_payment_type",                         null: false
    t.integer "finance_price_year",                                 null: false
    t.integer "finance_price_semester",                             null: false
    t.decimal "finance_price_price",        precision: 9, scale: 2, null: false
  end

  add_index "finance_price", ["finance_price_payment_type"], name: "speciality_price_payment_type", using: :btree
  add_index "finance_price", ["finance_price_semester"], name: "speciality_price_semester", using: :btree
  add_index "finance_price", ["finance_price_year"], name: "speciality_price_year", using: :btree

  create_table "finance_recalc", primary_key: "finance_recalc_id", force: true do |t|
    t.integer "finance_recalc_student_group",                         null: false
    t.integer "finance_recalc_year",                                  null: false
    t.integer "finance_recalc_semester",                              null: false
    t.decimal "finance_recalc_sum",           precision: 9, scale: 2, null: false
  end

  add_index "finance_recalc", ["finance_recalc_semester"], name: "recalc_semester", using: :btree
  add_index "finance_recalc", ["finance_recalc_student_group"], name: "recalc_student_group", using: :btree
  add_index "finance_recalc", ["finance_recalc_year"], name: "recalc_year", using: :btree

  create_table "flat", primary_key: "flat_id", force: true do |t|
    t.integer "flat_hostel",                          null: false
    t.integer "flat_entrance",                        null: false
    t.integer "flat_floor",                           null: false
    t.string  "flat_number",   limit: 45,             null: false
    t.integer "flat_type",                default: 1, null: false
  end

  add_index "flat", ["flat_hostel"], name: "flatHostel", using: :btree

  create_table "group", primary_key: "group_id", force: true do |t|
    t.integer "group_oldid"
    t.string  "group_name",          limit: 45,                null: false
    t.integer "group_number",        limit: 1,                 null: false
    t.integer "group_course"
    t.integer "group_ncourse",                                 null: false
    t.integer "group_semester",      limit: 1,                 null: false
    t.integer "group_form",                     default: 1,    null: false
    t.integer "group_second_higher", limit: 1,  default: 0,    null: false
    t.integer "group_speciality",                              null: false
    t.boolean "group_active",                   default: true, null: false
  end

  add_index "group", ["group_speciality"], name: "groupSpeciality", using: :btree

  create_table "hostel", primary_key: "hostel_id", force: true do |t|
    t.string "hostel_name",       limit: 200, null: false
    t.string "hostel_short_name", limit: 200
    t.string "hostel_address",    limit: 200, null: false
  end

  create_table "hostel_payment", primary_key: "hostel_payment_id", force: true do |t|
    t.integer   "hostel_payment_type",                null: false
    t.integer   "hostel_payment_student",             null: false
    t.timestamp "hostel_payment_date",                null: false
    t.integer   "hostel_payment_sum",     default: 0, null: false
    t.integer   "hostel_payment_year",                null: false
  end

  add_index "hostel_payment", ["hostel_payment_student"], name: "hostel_payment_student", using: :btree
  add_index "hostel_payment", ["hostel_payment_type"], name: "hostel_payment_type", using: :btree

  create_table "hostel_payment_type", primary_key: "hostel_payment_type_id", force: true do |t|
    t.integer "hostel_payment_type_status",              null: false
    t.integer "hostel_payment_type_tax",                 null: false
    t.string  "hostel_payment_type_name",    limit: 200, null: false
    t.integer "hostel_payment_type_sum",                 null: false
    t.integer "hostel_payment_type_yearsum",             null: false
    t.integer "hostel_payment_type_active",  limit: 1,   null: false
  end

  add_index "hostel_payment_type", ["hostel_payment_type_status"], name: "hostel_payment_type_status", using: :btree
  add_index "hostel_payment_type", ["hostel_payment_type_tax"], name: "hostel_payment_type_tax", using: :btree

  create_table "log", primary_key: "log_id", force: true do |t|
    t.timestamp "log_timestamp",                          null: false
    t.integer   "log_priority",  limit: 1,                null: false
    t.integer   "log_user"
    t.string    "log_message",   limit: 500, default: "", null: false
    t.integer   "log_type"
    t.integer   "log_object"
  end

  add_index "log", ["log_user"], name: "log_user", using: :btree

  create_table "mark", primary_key: "mark_id", force: true do |t|
    t.integer "mark_student_group",                 null: false
    t.integer "mark_value",                         null: false
    t.boolean "mark_rating",        default: false
    t.integer "mark_exam",                          null: false
    t.date    "mark_date",                          null: false
    t.boolean "mark_final",         default: true
  end

  add_index "mark", ["mark_exam"], name: "mark_exam", using: :btree

  create_table "mark_final", id: false, force: true do |t|
    t.integer "mark_final_student", default: 0, null: false
    t.integer "mark_final_exam",    default: 0, null: false
    t.integer "mark_final_mark"
  end

  add_index "mark_final", ["mark_final_exam"], name: "mark_final_exam", using: :btree
  add_index "mark_final", ["mark_final_student", "mark_final_exam"], name: "mark_final_unique", unique: true, using: :btree

  create_table "optional", primary_key: "optional_id", force: true do |t|
    t.integer "optional_form"
    t.integer "optional_speciality"
    t.integer "optional_course"
    t.integer "optional_term"
    t.integer "optional_option"
    t.string  "optional_title",      limit: 200
    t.integer "optional_group"
  end

  add_index "optional", ["optional_speciality"], name: "optional_speciality", using: :btree

  create_table "optional_select", primary_key: "optional_select_id", force: true do |t|
    t.integer "optional_select_student"
    t.integer "optional_select_optional"
  end

  add_index "optional_select", ["optional_select_optional"], name: "optional_select_optional", using: :btree
  add_index "optional_select", ["optional_select_student"], name: "optional_select_student", using: :btree

  create_table "order", primary_key: "order_id", force: true do |t|
    t.string    "order_number",       limit: 200
    t.integer   "order_revision",                 default: 1, null: false
    t.integer   "order_department"
    t.integer   "order_responsible"
    t.timestamp "order_editing",                              null: false
    t.datetime  "order_signing"
    t.integer   "order_status",                   default: 1, null: false
    t.text      "order_xsl_content"
    t.integer   "order_xsl_template"
    t.integer   "order_template",                             null: false
    t.integer   "order_cfaculty",                 default: 1, null: false
    t.integer   "order_sign"
    t.integer   "order_introduce"
    t.string    "order_endorsement",  limit: 300
  end

  add_index "order", ["order_template"], name: "order_template", using: :btree

  create_table "order_meta", primary_key: "order_meta_id", force: true do |t|
    t.integer "order_meta_order",                    null: false
    t.integer "order_meta_type",                     null: false
    t.integer "order_meta_object",                   null: false
    t.string  "order_meta_pattern", limit: 200,      null: false
    t.text    "order_meta_text",    limit: 16777215, null: false
  end

  add_index "order_meta", ["order_meta_order"], name: "order_meta_order", using: :btree

  create_table "order_reason", primary_key: "order_reason_id", force: true do |t|
    t.integer "order_reason_order",  null: false
    t.integer "order_reason_reason", null: false
  end

  add_index "order_reason", ["order_reason_order"], name: "order_reason_order", using: :btree
  add_index "order_reason", ["order_reason_reason"], name: "order_reason_reason", using: :btree

  create_table "order_student", primary_key: "order_student_id", force: true do |t|
    t.integer "order_student_order",            null: false
    t.integer "order_student_student",          null: false
    t.integer "order_student_student_group_id"
    t.integer "order_student_cause",            null: false
  end

  add_index "order_student", ["order_student_order"], name: "orderStudentOrder", using: :btree
  add_index "order_student", ["order_student_student"], name: "orderStudentStudent", using: :btree
  add_index "order_student", ["order_student_student_group_id"], name: "order_student_student_group_id", using: :btree

  create_table "order_xsl", primary_key: "order_xsl_id", force: true do |t|
    t.integer   "order_xsl_template", null: false
    t.text      "order_xsl_content",  null: false
    t.timestamp "order_xsl_time",     null: false
  end

  add_index "order_xsl", ["order_xsl_template"], name: "order_xsl_template", using: :btree

  create_table "position", primary_key: "position_id", force: true do |t|
    t.integer "position_dictionary_name", null: false
  end

  create_table "post", primary_key: "post_id", force: true do |t|
    t.string    "post_title", limit: 100, null: false
    t.text      "post_text",              null: false
    t.timestamp "post_time",              null: false
  end

  create_table "recalc", primary_key: "recalc_id", force: true do |t|
    t.integer "recalc_student_group",                         null: false
    t.integer "recalc_year",                                  null: false
    t.integer "recalc_semester",                              null: false
    t.decimal "recalc_sum",           precision: 9, scale: 2, null: false
  end

  add_index "recalc", ["recalc_semester"], name: "recalc_semester", using: :btree
  add_index "recalc", ["recalc_student_group"], name: "recalc_student_group", using: :btree
  add_index "recalc", ["recalc_year"], name: "recalc_year", using: :btree

  create_table "room", primary_key: "room_id", force: true do |t|
    t.integer "room_oldid", null: false
    t.integer "room_flat",  null: false
    t.integer "room_seats"
  end

  add_index "room", ["room_flat"], name: "roomFlat", using: :btree

  create_table "schedule_cycle", primary_key: "schedule_cycle_id", force: true do |t|
    t.integer "schedule_cycle_course"
    t.integer "schedule_cycle_union"
    t.string  "schedule_cycle_subject_type", limit: 30, default: "", null: false
    t.integer "schedule_cycle_group",                                null: false
    t.integer "schedule_cycle_subgroup",                             null: false
    t.integer "schedule_cycle_lecturer"
    t.integer "schedule_cycle_room_type",                            null: false
    t.string  "schedule_cycle_union_type",   limit: 10
  end

  create_table "schedule_dkpv", id: false, force: true do |t|
    t.integer "schedule_dkpv_id",   null: false
    t.integer "schedule_dkpv_nk",   null: false
    t.integer "schedule_dkpv_room"
  end

  create_table "schedule_flow", primary_key: "schedule_flow_id", force: true do |t|
    t.string  "schedule_flow_speciality", limit: 30, default: "", null: false
    t.integer "schedule_flow_course",                             null: false
    t.integer "schedule_flow_groups",                             null: false
    t.integer "schedule_flow_students"
    t.date    "schedule_flow_start",                              null: false
    t.date    "schedule_flow_finish",                             null: false
    t.string  "schedule_flow_form",       limit: 2,  default: "", null: false
    t.integer "schedule_flow_days"
  end

  create_table "schedule_kpv", primary_key: "schedule_kpv_id", force: true do |t|
    t.integer "schedule_kpv_union",         null: false
    t.integer "schedule_kpv_subject"
    t.integer "schedule_kpv_room_type"
    t.integer "schedule_kpv_lecturer"
    t.integer "schedule_kpv_subdepartment"
  end

  add_index "schedule_kpv", ["schedule_kpv_lecturer"], name: "schedule_kpv_lecturer", using: :btree
  add_index "schedule_kpv", ["schedule_kpv_subject"], name: "schedule_kpv_subject", using: :btree

  create_table "schedule_lecturer", primary_key: "schedule_lecturer_id", force: true do |t|
    t.integer "schedule_lecturer_subdepartment"
    t.string  "schedule_lecturer_name",          limit: 50, default: "", null: false
    t.string  "schedule_lecturer_title",         limit: 50
    t.integer "schedule_lecturer_days"
  end

  add_index "schedule_lecturer", ["schedule_lecturer_subdepartment"], name: "schedule_lecturer_subdepartment", using: :btree

  create_table "schedule_part", primary_key: "schedule_part_id", force: true do |t|
    t.integer "schedule_part_cycle"
    t.integer "schedule_part_nk"
    t.integer "schedule_part_kolpar",        null: false
    t.integer "schedule_part_kolzan",        null: false
    t.boolean "schedule_part_chn",           null: false
    t.integer "schedule_part_new_room_type"
    t.integer "schedule_part_room_type"
    t.integer "schedule_part_day",           null: false
    t.integer "schedule_part_para",          null: false
    t.integer "schedule_part_start_week",    null: false
    t.integer "schedule_part_end_week",      null: false
    t.integer "schedule_part_priority"
  end

  add_index "schedule_part", ["schedule_part_cycle"], name: "schedule_part_cycle", using: :btree
  add_index "schedule_part", ["schedule_part_room_type"], name: "schedule_part_room_type", using: :btree

  create_table "schedule_plan", id: false, force: true do |t|
    t.integer "schedule_plan_course",        null: false
    t.integer "schedule_plan_flow",          null: false
    t.integer "schedule_plan_subdepartment", null: false
    t.integer "schedule_plan_subject",       null: false
    t.integer "schedule_plan_lectures"
    t.integer "schedule_plan_practical"
    t.integer "schedule_plan_laboratory"
  end

  add_index "schedule_plan", ["schedule_plan_flow"], name: "schedule_plan_flow", using: :btree
  add_index "schedule_plan", ["schedule_plan_subdepartment"], name: "schedule_plan_subdepartment", using: :btree
  add_index "schedule_plan", ["schedule_plan_subject"], name: "schedule_plan_subject", using: :btree

  create_table "schedule_room", primary_key: "schedule_room_id", force: true do |t|
    t.string  "schedule_room_name",     limit: 30, default: "", null: false
    t.string  "schedule_room_building", limit: 6,  default: "", null: false
    t.integer "schedule_room_capacity"
    t.integer "schedule_room_zanpar"
  end

  create_table "schedule_subdepartment", primary_key: "schedule_subdepartment_id", force: true do |t|
    t.string "schedule_subdepartment_name", limit: 30, default: "", null: false
  end

  create_table "schedule_subject", primary_key: "schedule_subject_id", force: true do |t|
    t.string "schedule_subject_name", limit: 200, default: "", null: false
  end

  create_table "speciality", primary_key: "speciality_id", force: true do |t|
    t.integer "speciality_oldid"
    t.string  "speciality_parent",     limit: 45
    t.string  "speciality_code",       limit: 20,                                               null: false
    t.text    "speciality_name",       limit: 16777215,                                         null: false
    t.string  "speciality_shortname",  limit: 20,                                               null: false
    t.string  "speciality_short_name", limit: 10,                                               null: false
    t.boolean "speciality_type",                                                default: false, null: false
    t.integer "speciality_ntype",      limit: 1,                                                null: false
    t.decimal "speciality_olength",                     precision: 2, scale: 1,                 null: false
    t.decimal "speciality_zlength",                     precision: 2, scale: 1,                 null: false
    t.decimal "speciality_ozlength",                    precision: 2, scale: 1,                 null: false
    t.integer "speciality_faculty",                                                             null: false
    t.integer "speciality_ioo"
  end

  add_index "speciality", ["speciality_faculty"], name: "specialityFaculty", using: :btree

  create_table "speciality_payment", primary_key: "speciality_payment_id", force: true do |t|
    t.integer   "speciality_payment_type",                                                               null: false
    t.integer   "speciality_payment_student_group",                                                      null: false
    t.timestamp "speciality_payment_date",                                                               null: false
    t.decimal   "speciality_payment_sum",                        precision: 9, scale: 2
    t.boolean   "speciality_payment_deleted",                                            default: false, null: false
    t.integer   "speciality_payment_user"
    t.string    "speciality_payment_comment",       limit: 1000
  end

  add_index "speciality_payment", ["speciality_payment_student_group"], name: "speciality_payment_student_group", using: :btree
  add_index "speciality_payment", ["speciality_payment_type"], name: "speciality_payment_type", using: :btree

  create_table "speciality_payment_type", primary_key: "speciality_payment_type_id", force: true do |t|
    t.integer "speciality_payment_type_year",       null: false
    t.integer "speciality_payment_type_form",       null: false
    t.integer "speciality_payment_type_speciality", null: false
  end

  add_index "speciality_payment_type", ["speciality_payment_type_form"], name: "speciality_payment_type_form", using: :btree
  add_index "speciality_payment_type", ["speciality_payment_type_speciality"], name: "speciality_payment_type_speciality", using: :btree
  add_index "speciality_payment_type", ["speciality_payment_type_year"], name: "speciality_payment_type_year", using: :btree

  create_table "speciality_price", primary_key: "speciality_price_id", force: true do |t|
    t.integer "speciality_price_payment_type",                         null: false
    t.integer "speciality_price_year",                                 null: false
    t.integer "speciality_price_semester",                             null: false
    t.decimal "speciality_price_price",        precision: 9, scale: 2, null: false
  end

  add_index "speciality_price", ["speciality_price_payment_type"], name: "speciality_price_payment_type", using: :btree
  add_index "speciality_price", ["speciality_price_semester"], name: "speciality_price_semester", using: :btree
  add_index "speciality_price", ["speciality_price_year"], name: "speciality_price_year", using: :btree

  create_table "student", primary_key: "student_id", force: true do |t|
    t.integer "student_status",                                         default: 1,     null: false
    t.integer "student_oldid",                                                          null: false
    t.integer "student_oldperson",                                                      null: false
    t.boolean "student_homeless",                                       default: false, null: false
    t.boolean "student_gender",                                         default: false, null: false
    t.integer "student_fname",                                                          null: false
    t.integer "student_iname",                                                          null: false
    t.integer "student_oname",                                                          null: false
    t.boolean "student_foreign",                                        default: false, null: false
    t.date    "student_birthday"
    t.string  "student_birthplace",                    limit: 200
    t.integer "student_citizenship"
    t.string  "student_nation",                        limit: 200
    t.string  "student_pseries",                       limit: 4
    t.string  "student_pnumber",                       limit: 20
    t.date    "student_pdate"
    t.text    "student_pdepartment",                   limit: 16777215
    t.string  "student_pcode",                         limit: 20
    t.string  "student_pforeign",                      limit: 200
    t.integer "student_married"
    t.integer "student_army"
    t.string  "student_army_voenkom",                  limit: 300
    t.integer "student_benefits"
    t.string  "student_ticket",                        limit: 200
    t.string  "student_profkom",                       limit: 200
    t.integer "student_region",                                         default: 1,     null: false
    t.string  "student_registration_region",           limit: 200
    t.string  "student_registration_zip",              limit: 10
    t.text    "student_registration_address",          limit: 16777215
    t.string  "student_residence_region",              limit: 200
    t.string  "student_residence_zip",                 limit: 10
    t.text    "student_residence_address",             limit: 16777215
    t.string  "student_phone_home",                    limit: 45
    t.string  "student_phone_mobile",                  limit: 45
    t.string  "student_email",                         limit: 300
    t.integer "student_room"
    t.integer "student_hostel_temp"
    t.integer "student_hostel_status",                                  default: 1,     null: false
    t.date    "student_hostel_date"
    t.string  "student_hostel_registration_number",    limit: 200
    t.date    "student_hostel_registration_startdate"
    t.date    "student_hostel_registration_date"
    t.string  "student_hostel_contract_number",        limit: 200
    t.date    "student_hostel_contract_startdate"
    t.date    "student_hostel_contract_date"
    t.date    "student_hostel_payment_date"
    t.string  "student_mother_name",                   limit: 300
    t.string  "student_mother_phone",                  limit: 300
    t.string  "student_father_name",                   limit: 300
    t.string  "student_father_phone",                  limit: 300
    t.text    "student_commentary",                    limit: 16777215
    t.integer "student_balance_temp"
    t.string  "last_name_hint"
    t.string  "first_name_hint"
    t.string  "patronym_hint"
  end

  add_index "student", ["student_fname"], name: "studentFname", using: :btree
  add_index "student", ["student_iname"], name: "studentIname", using: :btree
  add_index "student", ["student_oname"], name: "studentOname", using: :btree
  add_index "student", ["student_room"], name: "studentRoom", using: :btree

  create_table "student_group", primary_key: "student_group_id", force: true do |t|
    t.integer "student_group_student",                                                               null: false
    t.integer "student_group_infin"
    t.integer "student_group_oldstudent",                                                            null: false
    t.integer "student_group_group",                                                                 null: false
    t.integer "student_group_yearin"
    t.integer "student_group_oldgroup",                                                              null: false
    t.string  "student_group_record",              limit: 11
    t.integer "student_group_tax",                                                     default: 1,   null: false
    t.text    "student_group_contract_customer"
    t.integer "student_group_status",                                                  default: 1,   null: false
    t.integer "student_group_speciality"
    t.integer "student_group_form"
    t.string  "student_group_abit",                limit: 100
    t.string  "student_group_abit_contract"
    t.date    "student_group_abitdate"
    t.integer "student_group_abitpoints"
    t.string  "student_group_a_school"
    t.integer "student_group_a_abit_id"
    t.integer "student_group_a_human_id"
    t.integer "student_group_a_naprav"
    t.integer "student_group_a_region_id"
    t.integer "student_group_a_state_line"
    t.integer "student_group_a_profile_mark"
    t.integer "student_group_a_contract_number"
    t.integer "student_group_a_accept"
    t.integer "student_group_a_accept_type"
    t.integer "student_group_a_stags"
    t.integer "student_group_a_olymp"
    t.integer "student_group_a_school_id"
    t.integer "student_group_a_dr_gos"
    t.integer "student_group_a_finish_year"
    t.string  "student_group_a_att_num",           limit: 25
    t.date    "student_group_a_att_date"
    t.integer "student_group_a_flang_id"
    t.integer "student_group_a_kurs"
    t.string  "student_group_a_kurs_num",          limit: 50
    t.integer "student_group_a_stago"
    t.integer "student_group_a_right_id"
    t.string  "student_group_a_marks",             limit: 30
    t.string  "student_group_a_sert_nums"
    t.string  "student_group_a_exam_types",        limit: 30
    t.string  "student_group_a_subjects",          limit: 30
    t.integer "student_group_p_author"
    t.integer "student_group_p_controller"
    t.text    "student_group_rejected"
    t.integer "student_group_rejected_department"
    t.decimal "student_group_vbalance",                        precision: 9, scale: 2, default: 0.0, null: false
    t.decimal "student_group_balance",                         precision: 9, scale: 2, default: 0.0, null: false
  end

  add_index "student_group", ["student_group_group"], name: "studentGroupGroup", using: :btree
  add_index "student_group", ["student_group_status"], name: "studentGroupStatus", using: :btree
  add_index "student_group", ["student_group_student"], name: "student_group_student", using: :btree

  create_table "student_quality", id: false, force: true do |t|
    t.integer "student_quality_student", null: false
    t.integer "student_quality_year",    null: false
    t.integer "student_quality_term",    null: false
    t.integer "student_quality_quality"
  end

  create_table "study_marks", force: true do |t|
    t.integer  "subject_id"
    t.integer  "student_id",             null: false
    t.integer  "mark",                   null: false
    t.integer  "user_id",                null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "retake",     default: 0, null: false
  end

  add_index "study_marks", ["user_id"], name: "index_study_marks_on_user_id", using: :btree

  create_table "study_subjects", force: true do |t|
    t.integer  "year",       null: false
    t.integer  "semester",   null: false
    t.integer  "group_id",   null: false
    t.string   "title",      null: false
    t.integer  "kind",       null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "study_subjects", ["group_id"], name: "index_study_subjects_on_group_id", using: :btree
  add_index "study_subjects", ["user_id"], name: "index_study_subjects_on_user_id", using: :btree

  create_table "subdepartment", primary_key: "subdepartment_id", force: true do |t|
    t.string  "subdepartment_name",       limit: 400, null: false
    t.string  "subdepartment_short_name", limit: 200, null: false
    t.integer "subdepartment_department",             null: false
  end

  add_index "subdepartment", ["subdepartment_department"], name: "subdepartment_department", using: :btree

  create_table "subject", primary_key: "subject_id", force: true do |t|
    t.string  "subject_name",     limit: 600,                 null: false
    t.integer "subject_teacher"
    t.integer "subject_semester",                             null: false
    t.integer "subject_year",                                 null: false
    t.integer "subject_group",                                null: false
    t.boolean "subject_brs",                  default: false
  end

  add_index "subject", ["subject_group"], name: "subject_group", using: :btree

  create_table "subject_teacher", id: false, force: true do |t|
    t.integer "subject_id", null: false
    t.integer "teacher_id", null: false
  end

  add_index "subject_teacher", ["teacher_id"], name: "teacher_id", using: :btree

  create_table "support", primary_key: "support_id", force: true do |t|
    t.integer "support_student",     null: false
    t.integer "support_year",        null: false
    t.integer "support_month",       null: false
    t.integer "support_pseries",     null: false
    t.integer "support_pnumber",     null: false
    t.text    "support_pdate",       null: false
    t.text    "support_pdepartment", null: false
    t.text    "support_pbirthday",   null: false
    t.text    "support_paddress",    null: false
    t.text    "support_pphone",      null: false
  end

  create_table "support_cause", primary_key: "support_cause_id", force: true do |t|
    t.text "support_cause_title",    null: false
    t.text "support_cause_pattern",  null: false
    t.text "support_cause_patternf"
  end

  create_table "support_cause_reason", primary_key: "support_cause_reason_id", force: true do |t|
    t.integer "support_cause_reason_cause",  null: false
    t.integer "support_cause_reason_reason", null: false
  end

  create_table "support_options", primary_key: "support_options_id", force: true do |t|
    t.integer "support_options_support", null: false
    t.integer "support_options_cause",   null: false
  end

  create_table "support_reason", primary_key: "support_reason_id", force: true do |t|
    t.text "support_reason_pattern"
  end

  create_table "teacher", primary_key: "teacher_id", force: true do |t|
    t.integer "teacher_fname",         null: false
    t.integer "teacher_iname",         null: false
    t.integer "teacher_oname",         null: false
    t.integer "teacher_subdepartment", null: false
    t.integer "teacher_department"
  end

  add_index "teacher", ["teacher_department"], name: "teacher_department", using: :btree
  add_index "teacher", ["teacher_subdepartment"], name: "teacher_subdepartment", using: :btree

  create_table "template", primary_key: "template_id", force: true do |t|
    t.string  "template_name",             limit: 200,                     null: false
    t.string  "template_title",            limit: 500
    t.boolean "template_one",                          default: false,     null: false
    t.boolean "template_several",                      default: false,     null: false
    t.integer "template_hostel",                       default: 0,         null: false
    t.string  "template_role",             limit: 200, default: "faculty", null: false
    t.boolean "template_active",                                           null: false
    t.integer "template_sign"
    t.string  "template_endorsement",      limit: 200
    t.boolean "template_virtual",                      default: false,     null: false
    t.boolean "template_check_form",                   default: true,      null: false
    t.boolean "template_check_tax",                    default: true,      null: false
    t.boolean "template_check_speciality",             default: true,      null: false
    t.boolean "template_check_course",                 default: true,      null: false
  end

  create_table "template_cause", primary_key: "template_cause_id", force: true do |t|
    t.integer "template_cause_template",                              null: false
    t.text    "template_cause_pattern",  limit: 16777215
    t.text    "template_cause_patternf", limit: 16777215
    t.integer "template_cause_active",                    default: 1, null: false
  end

  add_index "template_cause", ["template_cause_template"], name: "template_cause_template", using: :btree

  create_table "template_reason", primary_key: "template_reason_id", force: true do |t|
    t.integer "template_reason_template",                  null: false
    t.text    "template_reason_pattern",  limit: 16777215, null: false
  end

  add_index "template_reason", ["template_reason_template"], name: "template_reason_template", using: :btree

  create_table "user", primary_key: "user_id", force: true do |t|
    t.boolean  "user_active",                        default: true,   null: false
    t.boolean  "user_enabled",                       default: true,   null: false
    t.string   "user_login",             limit: 200,                  null: false
    t.string   "user_password",          limit: 200,                  null: false
    t.date     "user_password_cdate"
    t.string   "user_email",             limit: 200
    t.string   "user_name"
    t.integer  "user_fname"
    t.integer  "user_iname"
    t.integer  "user_oname"
    t.string   "user_role",              limit: 200, default: "user", null: false
    t.integer  "user_department"
    t.integer  "user_faculty"
    t.string   "user_position",          limit: 200
    t.string   "user_position_short",    limit: 200
    t.integer  "user_subdepartment"
    t.string   "user_phone",             limit: 200
    t.string   "encrypted_password",                 default: "",     null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user", ["reset_password_token"], name: "index_user_on_reset_password_token", unique: true, using: :btree
  add_index "user", ["user_department"], name: "user_department", using: :btree

