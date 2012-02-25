class CreateChildren < ActiveRecord::Migration

  def self.up
    create_table :children do |t|
      t.integer :parent_id
      t.string :name
      t.date :birth
      t.string :gender

      t.timestamps
    end

    add_index :children, :id
  end

  def self.down
    drop_table :children
  end

end
