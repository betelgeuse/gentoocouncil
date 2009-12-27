class HoboMigration1 < ActiveRecord::Migration
  def self.up
    add_column :votes, :question_id, :integer

    add_index :votes, [:question_id]
  end

  def self.down
    remove_column :votes, :question_id

    remove_index :votes, :name => :index_votes_on_question_id
  end
end
