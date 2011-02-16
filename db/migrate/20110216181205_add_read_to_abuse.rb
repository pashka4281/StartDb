class AddReadToAbuse < ActiveRecord::Migration
  def self.up
    add_column :abuses, :was_read, :boolean, :default => false
  end

  def self.down
    remove_column :abuses, :was_read
  end
end
