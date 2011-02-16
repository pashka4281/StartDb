require 'lib/authenticated_system'

class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  protect_from_forgery

  def admin_only
    if not current_user.admin?
      flash[:error] = "You have no rights"
      redirect_to '/'
    end
  end
end