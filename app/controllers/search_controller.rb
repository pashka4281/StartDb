class SearchController < ApplicationController
  def index
    @companies = Company.search(params[:search])
    @people    = Person.search(params[:search])
  end

end
