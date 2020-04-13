class CreateBills < ActiveRecord::Migration[6.0]
  def change
    create_table :bills do |t|
      t.datetime  :generatedOn
      t.datetime  :dueDate
      t.string    :recurrence
      t.string    :billType
      t.string    :billerBillID
      t.string    :billerCategory
      t.string    :billerProductInstanceID
      t.string    :amountExactness
      t.hstore    :customer, default: {}
      t.hstore    :customerAccount, default: {}
      t.hstore    :validationRules, default: {}
      t.hstore    :aggregates, default: {}
      t.hstore    :discounts, array: true, default: []
      t.hstore    :fees, array: true, default: []
      t.hstore    :items, array: true, default: []
      t.hstore    :taxes, array: true, default: []

      t.timestamps
    end
  end
end
