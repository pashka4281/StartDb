module ApplicationHelper
  
  def navigation_tabs(cur_page = nil)
    profile_tab = logged_in? ? "<li  #{cur_page == 'profile'?"class='active'":''}><a href=\"/profile\">Profile</a></li>" : ""
    last_tab = logged_in? ? "<li id=\"login\"><a href=\"/logout\">Logout</a></li>" : "<li id=\"login\"><a href=\"/login\">Sign in</a></li>"
    admin_tab = (logged_in? && current_user.admin?) ? "<li #{cur_page == 'admin'?"class='active'":''}><a href=\"/admin\">Admin</a></li>" : ""
    <<-STR
      <ul>
        #{admin_tab}
        <li #{cur_page == 'index'?"class='active'":''}><a href="/">Index</a></li>
        #{profile_tab}
        <li #{cur_page == 'people'?"class='active'":''}><a href="/people">People</a></li>
        <li #{cur_page == 'investors'?"class='active'":''}><a href="/investors">Investors</a></li>
        <li #{cur_page == 'companies'?"class='active'":''}><a href="/companies">Companies</a></li>
        <li #{cur_page == 'jobs'?"class='active'":''}><a href="/jobs">Jobs</a></li>
        <li #{cur_page == 'events'?"class='active'":''}><a href="/events">Events</a></li>
        #{last_tab}
      </ul>
    STR
  end

  def provider_image(prov)
    case prov
    when 'facebook'
      image_tag 'icons/facebook_small.png', :alt => 'Facebook'
    when 'twitter'
      image_tag 'icons/twitter_small.png', :alt => 'Twitter'
    when 'linked_in'
      image_tag 'icons/linkedin_small.png', :alt => 'LinkedIn'
    end
  end

  
end
