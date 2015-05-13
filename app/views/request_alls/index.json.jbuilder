json.array!(@request_alls) do |request_all|
  json.extract! request_all, :id, :type, :startDate, :endDate, :status
  json.url request_all_url(request_all, format: :json)
end
