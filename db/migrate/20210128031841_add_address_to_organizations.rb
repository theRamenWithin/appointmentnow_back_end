class AddAddressToOrganizations < ActiveRecord::Migration[6.1]
  def change
    add_reference :organizations, :address, null: false, foreign_key: true
  end
end
