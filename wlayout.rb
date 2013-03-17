#!/usr/bin/env ruby
# -*- encoding: utf-8 -*-

gem 'ruby-wmctrl', '0.0.5'
require 'wmctrl'

# Trouver le bureau actif et la taille du workspace
@workspace = {}
desktops = WMCtrl.instance.desktops
desktops.each do |d|
  if d[:current]
    @desktop = d[:id]
    @workspace[:x] = d[:workarea][0]
    @workspace[:y] = d[:workarea][1]
    @workspace[:w] = d[:workarea][2]
    @workspace[:h] = d[:workarea][3]
  end
end

# Trouver les fenêtres
@windows = WMCtrl.instance.windows
@windows = @windows.select { |i| i[:desktop] == @desktop }
exit if @windows.empty?

# Placer la fenêtre active (si il y en a une) en tête de liste
@windows.sort! do |x,y|
  if y[:active]
    1
  else
    -1
  end
end

# Trouver les futures coordonnées de la fenêtre maître
@master = @windows.slice!(0)
master_h_exterior = (@workspace[:h] - @workspace[:y]) / 2
master_h = master_h_exterior - @master[:frame_extents][2] - @master[:frame_extents][3]
master_w = @workspace[:w] - @master[:frame_extents][0] - @master[:frame_extents][1]
# Placer la fenêtre maître
WMCtrl.instance.action_window(@master[:id], :move_resize, 0, 
                              @workspace[:x], @workspace[:y], 
                              master_w, master_h)

# Trouver les futures coordonnées des autres fenêtres
real_w = @workspace[:w] / @windows.count
x = @workspace[:x]
y = @workspace[:y] + master_h_exterior
@windows.each do |win|
  w = real_w - win[:frame_extents][0]- win[:frame_extents][1]
  h = @workspace[:h] - (@workspace[:y] + master_h_exterior) - win[:frame_extents][2]- win[:frame_extents][3]
  WMCtrl.instance.action_window(win[:id], :move_resize, 0, x, y, w, h)
  x += real_w
end


