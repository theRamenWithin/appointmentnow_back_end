require "faker"

200.times do 
    addresses = Address.new(
        addressLine1: Faker::Address.street_address,
        addressLine2: Faker::Address.secondary_address,
        city: Faker::Address.city,
        state: Faker::Address.state,
        country: Faker::Address.country,
        postcode: Faker::Address.postcode
    )
    
    addresses.save

end

20.times do
    users = User.new(
        firstName: Faker::Name.first_name,
        lastName: Faker::Name.last_name,
        mobile: Faker::PhoneNumber.cell_phone,
        email: Faker::Internet.email,
        password_digest: 'password',
        address_id: rand(1..100)
    )

    users.save

end

10.times do
    organizations = Organization.new(
        organizationName: Faker::Company.name,
        description: Faker::Company.catch_phrase,
        phone: Faker::PhoneNumber.phone_number,
        email: Faker::Internet.email,
        address_id: rand(1..100)
    )
    
    organizations.save

end

100.times do
    events = Event.new(
        title: Faker::GreekPhilosophers.name,
        description: Faker::Quote.yoda,
        date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
        user_id: rand(1..10),
        organization_id: rand(1..10)
    )
    
    events.save

end


# 50.times do
#     bookings = Booking.new(
#         # startTime: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default),
#         # endTime: Faker::Time.forward(days: 23, period: :morning),
#         multipleCustomers: true,
#         customerLimit: 2,
#         event_id: rand(1..10),
#         user_id: rand(1..10)
#     )

#     bookings.save

# end


# 100.times do 

# end