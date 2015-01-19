desc "Release"
task :release do
  Rake::Task["assets:clean"].invoke
  Rake::Task["assets:precompile"].invoke
  sh 'sudo /etc/init.d/nginx restart'
  sh 'wget http://lesleh.co.uk/ -O /dev/null -q'
end