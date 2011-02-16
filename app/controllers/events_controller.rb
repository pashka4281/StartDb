class EventsController < InheritedResources::Base
  before_filter :login_required, :except => [:index, :show]
#  before_filter :owner_rights_required, :only => [:edit, :destroy]

  def index
    @curr_page = 'events'
    @events = Event.available.order('taken_at ASC')
  end

  def show
    @curr_page = 'events'
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(params[:event])
    if @event.save
      current_user.events << @event
      redirect_to events_path, :notice => 'Event created'
    else
      render :action => 'new'
      flash[:error] = "Can't create event"
    end
  end

  def edit
    
    if current_user.events.include?(@event) or current_user.admin?
      @event = Event.find(params[:id])
    else
      flash[:error] = "You haven't rights to do that"
      redirect_to events_path
    end
  end
  
  def update
    @event = Event.find(params[:id])
    if current_user.events.include?(@event)
      if @event.update_attributes(params[:event])
        #current_user.events << @event
        redirect_to @event, :notice => 'Event updated'
      else
        render :action => 'new'
        flash[:error] = "Can't update event"
      end
    else
      flash[:error] = "You haven't rights to do that"
      redirect_to events_path
    end
  end

end
