class HomeController < ApplicationController
  def index
    @curr_page = 'index'
    @persons = Person.all
    @last_companies = Company.order('created_at DESC').limit(8)    || []
    @last_people    = Person.order('created_at DESC').limit(8)     || []
    @last_jobs      = JobCompany.order('created_at DESC').limit(4) || []
    @last_events    = Event.order('created_at DESC').limit(4)      || []
  end
end
