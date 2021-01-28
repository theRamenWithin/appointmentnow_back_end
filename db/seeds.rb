require "faker"

100.times do 
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
# Bookings, how do I fake the user and event bit?
# 100.times do
#     bookings = Booking.new(
#         startTime:
#         endTime:
#         multipleCustomers:
#         customerLimit:

#     )

#     bookings.save

# end
# likewise, how do I save the user bit
# 100.times do
#     events = Event.new(
#         title:
#         description:
#         date:
#     )
    
#     event.save

# end

# 100.times do
#     organizations = Organization.new(
#         organizationName: Faker::Company.name,
#         description: Faker::Company.catch_phrase,
#         phone: Faker::PhoneNumber.phone_number,
#         email: Faker::Internet.email
#     )
    
#     organizations.save

# end

# 100.times do
#     users = Users.new(
#         firstName: Faker::Name.first_name,
#         lastName: Faker::Name.last_name,
#         mobile: Faker::PhoneNumber.cell_phone,
#         email: Faker::Internet.email

#     )

# end

# 100.times do 

# end

