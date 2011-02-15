class CreateAbuses < ActiveRecord::Migration
  def self.up
    create_table :abuses do |t|
      t.string :abusable_type
      t.integer :abusable_id

      t.timestamps
    end
  end

  def self.down
    drop_table :abuses
  end
end
