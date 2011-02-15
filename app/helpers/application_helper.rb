module ApplicationHelper
  
  def navigation_tabs(cur_page = nil)
    last_tab = logged_in? ? "<li id=\"login\"><a href=\"/logout\">Logout</a></li>" : "<li id=\"login\"><a href=\"/login\">Sign in</a></li>"
    admin_tab = (logged_in? && current_user.admin?) ? "<li id=\"admin\"><a href=\"/admin\">Admin</a></li>" : ""
    <<-STR
      <ul>
        #{admin_tab}
        <li #{cur_page == 'index'?"class='active'":''}><a href="/">Index</a></li>
        <li #{cur_page == 'people'?"class='active'":''}><a href="/people">People</a></li>
        <li #{cur_page == 'investors'?"class='active'":''}><a href="/investors">Investors</a></li>
        <li #{cur_page == 'companies'?"class='active'":''}><a href="/companies">Companies</a></li>
        <li #{cur_page == 'jobs'?"class='active'":''}><a href="/jobs">Jobs</a></li>
        <li #{cur_page == 'events'?"class='active'":''}><a href="/events">Events</a></li>
        #{last_tab}
      </ul>
    STR
  end

  
end
