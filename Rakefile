require 'bundler'
require 'rspec/core/rake_task'
Bundler::GemHelper.install_tasks

RSpec::Core::RakeTask.new do |spec|
  spec.rspec_opts = ["--format=doc", "--fail-fast", "--color"]
end

task :default => :spec
