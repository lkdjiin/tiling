# -*- encoding: utf-8 -*-

module Tiling

  # Public: Classe de base pour les layouts.
  class Layout

    def initialize workspace, windows
      @workspace = workspace
      @windows = windows
      @master = windows.master
    end

    def lay_master_window
      calculate_master
      Mover.move @master[:id], @workspace.x, @workspace.y, @master[:width],
                 @master[:height]
    end

    def lay_remaining_windows
      position_remaining_windows unless @windows.empty?
    end

  end

end
