local wezterm = require 'wezterm'
local mux = wezterm.mux

local config = {}

config.font = wezterm.font 'FiraCode Nerd Font'
config.color_scheme = 'Catppuccin Mocha'

wezterm.on("gui-startup", function()
  local tab, pane, window = mux.spawn_window{}
  window:gui_window():maximize()
end)

return config
