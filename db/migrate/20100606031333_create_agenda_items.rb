class CreateAgendaItems < ActiveRecord::Migration
  def self.up
    create_table :agenda_items do |t|
      t.string   :name
      t.text     :description
      t.boolean  :approved, :default => false
      t.text     :reason_of_disapproval
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :owner_id
      t.integer  :approved_by_id
      t.integer  :agenda_id
    end
    add_index :agenda_items, [:owner_id]
    add_index :agenda_items, [:approved_by_id]
    add_index :agenda_items, [:agenda_id]
  end

  def self.down
    drop_table :agenda_items
  end
end
