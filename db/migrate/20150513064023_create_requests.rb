class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :type
      t.datetime :startDate
      t.datetime :endDate
      t.string :status
      t.references :Employee, index: true

      t.timestamps
    end
  end
end
