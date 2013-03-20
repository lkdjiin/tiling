# -*- encoding: utf-8 -*-

module Tiling

  # Public: Find our windows.
  class Windows

    attr_reader :master

    def initialize workspace
      @workspace = workspace
      @wm = WMCtrl.instance
      find_windows
    end

    def empty?
      @windows.empty?
    end

    def count
      @windows.count
    end

    def each &block
      @windows.each &block
    end

    private

      def find_windows
        @windows = windows_in_active_workspace
        put_active_window_on_top
        @master = get_master_window
      end

      def windows_in_active_workspace
        @wm.windows.select { |win| win[:desktop] == @workspace.id }
      end

      def put_active_window_on_top
        @windows.sort! { |x,y| y[:active] ? 1 : -1 }
      end

      def get_master_window
        @windows.slice!(0)
      end

  end
end
