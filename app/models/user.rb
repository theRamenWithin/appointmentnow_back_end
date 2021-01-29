class User < ApplicationRecord
    has_many :bookings
    has_one :address
    has_secure_password

    validates :firstName, presence: true
    validates :lastName, presence: true
    validates :mobile, presence: true
    validates :mobile, uniqueness: true
    validates :email, presence: true
    validates :email, uniqueness: true
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    end
end
