class PersonCompany < ActiveRecord::Base
  belongs_to :person
  belongs_to :company
  attr_accessible :active, :company_id
end
