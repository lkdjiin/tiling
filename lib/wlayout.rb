# -*- encoding: utf-8 -*-

gem 'ruby-wmctrl', '0.0.5'
require 'wmctrl'
require 'wlayout/workspace'
require 'wlayout/windows'
require 'wlayout/layout'
require 'wlayout/horizontal_layout'
require 'wlayout/vertical_layout'
require 'wlayout/mover'
require 'wlayout/option'


module WLayout
  def self.run
    options = Option.new
    workspace = Workspace.new
    windows = Windows.new workspace
    exit if windows.empty?
    if options[:vertical]
      layout = VerticalLayout.new workspace, windows
    else
      layout = HorizontalLayout.new workspace, windows
    end
    layout.lay_master_window
    layout.lay_remaining_windows
  end
end
