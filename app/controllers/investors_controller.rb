class InvestorsController < ApplicationController
  respond_to :html, :rss
  
  def index
    @curr_page = 'investors'
  end
end
