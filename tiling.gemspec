# -*- encoding: utf-8 -*-

require 'rake'

Gem::Specification.new do |s|
  s.name = 'tiling'
  s.version = File.read('VERSION').strip
  s.authors = ['Xavier Nayrac']
  s.email = 'xavier.nayrac@gmail.com'
  s.summary = 'Some windows layouts for (I hope so) any common linux desktop'
  s.homepage = 'http://lkdjiin.github.com/tiling'
  s.description = %q{Tiling provides a simple window tiling system for linux.
This is for those who cannot (or don't want to) use a tiling window manager like
awesome or Xmonad.}
	
	readmes = FileList.new('*') do |list|
		list.exclude(/(^|[^.a-z])[a-z]+/)
		list.exclude('TODO')
	end.to_a
  s.files = FileList['lib/**/*.rb', 'bin/*', 'shell/*', '[A-Z]*'].to_a + readmes
	s.license = 'MIT'
	s.required_ruby_version = '>= 1.9.2'
	s.executables = ['tiling']
  s.add_dependency 'ruby-wmctrl', '0.0.5'
end
