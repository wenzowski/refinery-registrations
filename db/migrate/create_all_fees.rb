class CreateAllFees < ActiveRecord::Migration

  def self.up
    create_table :fees do |t|
      t.integer :cents, default: 0, null: false
      t.string :currency, null: false
      t.integer :billable_id
      t.string :billable_type

      t.timestamps
    end

    add_index :fees, :id
    add_index :fees, :billable_id
    add_index :fees, :billable_type
  end

  def self.down
    drop_table :fees
  end

end
