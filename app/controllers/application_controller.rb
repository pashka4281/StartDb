require 'lib/authenticated_system'

class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  protect_from_forgery

  def admin_only
    unless current_user && current_user.admin?
      flash[:error] = "You have no rights"
      redirect_to '/'
    end
  end
end