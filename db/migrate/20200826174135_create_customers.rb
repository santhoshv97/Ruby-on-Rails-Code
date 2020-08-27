class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :customername
      t.integer :customerid
      t.integer :phno
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
