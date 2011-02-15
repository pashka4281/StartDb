class Category < ActiveRecord::Base
  has_many :companies

  def regectable?
    name == 'Other'
  end
end
