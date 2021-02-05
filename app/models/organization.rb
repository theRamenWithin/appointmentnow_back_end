class Organization < ApplicationRecord
    has_many :events
    has_one :address
    has_many :bookings, through: :events

    
end
