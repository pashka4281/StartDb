class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string   :name
      t.string   :venue
      t.string   :address
      t.text     :description
      t.string   :cost
      t.string   :website
      t.datetime :taken_at
      t.integer  :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
