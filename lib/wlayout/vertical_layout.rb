# -*- encoding: utf-8 -*-

module WLayout

  # Public: Met en place un layout vertical.
  class VerticalLayout < Layout

    private

      def calculate_master
        @master[:width_exterior] = (@workspace.width - @workspace.x) / 2
        ext = FrameExtents.new(@master[:frame_extents])
        @master[:width] = @master[:width_exterior] - ext.left - ext.right
        @master[:height] = @workspace.height - ext.top - ext.bottom
      end

      def position_remaining_windows
        @real_height = @workspace.height / @windows.count
        @y = @workspace.y
        @x = @workspace.x + @master[:width_exterior]
        @windows.each { |win| position_window win }
      end

      def position_window win
        @ext = FrameExtents.new(win[:frame_extents])
        height = get_win_height
        width = get_win_width
        move_resize_window win, width, height
        @y += @real_height
      end

      def get_win_height
        @real_height - @ext.top - @ext.bottom
      end

      def get_win_width
        tmp = @workspace.x + @master[:width_exterior]
        @workspace.width - tmp - @ext.left - @ext.right
      end

      def move_resize_window win, width, height
        Mover.move(win[:id], @x, @y, width, height)
      end

  end

end

