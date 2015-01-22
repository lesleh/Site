module AuthHelper
  def http_login
    user = Rails.application.secrets.username
    pw = Rails.application.secrets.password
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(user, pw)
  end
end
