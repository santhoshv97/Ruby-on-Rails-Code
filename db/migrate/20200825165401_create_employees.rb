class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.integer :empid
      t.string :empname
      t.integer :empsalary
      t.integer :empage

      t.timestamps
    end
  end
end
