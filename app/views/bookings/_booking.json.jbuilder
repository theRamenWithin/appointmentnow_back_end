json.extract! booking, :id, :startTime, :endTime, :multipleCustomers, :customerLimit, :created_at, :updated_at
json.url booking_url(booking, format: :json)
