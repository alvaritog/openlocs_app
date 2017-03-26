json.extract! location, :id, :address, :lat, :lon
json.is_open location.open?
json.url location_url(location, format: :json)
