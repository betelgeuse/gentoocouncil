class CreateAttendances < ActiveRecord::Migration
  def self.up
		create_table :attendances, :id => false do |t|
			t.integer :user_id
			t.integer :agenda_id
			t.timestamps
		end
		add_index :attendances, [:agenda_id]
		add_index :attendances, [:user_id]
  end

  def self.down
		drop_table :attendances
  end
end
