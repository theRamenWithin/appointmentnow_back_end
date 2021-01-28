json.extract! address, :id, :addressLine1, :addressLine2, :city, :state, :country, :postcode, :created_at, :updated_at
json.url address_url(address, format: :json)
