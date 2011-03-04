class AdminController < ApplicationController
  before_filter :admin_only
  
  def index
    @curr_page = 'admin'
    @users = User.all
    @person_abuses   = Abuse.where(:abusable_type => 'Person')
    @company_abuses  = Abuse.where(:abusable_type => 'Company')

    @new_pople_ab     = @person_abuses.collect(&:was_read?).count
    @new_companies_ab = @company_abuses.collect(&:was_read?).count
  end

end
