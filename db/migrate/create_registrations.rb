class CreateRegistrations < ActiveRecord::Migration

  def self.up
    create_table :registrations do |t|
      t.integer :registration_session_id
      t.integer :parent_id
      t.timestamp :terms_accepted
      t.timestamp :paid
      t.integer :position

      t.timestamps
    end

    add_index :registrations, :id

    load(Rails.root.join('db', 'seeds', 'registrations.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({name: 'registrations'})
    end

    if defined?(Page)
      Page.delete_all({link_url: '/registrations'})
      Page.delete_all({link_url: '/registrations/thank_you'})
      Page.delete_all({link_url: '/registrations/terms_of_agreement'})
    end

    drop_table :registrations
  end

end
