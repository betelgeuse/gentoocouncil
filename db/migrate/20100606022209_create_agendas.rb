class CreateAgendas < ActiveRecord::Migration
  def self.up
    create_table :agendas do |t|
      t.string   :name
      t.text     :description
      t.datetime :start_at
      t.datetime :end_at
      t.string   :location
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :owner_id
    end
    add_index :agendas, [:owner_id]
  end

  def self.down
    drop_table :agendas
  end
end
