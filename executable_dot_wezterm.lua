local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.font = wezterm.font 'JetBrainsMono Nerd Font'
-- config.color_scheme = 'One Dark (Gogh)'


config.default_prog = { 'pwsh' }
config.enable_kitty_keyboard = true
config.allow_win32_input_mode = false

return config
