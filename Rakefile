require "bundler/gem_tasks"
require "rspec/core/rake_task"

require File.join(File.dirname(__FILE__), 'lib/astley.rb')

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

desc 'search for clicks and send them tweets'
task :tweet do
  Astley.send_tweets
end
