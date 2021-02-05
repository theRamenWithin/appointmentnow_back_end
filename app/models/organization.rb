class Organization < ApplicationRecord
    has_one :address
    has_many :events
    has_many :bookings, through: :events
    has_one_attached :orglogo
end
