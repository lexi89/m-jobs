class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.integer :admin_id
      t.integer :company_id

      t.timestamps null: false
    end
    add_index :admins, :company_id
    add_index :admins, :admin_id
    add_index :admins, [:company_id, :admin_id]
  end
end
