class JobCompany < Job
  validates :position, :location, :description, :applying_instructions, :presence => true
  belongs_to :company
end
