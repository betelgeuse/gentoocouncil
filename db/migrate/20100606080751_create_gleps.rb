class CreateGleps < ActiveRecord::Migration
  def self.up
    create_table :gleps do |t|
      t.string   :name
      t.text     :description
      t.string   :status, :default => :pending, :limit => 20
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :owner_id
    end
    add_index :gleps, [:owner_id]
  end

  def self.down
    drop_table :gleps
  end
end
