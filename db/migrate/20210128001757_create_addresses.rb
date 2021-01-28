class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.text :addressLine1
      t.text :addressLine2
      t.text :city
      t.text :state
      t.text :country
      t.integer :postcode

      t.timestamps
    end
  end
end
