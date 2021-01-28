class Booking < ApplicationRecord
    belongs_to :attendee, class_name: 'User'
end
