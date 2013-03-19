# -*- encoding: utf-8 -*-

module WLayout

  # Public: Met en place un layout vertical.
  class VerticalLayout < Layout

    private

      def calculate_master
        @master[:width_exterior] = (@workspace.width - @workspace.x) / 2
        ext = @master[:frame_extents]
        @master[:width] = @master[:width_exterior] - ext[0] - ext[1]
        @master[:height] = @workspace.height - ext[2] - ext[3]
      end

      def position_remaining_windows
        @real_height = @workspace.height / @windows.count
        @y = @workspace.y
        @x = @workspace.x + @master[:width_exterior]
        @windows.each { |win| position_window win }
      end

      def position_window win
        ext = win[:frame_extents]
        height = get_win_height ext
        width = get_win_width ext
        move_resize_window win, width, height
        @y += @real_height
      end

      def get_win_height ext
        @real_height - ext[2]- ext[3]
      end

      def get_win_width ext
        tmp = @workspace.x + @master[:width_exterior]
        @workspace.width - tmp - ext[0] - ext[1]
      end

      def move_resize_window win, width, height
        Mover.move(win[:id], @x, @y, width, height)
      end

  end

end

