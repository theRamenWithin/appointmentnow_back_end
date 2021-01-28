class CreateOrganizations < ActiveRecord::Migration[6.1]
  def change
    create_table :organizations do |t|
      t.text :organizationName
      t.text :description
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
