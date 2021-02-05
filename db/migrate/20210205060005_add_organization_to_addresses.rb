class AddOrganizationToAddresses < ActiveRecord::Migration[6.1]
  def change
    add_reference :addresses, :organization, null: true, foreign_key: true
  end
end
