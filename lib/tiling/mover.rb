# -*- encoding: utf-8 -*-

module Tiling
  # Move a window.
  class Mover
    def self.move id, x, y, width, height
      WMCtrl.instance.action_window(id, :change_state, 'remove', 'fullscreen')
      WMCtrl.instance.action_window(id, :change_state, 'remove', 'maximized_horz', 'maximized_vert')
      WMCtrl.instance.action_window(id, :move_resize, 0, x, y, width, height)
    end
  end
end
