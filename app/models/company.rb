class Company < ActiveRecord::Base
  has_many :people, :through => :person_companies
  has_many :person_companies
  has_many :job_companies
  belongs_to :country
  belongs_to :category
  
  has_attached_file :picture, :styles => { :big => "225x215>", :thumb => "70x35>" },
     :url=>'/images/companies/:id/:style/:filename',
     :default_url=>'/images/no_image_:style.png'
  validates_attachment_size :picture, :less_than => 1.megabyte
  validates_attachment_content_type :picture, :content_type => ['image/jpeg', 'image/png', 'image/gif']

  validates :name, :presence => true
  validates :employers, :numericality => true

  def current_people
    person_companies.select{|x| x if x.active}.collect{|x| x.person}.compact
  end

  def self.search(word)
    self.where(:name.matches => "#{word}%")
  end
#  define_index do
#    indexes :name
#  end


  before_save :set_category

  private

  def set_category
    self.category = Category.find_by_name('Other') if !self.category
  end
end
