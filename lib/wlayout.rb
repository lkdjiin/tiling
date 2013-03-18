# -*- encoding: utf-8 -*-

gem 'ruby-wmctrl', '0.0.5'
require 'wmctrl'
require 'wlayout/workspace'
require 'wlayout/windows'

module WLayout
  def self.run
    workspace = Workspace.new
    windows = Windows.new workspace
  end
end
