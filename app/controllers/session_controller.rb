class SessionController < ApplicationController
  before_filter :authenticate, :only => :login

  def login
    redirect_back_or_default root_path, :notice => 'Logged in'
  end

  def logout
    do_logout
    redirect_back_or_default root_path, :notice => 'Logged out'
  end
end
