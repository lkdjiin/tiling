# -*- encoding: utf-8 -*-

gem 'ruby-wmctrl', '0.0.5'
require 'wmctrl'
require 'wlayout/workspace'
require 'wlayout/windows'
require 'wlayout/layout'
require 'wlayout/mover'


module WLayout
  def self.run
    workspace = Workspace.new
    windows = Windows.new workspace
    exit if windows.empty?
    layout = Layout.new workspace, windows
    layout.lay_master_window
    layout.lay_remaining_windows
  end
end
