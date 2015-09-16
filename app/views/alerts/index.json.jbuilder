json.type "FeatureCollection"
json.features @alerts do |alert|
  json.type "Feature"
  json.geometry do
    json.type "Point"
    json.coordinates [alert.longitude,alert.latitude]
  end
  json.properties do
    json.name alert.email
    json.type alert.alert_type
    json.url alert_url(alert, format: :json)
  end
end