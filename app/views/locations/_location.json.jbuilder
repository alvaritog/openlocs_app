json.extract! location, :id, :address, :lat, :lon, :created_at, :updated_at
json.url location_url(location, format: :json)
