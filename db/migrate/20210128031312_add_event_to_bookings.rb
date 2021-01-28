class AddEventToBookings < ActiveRecord::Migration[6.1]
  def change
    add_reference :bookings, :event, null: false, foreign_key: true
  end
end
