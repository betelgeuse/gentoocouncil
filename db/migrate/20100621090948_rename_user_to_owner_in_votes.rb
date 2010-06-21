class RenameUserToOwnerInVotes < ActiveRecord::Migration
  def self.up
    rename_column :votes, :user_id, :owner_id

    remove_index :votes, :name => :index_votes_on_user_id rescue ActiveRecord::StatementInvalid
    add_index :votes, [:owner_id]
  end

  def self.down
    rename_column :votes, :owner_id, :user_id

    remove_index :votes, :name => :index_votes_on_owner_id rescue ActiveRecord::StatementInvalid
    add_index :votes, [:user_id]
  end
end
