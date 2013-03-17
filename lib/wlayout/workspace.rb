# -*- encoding: utf-8 -*-

module WLayout
  class Workspace

    attr_reader :id, :x, :y, :w, :h

    def initialize
      desktops = WMCtrl.instance.desktops
      desktops.each do |d|
        if d[:current]
          @id = d[:id]
          @x = d[:workarea][0]
          @y = d[:workarea][1]
          @w = d[:workarea][2]
          @h = d[:workarea][3]
          break
        end
      end
    end

  end
end
