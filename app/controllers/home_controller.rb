class HomeController < ApplicationController
  def index
    @curr_page = 'index'
    @persons = Person.all
    @last_companies = Company.order('created_at DESC').limit(8)
    @last_people    = Person.order('created_at DESC').limit(8)
  end
end
