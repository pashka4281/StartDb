class UsersController < ApplicationController
  before_filter :login_required, :except => [:create, :new]
  

  # render new.rhtml
  def new
    @user = User.new
  end

  def show
    @curr_page = 'profile'
    redirect '/' unless current_user && current_user.admin?
    @user = User.find(params[:id])  
  end
 
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
      # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      self.current_user = @user # !! now logged in
      redirect_back_or_default('/', :notice => "Thanks for signing up!  You can now login.")
    else
      flash.now[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin."
      render :action => 'new'
    end
  end

  def profile
    @curr_page = 'profile'
  end

  def edit
    @user = current_user.admin? ? (params[:id] ? User.find(params[:id]) : current_user) : current_user
  end

  def update
    @user = User.find(params[:id])
    if params[:user][:password] == ''
      params[:user].delete('password')
      params[:user].delete('password_confirmation')
    end
    if @user.update_attributes(params[:user])
      # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      redirect_to('/', :notice => "Your information updated.")
    else
      flash.now[:error]  = "Can't update your information."
      render :action => 'edit'
    end
  end
end
