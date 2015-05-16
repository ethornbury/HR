class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.datetime :startDate
      t.datetime :endDate
      t.string :status
      t.references :employee, index: true

      t.timestamps
    end
  end
end
