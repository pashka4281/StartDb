class AdminController < ApplicationController
  before_filter :admin_only
  
  def index
    @curr_page = 'admin'
  end

end
