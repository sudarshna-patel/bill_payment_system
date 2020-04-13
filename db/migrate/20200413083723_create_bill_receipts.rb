class CreateBillReceipts < ActiveRecord::Migration[6.0]
  def change
    create_table :bill_receipts do |t|
      t.string  :billerBillID
      t.string  :platformBillID
      t.string  :platformTransactionRefID
      t.string  :uniquePaymentRefID
      t.float   :amountPaid
      t.float   :billAmount
      t.string  :receiptId
      t.timestamps
    end
  end
end
