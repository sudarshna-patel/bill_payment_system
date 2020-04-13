class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string  :attributeName
      t.string  :displayName
      t.string  :dataType
      t.integer :minLength
      t.integer :maxLength
      t.boolean :isMandatory
      t.timestamps
    end
  end
end
