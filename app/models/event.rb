class Event < ApplicationRecord
    belongs_to :organization
    has_many :bookings
    has_one_attached :eventimage
end
