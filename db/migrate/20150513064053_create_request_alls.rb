class CreateRequestAlls < ActiveRecord::Migration
  def change
    create_table :request_alls do |t|
      t.string :type
      t.datetime :startDate
      t.datetime :endDate
      t.string :status

      t.timestamps
    end
  end
end
