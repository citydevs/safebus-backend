json.array!(@locations) do |location|
  json.extract! location, :id, :lat, :lng
  json.bus location.bus, :name, :route
  json.url location_url(location, format: :json)
end
