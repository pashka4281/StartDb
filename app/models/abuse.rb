class Abuse < ActiveRecord::Base
  validates :abusable_type, :inclusion => { :in => ['Person', 'Company', 'Job']}
end
