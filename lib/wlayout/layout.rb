# -*- encoding: utf-8 -*-

module WLayout

  # Public: Met en place le layout.
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

    private

      def calculate_master
        @master[:height_exterior] = (@workspace.height - @workspace.y) / 2
        ext = @master[:frame_extents]
        @master[:height] = @master[:height_exterior] - ext[2] - ext[3]
        @master[:width] = @workspace.width - ext[0] - ext[1]
      end

      def position_remaining_windows
        @real_width = @workspace.width / @windows.count
        @x = @workspace.x
        @y = @workspace.y + @master[:height_exterior]
        @windows.each { |win| position_window win }
      end

      def position_window win
        ext = win[:frame_extents]
        width = get_win_width ext
        height = get_win_height ext
        move_resize_window win, width, height
        @x += @real_width
      end

      def get_win_width ext
        @real_width - ext[0]- ext[1]
      end

      def get_win_height ext
        tmp = @workspace.y + @master[:height_exterior]
        @workspace.height - tmp - ext[2] - ext[3]
      end

      def move_resize_window win, width, height
        Mover.move(win[:id], @x, @y, width, height)
      end
  end

end
