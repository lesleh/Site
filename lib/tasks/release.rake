require 'fileutils'

desc "Release"
task :release do
  fail "This task can only be run in production." unless Rails.env.production?

  Rake::Task["assets:clean"].invoke
  Rake::Task["assets:precompile"].invoke
  FileUtils.touch Rails.root.join('tmp', 'restart.txt')
end