class AddRoleToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :role, :string, :limit => 20, :default => :guest
    remove_column :users, :administrator
  end

  def self.down
    remove_column :users, :role
    add_column :users, :administrator, :boolean, :default => false
  end
end
