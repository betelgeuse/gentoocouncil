class CreateDoodle < ActiveRecord::Migration
  def self.up
    create_table :doodles do |t|
      t.string   :name
      t.text     :description
      t.string   :url
      t.string   :admin_url
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :owner_id
      t.integer  :agenda_id
    end
    add_index :doodles, [:owner_id]
    add_index :doodles, [:agenda_id]
  end

  def self.down
    drop_table :doodles
  end
end
