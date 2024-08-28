local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'One Half Black (Gogh)'
config.enable_tab_bar = false
config.window_background_opacity = 0.8
config.font_size = 9.0

return config
