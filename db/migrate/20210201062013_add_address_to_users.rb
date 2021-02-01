class AddAddressToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :address, null: true, foreign_key: true
  end
end
