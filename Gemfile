source 'https://rubygems.org'

gem 'rails', '4.2.0'
gem 'responders', '~> 2.0'

# Database
gem 'pg', platform: :ruby
gem 'activerecord-jdbcpostgresql-adapter', platform: :jruby

# Assets
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem "bower-rails", "~> 0.9.1"

# JSExec
gem 'therubyracer', platform: :ruby
gem 'therubyrhino', platform: :jruby

gem 'slim-rails'
gem 'jbuilder', '~> 2.0'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'friendly_id', '~> 5.0'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'acts-as-taggable-on', '~> 3.4'

gem 'kramdown' # Markdown

gem 'instagram'

gem 'active_link_to'

gem 'bootstrap_form'

gem 'will_paginate-bootstrap'

gem "secure_headers"

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'puma', platform: :jruby
gem "warbler"

group :development, :test do
  gem 'spring'
  gem 'rspec-rails', '~> 3.0'
end

group :development do
  gem 'quiet_assets'
  gem "rack-mini-profiler", require: false
  gem "binding_of_caller", platform: :ruby
  gem "better_errors", platform: :ruby # Doesn't like JRuby :(
end