require "faker"

# Creation of Fake Users and Addresses
20.times do |i|
    @address = Address.new(
        address_line_1: Faker::Address.street_address,
        address_line_2: Faker::Address.secondary_address,
        city: Faker::Address.city,
        state: Faker::Address.state,
        country: Faker::Address.country,
        postcode: Faker::Address.postcode,
    )
    @address.save
    puts "#{i + 1} address created"

    @user = User.new(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        mobile: Faker::PhoneNumber.cell_phone,
        email: Faker::Internet.email,
        password_digest: User.digest('password'),
        username: Faker::Internet.username,
        address_id: @address.id
    )
    @user.save
    puts "#{i + 1} user created"

    @organization = Organization.new(
        organization_name: Faker::Company.name,
        description: Faker::Company.catch_phrase,
        phone: Faker::PhoneNumber.phone_number,
        email: Faker::Internet.email,
        address_id: @address.id,
        website: Faker::Internet.url
    )
    @organization.save
    puts "#{i + 1} organization created"
end
# Creation of Fake Admin: Handy Andy
1.times do |i|
    @address = Address.new(
        address_line_1: '1 Test Way',
        address_line_2: 'Unit 1',
        city: 'London',
        state: 'England',
        country: 'United Kingdom',
        postcode: 'W1 9AH'
    )
    @address.save
    puts "#{i + 1} address created"

    @user = User.new(
        first_name: 'Handy',
        last_name: 'Andy',
        mobile: 55555555,
        email: 'handyandy@gmail.com',
        password_digest: User.digest('password'),
        username: 'admin',
        address_id: @address.id
    )
    @user.save
    puts "#{i + 1} user created"

    @organization = Organization.new(
        organization_name: 'Handy Andy Fixes',
        description: 'Handy Andy Fixes Stuff PTY LTD',
        phone: 55555554,
        email: 'handyandybusiness@gmail.com',
        address_id: @address.id,
    )
    @organization.save
    puts "#{i + 1} organization created"

    @organization_role = OrganizationRole.new(
        organization_id: @organization.id,
        user_id: @user.id,
        role: 2
    )
    @organization_role.save
    puts "#{i +1} organization role created"
end
# Creation of Fake Manager
1.times do |i|
    @address = Address.new(
        address_line_1: Faker::Address.street_address,
        address_line_2: Faker::Address.secondary_address,
        city: Faker::Address.city,
        state: Faker::Address.state,
        country: Faker::Address.country,
        postcode: Faker::Address.postcode,
    )
    @address.save
    puts "#{i +1} address created"

    @user = User.new(
        first_name: 'Offsider',
        last_name: 'Andy',
        mobile: 55555555,
        email: 'offsiderhandyandy@gmail.com',
        password_digest: User.digest('password'),
        username: 'manager',
        address_id: @address.id
    )
    @user.save

    @organization_role = OrganizationRole.new(
        organization_id: 21,
        user_id: @user.id,
        role: 1
    )
    @organization_role.save
    puts "#{i +1} organization role created"
end

# Creates fake event and booking
1.times do |i|
    @event = Event.new(
        title: 'Test Event 1',
        description: 'Event for Testing',
        date: DateTime.now,
        user_id: 19,
        organization_id: 21


    )
    @event.save
    puts "#{i +1} event created"

    @booking = Booking.new(
        start_time: Faker::Time.between(from: DateTime.now, to: DateTime.now + 1),
        end_time: Faker::Time.between(from: DateTime.now + 3, to: DateTime.now + 12),
        user_id: 21,
        event_id: @event.id
    )
    @booking.save
    puts "#{i + 1} booking created"

end