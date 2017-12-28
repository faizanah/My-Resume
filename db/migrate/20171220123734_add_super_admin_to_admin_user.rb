class AddSuperAdminToAdminUser < ActiveRecord::Migration[5.0]
  def up
    add_column :admin_users, :superadmin, :boolean, :null => false, :default => false
  end

  def down
    remove_column :admin_users, :superadmin
  end
end
