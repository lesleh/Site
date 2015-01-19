desc "Release"
task :release do
  Rake::Task["db:migrate"].invoke
  Rake::Task["assets:clean"].invoke
  Rake::Task["assets:precompile"].invoke
  sh 'sudo /etc/init.d/nginx restart'
  sh 'wget http://lesleh.co.uk/ -o /dev/null -q'
end