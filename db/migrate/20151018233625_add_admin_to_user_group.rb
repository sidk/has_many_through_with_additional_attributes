class AddAdminToUserGroup < ActiveRecord::Migration
  def change
    add_column :user_groups, :admin, :boolean
  end
end
