require 'faker'

countries = ['Denmark', 'Estonia', 'Finland', 'Iceland', 'Latvia', 'Lithuania', 'Norway', 'Other', 'Russia', 'Sweden']

Country.delete_all
countries.each{|c| Country.create(:name => c)}
puts 'Countries created'

#Person.delete_all
#100.times do
#  inv = rand(10) > 5
#  Person.create(:person_name=> Faker::Name.name, :investor => inv)
#end
#puts 'people created'

Category.delete_all
Category.create(:name => 'Web Services')
Category.create(:name => 'Software')
Category.create(:name => 'Hardware')
Category.create(:name => 'Mobile')
Category.create(:name => 'Cleantech')
Category.create(:name => 'Biotech')
Category.create(:name => 'Investor')
Category.create(:name => 'Service provider')
Category.create(:name => 'Other')

puts 'categories created'

User.create(:name => "Admin", :email => "admin@admin.com", :password => "admin123", :password_confirmation => 'admin123', :admin => true)
puts 'admin created'