# -*- encoding: utf-8 -*-

module WLayout

  # Public: Find our windows.
  #
  # FIXME: Cette classe fait trop de choses
  #   * Elle trouve les fenêtres
  #   * Elle calcule la position du master
  #   * Elle positionne le master
  #   * Elle calcule la position des fenêtres restantes
  #   * Elle positionne les fenêtres restantes
  #   * Elle prend la decision de quitter si pas du tout de fenêtres
  #   * Elle prend la decision de quitter si pas de fenêtres restantes
  class Windows

    def initialize workspace
      @workspace = workspace
      @wm = WMCtrl.instance
      find_windows
      position_master_window
      exit if @windows.empty?
      position_remaining_windows
    end

    private

      def find_windows
        @windows = windows_in_active_workspace
        exit if @windows.empty?
        put_active_window_on_top
      end

      def windows_in_active_workspace
        @wm.windows.select { |win| win[:desktop] == @workspace.id }
      end

      def put_active_window_on_top
        @windows.sort! { |x,y| y[:active] ? 1 : -1 }
      end

      def position_master_window
        @master = get_master_window
        calculate_master
        move_resize_master
      end

      def get_master_window
        @windows.slice!(0)
      end

      def calculate_master
        @master[:height_exterior] = (@workspace.height - @workspace.y) / 2
        ext = @master[:frame_extents]
        @master[:height] = @master[:height_exterior] - ext[2] - ext[3]
        @master[:width] = @workspace.width - ext[0] - ext[1]
      end

      def move_resize_master
        @wm.action_window(@master[:id], :move_resize, 0, @workspace.x,
                          @workspace.y, @master[:width], @master[:height])
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
        @wm.action_window(win[:id], :move_resize, 0, @x, @y, width, height)
      end
  end
end
