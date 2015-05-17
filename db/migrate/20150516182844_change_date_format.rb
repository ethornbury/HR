class ChangeDateFormat < ActiveRecord::Migration
  def change
    change_column :requests, :startDate, :date
    change_column :requests, :endDate, :date
  end
end
