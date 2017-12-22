class AddSuperAdminToAdminUser < ActiveRecord::Migration[5.0]
  def up
    add_column :admin_users, :superadmin, :boolean, :null => false, :default => false

    AdminUser.create! do |r|
      r.email      = 'admin@example.com'
      r.password   = 'password'
      r.superadmin = true
    end
  end

  def down
    remove_column :admin_users, :superadmin
    User.find_by_email('admin@example.com').try(:delete)
  end
end
