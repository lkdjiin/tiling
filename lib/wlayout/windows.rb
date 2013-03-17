# -*- encoding: utf-8 -*-

module WLayout
  class Windows

    def initialize workspace
      # Trouver les fenêtres
      @windows = WMCtrl.instance.windows
      @windows = @windows.select { |i| i[:desktop] == workspace.id }

      exit if @windows.empty?

      # Placer la fenêtre active (si il y en a une) en tête de liste
      @windows.sort! { |x,y| y[:active] ? 1 : -1 }

      # Trouver les futures coordonnées de la fenêtre maître
      @master = @windows.slice!(0)
      master_h_exterior = (workspace.h - workspace.y) / 2
      master_h = master_h_exterior - @master[:frame_extents][2] - @master[:frame_extents][3]
      master_w = workspace.w - @master[:frame_extents][0] - @master[:frame_extents][1]
      # Placer la fenêtre maître
      WMCtrl.instance.action_window(@master[:id], :move_resize, 0, 
                                    workspace.x, workspace.y, 
                                    master_w, master_h)

      # Trouver les futures coordonnées des autres fenêtres
      real_w = workspace.w / @windows.count
      x = workspace.x
      y = workspace.y + master_h_exterior
      @windows.each do |win|
        w = real_w - win[:frame_extents][0]- win[:frame_extents][1]
        h = workspace.h - (workspace.y + master_h_exterior) - win[:frame_extents][2]- win[:frame_extents][3]
        WMCtrl.instance.action_window(win[:id], :move_resize, 0, x, y, w, h)
        x += real_w
      end


    end

  end
end
