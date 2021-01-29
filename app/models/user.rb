class User < ApplicationRecord
    has_many :bookings
    has_one :address
    has_secure_password

    validates :username, presence: true, uniqueness: true
    validates :mobile, presence: true, uniqueness: true
    validates :email, uniqueness: true, presence: true
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end
