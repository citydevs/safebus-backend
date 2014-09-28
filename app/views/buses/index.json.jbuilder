json.array!(@buses) do |bus|
  json.extract! bus, :id, :placa, :name, :route, :locations
  json.url bus_url(bus, format: :json)
end
