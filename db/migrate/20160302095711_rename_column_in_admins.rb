class RenameColumnInAdmins < ActiveRecord::Migration
  def change
    rename_column :admins, :admin_id, :user_id
  end
end
