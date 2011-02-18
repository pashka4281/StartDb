class InvestorsController < ApplicationController
  respond_to :html, :rss
  
  def index
    @curr_page = 'investors'
    @countries = Country.all
    @recent_people = Person.order('created_at DESC').limit(3)
    unless params[:search]
      @persons = Person.investors
    else
      @persons = Country.find(params[:search][:nationality_id]).people
    end
  end
end
