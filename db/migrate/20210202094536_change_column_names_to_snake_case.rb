class ChangeColumnNamesToSnakeCase < ActiveRecord::Migration[6.1]
  def change
    change_table :addresses do |t|
      t.rename :addressLine1, :address_line_1
      t.rename :addressLine2, :address_line_2
    end

    change_table :bookings do |t|
      t.rename :startTime, :start_time
      t.rename :endTime, :end_time
      t.rename :multipleCustomers, :multiple_customers
      t.rename :customerLimit, :customer_limit
    end

    change_table :organizations do |t|
      t.rename :organizationName, :organization_name
    end

    change_table :users do |t|
      t.rename :firstName, :first_name
      t.rename :lastName, :last_name
    end
  end
end
