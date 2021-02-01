class RemoveAddressFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_reference :users, :address, null: false, foreign_key: true
  end
end
