require "faker"

# Creation of Fake Users and Addresses
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
        password_digest: User.digest('password'),
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
# Creation of Fake Admin: Handy Andy
1.times do |i|
    @address = Address.new(
        addressLine1: '1 Test Way',
        addressLine2: 'Unit 1',
        city: 'London',
        state: 'England',
        country: 'United Kingdom',
        postcode: 'W1 9AH'
    )
    @address.save
    puts "#{i} address created"

    @user = User.new(
        firstName: 'Handy',
        lastName: 'Andy',
        mobile: 55555555,
        email: 'handyandy@gmail.com',
        password_digest: User.digest('password'),
        username: 'admin',
        address_id: @address.id
    )
    @user.save
    puts "#{i} user created"

    @organization = Organization.new(
        organizationName: 'Handy Andy Fixes',
        description: 'Handy Andy Fixes Stuff PTY LTD',
        phone: 55555554,
        email: 'handyandybusiness@gmail.com',
        address_id: @address.id,
    )
    @organization.save
    puts "#{i} organization created"

    @organization_role = OrganizationRole.new(
        organization_id: @organization.id,
        user_id: @user.id,
        role: 2
    )
    @organization_role.save
    puts "#{i} organization role created"
end
# Creation of Fake Manager
1.times do |i|
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
        firstName: 'Offsider',
        lastName: 'Andy',
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
    puts "#{i} organization role created"
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
    puts "#{i} event created"

    @booking = Booking.new(
        startTime: Faker::Time.between(from: DateTime.now, to: DateTime.now + 1),
        endTime: Faker::Time.between(from: DateTime.now + 3, to: DateTime.now + 12),
        user_id: 21,
        event_id: @event.id
    )
    @booking.save
    puts "#{i} booking created"

end