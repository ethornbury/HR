class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :firstname
      t.string :lastname
      t.integer :leaveAllowance
      t.string :jobType
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
