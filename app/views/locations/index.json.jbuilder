json.array!(@locations) do |location|
  json.extract! location, :id, :lat, :lng, :updated_at
  json.bus location.bus, :placa, :name, :route
  json.url location_url(location, format: :json)
end
