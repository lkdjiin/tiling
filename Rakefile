# -*- encoding: utf-8 -*-


require 'rake'
require 'rspec/core/rake_task'

desc 'Test'
task :default => :spec

desc 'Test tiling with rspec'
RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = ['--color']
end

desc 'Check for code smells'
task :reek do
  puts 'Checking for code smells...'
  files = Dir.glob 'lib/**/*.rb'
  # files.delete FILE_TO_EXCLUDE
  args = files.join(' ')
  sh "reek --quiet #{args} | ./reek.sed"
end

desc 'Check refactoring candidates'
task :flay do
  sh "flay lib/*.rb"
end

desc 'Build gem & install it'
task :install do
  sh "rm tiling*gem"
  sh "gem build tiling.gemspec"
	f = FileList['tiling*gem'].to_a
	sh "gem install #{f.first}"
end
