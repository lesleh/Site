desc "Check"
task :check do
  raise "Instagram access token missing." unless Rails.application.secrets.instagram_access_token.present?
end