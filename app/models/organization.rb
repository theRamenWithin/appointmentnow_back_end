class Organization < ApplicationRecord
    has_one :address
    has_many :events
    has_many :bookings, through: :events
end
