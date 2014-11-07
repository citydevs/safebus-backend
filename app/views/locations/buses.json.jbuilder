json.array!(@buses) do |bus|
  json.extract! bus, :id, :placa, :name, :route, :most_recent_location
  json.url bus_url(bus, format: :json)
end
