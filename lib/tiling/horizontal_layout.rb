# -*- encoding: utf-8 -*-

module Tiling

  # Public: Met en place un layout horizontal.
  class HorizontalLayout < Layout

    private

      def calculate_master
        @master[:height_exterior] = (@workspace.height - @workspace.y) / 2
        ext = FrameExtents.new(@master[:frame_extents])
        @master[:height] = @master[:height_exterior] - ext.top - ext.bottom
        @master[:width] = @workspace.width - ext.left - ext.right
      end

      def position_remaining_windows
        @real_width = @workspace.width / @windows.count
        @x = @workspace.x
        @y = @workspace.y + @master[:height_exterior]
        @windows.each { |win| position_window win }
      end

      def position_window win
        @ext = FrameExtents.new(win[:frame_extents])
        width = get_win_width
        height = get_win_height
        move_resize_window win, width, height
        @x += @real_width
      end

      def get_win_width
        @real_width - @ext.left- @ext.right
      end

      def get_win_height
        tmp = @workspace.y + @master[:height_exterior]
        @workspace.height - tmp - @ext.top - @ext.bottom
      end

      def move_resize_window win, width, height
        Mover.move(win[:id], @x, @y, width, height)
      end

  end

end
