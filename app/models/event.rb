class Event < ActiveRecord::Base
  validates :name, :address, :presence => true
  validate :valid_date?

  belongs_to :user

  scope :available, where('taken_at > ?', Time.now)


  def valid_date?
    unless self.taken_at > Time.now
      errors.add("Date taken", "expired")
    end
  end
end
