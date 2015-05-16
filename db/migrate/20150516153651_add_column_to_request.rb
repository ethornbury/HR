class AddColumnToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :request_type_id, :integer
    add_column :requests, :request_desc, :string
  end
end
