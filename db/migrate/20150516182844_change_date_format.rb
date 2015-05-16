class ChangeDateFormat < ActiveRecord::Migration
  def change
    change_column :requests, :startDate, :date
  end
end
