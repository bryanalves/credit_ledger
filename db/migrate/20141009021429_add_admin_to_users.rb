class AddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :string, default: 'user', null: false
  end
end
