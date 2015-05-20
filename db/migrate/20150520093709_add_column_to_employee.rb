class AddColumnToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :email, :string, default: "", null: false, unique: true
    add_reference :employees, :user, index: true
  end
end
