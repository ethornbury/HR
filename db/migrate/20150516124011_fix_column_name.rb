class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :requests, :type, :description
  end
end
