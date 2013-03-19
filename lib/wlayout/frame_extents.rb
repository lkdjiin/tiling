# -*- encoding: utf-8 -*-

module WLayout

  # Public: Décoration de fenêtre.
  class FrameExtents
    attr_reader :left, :right, :top, :bottom

    def initialize extents
      @left = extents[0]
      @right = extents[1]
      @top = extents[2]
      @bottom = extents[3]
    end
  end

end
