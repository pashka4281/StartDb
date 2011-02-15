class AbusesController < ApplicationController
  def create
    @abuse = Abuse.create!(:abusable_id => params[:id], :abusable_type => params[:type])
    flash[:notice] = 'Administrators will be notified about abuse'
    redirect_to :back
  end

end
