class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.integer :company_id
      t.string  :name
      t.text    :overview
      t.text    :academic_degrees
      t.integer :country_id
      t.string  :blog_feed

      t.string  :link1_name
      t.string  :link1_url

      t.string  :link2_name
      t.string  :link2_url

      t.string  :link3_name
      t.string  :link3_url

      t.string  :link4_name
      t.string  :link4_url

      t.boolean :investor, :default => false

      t.timestamps
      
      #paperclip fields for avatar
      t.string   :picture_file_name
      t.string   :picture_content_type
      t.integer  :picture_file_size
      t.datetime :picture_updated_at
    end

    add_index :people, [:name, :created_at]
  end

  def self.down
    drop_table :people
  end
end
