class AuthorizationsController < ApplicationController
  before_filter :login_required, :only => :destroy
  
  def create
    auth = request.env['rack.auth']
    unless @auth = Authorization.find_from_hash(auth)
      # Create a new user or add an auth to existing user, depending on
      # whether there is already a user signed in.
      @auth = Authorization.create_from_hash(auth, current_user)
    end
    # Log the authorizing user in.
#    current_user = @auth.user
#    session[:user_id] = @auth.user ? @auth.user.id : nil
    self.current_user = @auth.user
    session[:user_id]  = @current_user.id
    redirect_to "/", :notice => "You have been logged in as #{current_user.name}"
  end

  def destroy
    @auth  = Authorization.find(params[:id])
    if current_user.authorizations.include?(@auth)
      @auth.destroy
      redirect_to :back, :notice => 'Connection removed'
    else
      redirect_to :back, :error => 'Can\'t remove connection'
    end
  end

end