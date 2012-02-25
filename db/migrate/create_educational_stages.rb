class CreateEducationalStages < ActiveRecord::Migration

  def self.up
    create_table :educational_stages do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end

    add_index :educational_stages, :id

    load(Rails.root.join('db', 'seeds', 'educational_stages.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "educational_stages"})
    end

    drop_table :educational_stages
  end

end
