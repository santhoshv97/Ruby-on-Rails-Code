class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :addresscode
      t.string :street
      t.string :district
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
