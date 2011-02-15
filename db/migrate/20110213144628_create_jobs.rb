class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.string  :type
      t.integer :user_id
      #job_company
      t.integer  :company_id
      t.string   :position
      t.string   :location
      t.boolean  :full_time
      t.text     :description
      t.string   :compensation
      t.string   :applying_instructions

      t.datetime :last_application_date
      
      #job_person
      t.integer  :person_id
      t.boolean  :cofounders
      t.text     :skill_set
      t.text     :ideal_skill_set
      t.text     :area_of_interests
      t.text     :other_comments
      t.string   :location
      

      t.timestamps
    end
  end

  def self.down
    drop_table :jobs
  end
end
