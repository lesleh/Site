if Rails.env == 'development'
  require 'rack-mini-profiler'

  puts "KHFKJHDLHDLKJ"

  # initialization is skipped so trigger it
  Rack::MiniProfilerRails.initialize!(Rails.application)
end