class AddNotifyInAdvanceToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :notify_in_advance, :integer, :default => 0
  end

  def self.down
    remove_column :users, :notify_in_advance
  end
end
