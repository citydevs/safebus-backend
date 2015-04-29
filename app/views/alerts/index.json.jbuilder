json.array!(@alerts) do |alert|
  json.extract! alert, :id, :alert_type, :latitude, :longitude, :client_id
  json.url alert_url(alert, format: :json)
end
