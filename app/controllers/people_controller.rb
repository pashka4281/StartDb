class PeopleController < ApplicationController
  respond_to :html, :rss
  before_filter :login_required, :except => [:index, :show]

  def index
    @curr_page = 'people'
    @countries = Country.all
    @recent_people = Person.order('created_at DESC').limit(3)
    unless params[:search]
      @persons = Person
    else
      @persons = Country.find(params[:search][:nationality_id]).people
    end
  end
  
  def new
    @curr_page = 'people'
    @person = Person.new
    @person.person_companies.build
  end

  def edit
    @curr_page = 'people'
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])
    if @person.update_attributes(params[:person])
      redirect_to @person, :notice => "Person information updated."
    else
      flash[:error] = "Can't update person"
      render :action => 'edit'
    end
  end

  def create
    @person = Person.new(params[:person])
    if @person.save
      redirect_to people_url, :notice => "New person created."
    else
      render :action => "new", :error => "try again"
    end
  end

  def show
    @curr_page = 'people'
    @person = Person.find(params[:id])
  end
end
