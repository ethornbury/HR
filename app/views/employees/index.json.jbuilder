json.array!(@employees) do |employee|
  json.extract! employee, :id, :firstname, :lastname, :leaveAllowance, :jobType, :admin
  json.url employee_url(employee, format: :json)
end
