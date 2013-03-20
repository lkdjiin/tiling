# -*- encoding: utf-8 -*-

gem 'ruby-wmctrl', '0.0.5'
require 'wmctrl'
require 'tiling/workspace'
require 'tiling/windows'
require 'tiling/layout'
require 'tiling/horizontal_layout'
require 'tiling/vertical_layout'
require 'tiling/mover'
require 'tiling/option'
require 'tiling/frame_extents'


module Tiling
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
