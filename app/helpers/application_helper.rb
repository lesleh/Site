module ApplicationHelper

  def logged_in?
    true if session[:login]
  end

end
