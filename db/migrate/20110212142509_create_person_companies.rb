class CreatePersonCompanies < ActiveRecord::Migration
  def self.up
    create_table :person_companies do |t|
      t.integer :person_id
      t.integer :company_id
      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :person_companies
  end
end
