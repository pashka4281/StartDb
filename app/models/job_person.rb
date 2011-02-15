class JobPerson < Job
  validates :skill_set, :ideal_skill_set, :area_of_interests, :location, :presence => true
  belongs_to :person
end
