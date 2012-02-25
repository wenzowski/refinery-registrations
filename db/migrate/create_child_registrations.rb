class CreateChildRegistrations < ActiveRecord::Migration

  def self.up
    create_table :child_registrations do |t|
      t.integer :registration_id
      t.integer :child_id
      t.integer :educational_stage_id

      t.timestamps
    end

    add_index :child_registrations, :id
    add_index :child_registrations, :registration_id
    add_index :child_registrations, :child_id
    add_index :child_registrations, :educational_stage_id
  end

  def self.down
    drop_table :child_registrations
  end

end
