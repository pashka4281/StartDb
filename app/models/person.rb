require 'paperclip'

class Person < ActiveRecord::Base
  validates :name, :presence => true
  belongs_to :country
  has_many :job_persons
  has_many :person_companies
  has_many :companies, :through => :person_companies
  
  has_attached_file :picture, :styles => { :big => "225x215>", :thumb => "70x35>" },
    :url=>'/images/people/:id/:style/:filename',
    :default_url=>'/images/no_image_:style.png'
  validates_attachment_size :picture, :less_than => 1.megabyte
  validates_attachment_content_type :picture, :content_type => ['image/jpeg', 'image/png', 'image/gif']


  #returns comma-formated full name
  def full_name
    self.name ? "#{self.name.split(' ')[0..-2].join(' ')}, #{self.name.split(' ')[-1]}" : ''
  end
  
  def person_name
    self.name ? "#{self.name.split(' ')[0..-2].join(' ')} #{self.name.split(' ')[-1]}" : ''
  end

  def person_name=(nm)
    if nm != ''
      if self.new_record?
        self.name = "#{nm.split(' ')[1..-1].join(' ')} #{nm.split(' ')[0]}"
      else
        part_1 = nm.split(' ')[1..-1].join(' ')
        part_2 = nm.split(' ')[0]
        self.name = "#{part_2} #{part_1}"
      end
    else
      self.name = ''
    end
  end

  scope :investors, where(:investor => true)

  def current_companies
    person_companies.select{|x| x if x.active}.collect{|x| x.company}
  end

  def incurrent_companies
    person_companies.select{|x| x if !x.active }.collect{|x| x.company}
  end


  def new_person_companies_attributes=(attr)
    attr.each do |a|
      person_companies.build(a) if (a['company_id'] && !a['_destroy'] == 'true')
    end
  end

  def existing_person_companies_attributes=(attr)
    attr.each do |x, y|
      comp = PersonCompany.find(y['id'])
      comp.update_attributes(:active => y['active'], :company_id => y['company_id'])
      if y['_destroy'] == 'true'
        comp.delete
      end
    end
  end


  def self.search(word)
    self.where(:name.matches => "#{word}%")
  end

#  define_index do
#    indexes :name
#  end


  before_save :set_nationality
  after_save :save_companies

  private

  def set_nationality
    self.country = Country.find_by_name('Other') if !self.country
  end

  def save_companies
    person_companies.each do |comp|
      comp.save(false)
    end
  end
end
