json.extract! datum, :id, :address, :longitude, :latitude, :description, :created_at, :updated_at
json.url datum_url(datum, format: :json)
