# -*- encoding: utf-8 -*-

module WLayout
  class Mover
    def self.move id, x, y, width, height
      WMCtrl.instance.action_window(id, :move_resize, 0, x, y, width, height)
    end
  end
end
