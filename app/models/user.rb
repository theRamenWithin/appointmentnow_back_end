class User < ApplicationRecord
    has_many :bookings
    has_one :address
end
