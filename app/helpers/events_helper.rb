module EventsHelper

  def it_my_event?(event)
    current_user && current_user.events.include?(event)
  end
  
end
