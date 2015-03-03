class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  ensure_security_headers if Rails.env.production?

  private

  # TODO This just doesn't work since Chrome caches the credentials. Maybe set some fake credentials to force a logout.
  def do_logout
    session[:login] = nil
  end

  def authenticate
    login = authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.secrets.username && password == Rails.application.secrets.password
    end
    session[:login] = login
  end

  # Sometimes redirect back just doesn't work
  def redirect_back_or_default(default = root_path, *options)
    tag_options = {}
    options.first.each { |k,v| tag_options[k] = v } unless options.empty?
    redirect_to (request.referer.present? ? :back : default), tag_options
  end

end
