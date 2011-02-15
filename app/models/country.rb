class Country < ActiveRecord::Base
  validates :name, :presence=>true
  has_many :people
  has_many :companies
end
