-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Solarized Light (Gogh)'

-- Font settings
config.font = wezterm.font 'Hack'
config.font_size = 14.0

-- Tab bar
config.window_frame = {
  font = wezterm.font { family = 'Noto Sans' },
}

-- config.window_padding = {
--   bottom = '2cell',
-- }

-- Default program
config.default_prog = { '/run/current-system/sw/bin/bash' }

config.front_end = 'WebGpu'

config.scrollback_lines = 100000
config.enable_scroll_bar = true

config.ssh_domains = {
  {
    name = 'terra',
    remote_address = '100.124.243.32',
    username = 'vaibhavsagar',
  },
}

-- and finally, return the configuration to wezterm
return config
