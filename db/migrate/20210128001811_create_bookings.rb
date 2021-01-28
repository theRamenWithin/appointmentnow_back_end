class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.time :startTime
      t.time :endTime
      t.boolean :multipleCustomers
      t.integer :customerLimit

      t.timestamps
    end
  end
end
