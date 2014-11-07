json.array!(@clients) do |client|
  json.extract! client, :id, :email, :reg_id, :device
  json.url client_url(client, format: :json)
end
