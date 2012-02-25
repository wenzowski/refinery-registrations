class CreateRegistrationSessions < ActiveRecord::Migration

  def self.up
    create_table :registration_sessions do |t|
      t.date :begin
      t.date :end
      t.date :registration_begin
      t.date :registration_end
      t.date :early_registration_end
      t.integer :position

      t.timestamps
    end

    add_index :registration_sessions, :id

    load(Rails.root.join('db', 'seeds', 'registration_sessions.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "registration_sessions"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/registration_sessions"})
    end

    drop_table :registration_sessions
  end

end
