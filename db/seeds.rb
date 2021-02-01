require "faker"

20.times do |i|
    @address = Address.new(
        addressLine1: Faker::Address.street_address,
        addressLine2: Faker::Address.secondary_address,
        city: Faker::Address.city,
        state: Faker::Address.state,
        country: Faker::Address.country,
        postcode: Faker::Address.postcode,
    )
    @address.save
    puts "#{i} address created"

    @user = User.new(
        firstName: Faker::Name.first_name,
        lastName: Faker::Name.last_name,
        mobile: Faker::PhoneNumber.cell_phone,
        email: Faker::Internet.email,
        password_digest: 'password',
        username: Faker::Internet.username,
        address_id: @address.id
    )
    @user.save
    puts "#{i} user created"

    @organization = Organization.new(
        organizationName: Faker::Company.name,
        description: Faker::Company.catch_phrase,
        phone: Faker::PhoneNumber.phone_number,
        email: Faker::Internet.email,
        address_id: @address.id
    )
    @organization.save
    puts "#{i} organization created"
end

