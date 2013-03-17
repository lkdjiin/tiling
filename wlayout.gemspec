# -*- encoding: utf-8 -*-

require 'rake'

Gem::Specification.new do |s|
  s.name = ''
  s.version = File.read('VERSION').strip
  s.authors = ['Xavier Nayrac']
  s.email = 'xavier.nayrac@gmail.com'
  s.summary = 'Some windows layouts for (I hope so) any common linux desktop'
  s.homepage = ''
  s.description = %q{}
	
	readmes = FileList.new('*') do |list|
		list.exclude(/(^|[^.a-z])[a-z]+/)
		list.exclude('TODO')
	end.to_a
  s.files = FileList['lib/**/*.rb', 'bin/*', '[A-Z]*'].to_a + readmes
	s.license = 'MIT'
	s.required_ruby_version = '>= 1.9.3'
	s.executables = ['wlayout']
  s.add_dependency 'ruby-wmctrl', '0.0.5'
end
