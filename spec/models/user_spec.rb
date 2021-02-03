require 'rails_helper'
# TEST FOR USER CREATION
RSpec.describe User, type: :model do
    context 'New User' do
        it 'must create a user' do
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
                    first_name: 'Test',
                    last_name: 'RSpec',
                    mobile: 55555555,
                    email: 'rspec@gmail.com',
                    password_digest: User.digest('password'),
                    username: 'rspec',
                    address_id: @address.id
                )
                @user.save
                puts "#{i + 1} user created"
            end
            expect(User.last.first_name).to eq('Test')
        end
    end
end