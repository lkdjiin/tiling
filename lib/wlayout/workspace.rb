# -*- encoding: utf-8 -*-

module WLayout
  # Public: Current workspace (virtual desktop) state.
  class Workspace

    attr_reader :id

    def initialize
      @desktops = WMCtrl.instance.desktops
      @desktops.each do |desktop|
        if desktop[:current]
          @id = desktop[:id]
          break
        end
      end
    end

    def x
      @desktops[@id][:workarea][0]
    end

    def y
      @desktops[@id][:workarea][1]
    end

    def width
      @desktops[@id][:workarea][2]
    end

    def height
      @desktops[@id][:workarea][3]
    end

  end
end
