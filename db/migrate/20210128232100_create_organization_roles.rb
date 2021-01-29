class CreateOrganizationRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :organization_roles do |t|
      t.references :organization, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :role

      t.timestamps
    end
  end
end
