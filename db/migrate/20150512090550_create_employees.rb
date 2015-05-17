class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :firstname, null: false
      t.string :lastname,  null: false
      t.integer :leaveAllowance
      t.string :jobType
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
