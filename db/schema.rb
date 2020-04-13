# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_13_083723) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "hstore"
  enable_extension "plpgsql"

  create_table "bill_receipts", force: :cascade do |t|
    t.string "billerBillID"
    t.string "platformBillID"
    t.string "platformTransactionRefID"
    t.string "uniquePaymentRefID"
    t.float "amountPaid"
    t.float "billAmount"
    t.string "receiptId"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "bills", force: :cascade do |t|
    t.datetime "generatedOn"
    t.datetime "dueDate"
    t.string "recurrence"
    t.string "billType"
    t.string "billerBillID"
    t.string "billerCategory"
    t.string "billerProductInstanceID"
    t.string "amountExactness"
    t.hstore "customer", default: {}
    t.hstore "customerAccount", default: {}
    t.hstore "validationRules", default: {}
    t.hstore "aggregates", default: {}
    t.hstore "discounts", default: [], array: true
    t.hstore "fees", default: [], array: true
    t.hstore "items", default: [], array: true
    t.hstore "taxes", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "attributeName"
    t.string "displayName"
    t.string "name"
    t.string "dataType"
    t.integer "minLength"
    t.integer "maxLength"
    t.boolean "isMandatory"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
