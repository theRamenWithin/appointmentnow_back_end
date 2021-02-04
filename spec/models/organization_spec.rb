require 'rails_helper'
# TEST FOR ORGANIZATION CREATION
RSpec.describe Organization, type: :model do
    context 'New Organization' do
        it 'must create an Organization' do
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
            
                @organization = Organization.new(
                    organization_name: 'Organization Test',
                    description: 'Handy Andy Fixes Stuff PTY LTD',
                    phone: 55555554,
                    email: 'handyandybusiness@gmail.com',
                    website: 'http://test.com',
                    address_id: @address.id,
                )
                @organization.save
                puts "#{i + 1} organization created"
            end
            expect(Organization.last.organization_name).to eq('Organization Test')
        end
    end
end