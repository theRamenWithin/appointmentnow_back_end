class Organization < ApplicationRecord
    has_many :events
    has_many :bookings, through: :events

    
end
