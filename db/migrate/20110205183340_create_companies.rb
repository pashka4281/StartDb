class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |t|
      t.string   :name
      t.integer  :category_id
      t.text     :description
      t.string   :website
      t.string   :blog
      t.string   :blog_feed
      t.string   :phone
      t.integer  :employers
      t.string   :city
      t.integer  :country_id
      t.datetime :founded_at
      t.boolean  :not_known

      t.timestamps

      #paperclip fields for avatar
      t.string   :picture_file_name
      t.string   :picture_content_type
      t.integer  :picture_file_size
      t.datetime :picture_updated_at
    end

    add_index :companies, [:name, :created_at]
  end

  def self.down
    drop_table :companies
  end
end
