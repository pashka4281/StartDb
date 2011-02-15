class CompaniesController < InheritedResources::Base
  before_filter :login_required, :except => [:index, :show]
  
  def index
    @curr_page = 'companies'
    @countries = Country.all
    @categories = Category.all
    @recent_companies = Company.order('created_at DESC').limit(3)
    unless params[:search]
      @companies = Company
    else
      @companies = Country.find(params[:search][:nationality_id]).companies if params[:search][:nationality_id]
      @companies = Category.find(params[:search][:category_id]).companies if params[:search][:category_id]
    end
  end

  def new
    @curr_page = 'companies'
    @company = Company.new
    @company.website = 'http://'
  end

  def edit
    @curr_page = 'companies'
    @company = Company.find(params[:id])
  end

  def show
    @curr_page = 'companies'
    @company = Company.find(params[:id])
  end


end
