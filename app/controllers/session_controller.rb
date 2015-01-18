require 'uri'

class SessionController < ApplicationController
  before_filter :authenticate, :only => :login

  def login
    redirect_back_or_default root_path, :notice => 'Logged in'
  end

  def logout
    do_logout
    url = URI(root_url)
    url.password = url.user = 'wrong'
    redirect_to url.to_s
  end
end
