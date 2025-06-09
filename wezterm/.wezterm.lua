-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.term = "wezterm"
config.window_padding = {
	top = 4,
	right = 4,
	bottom = 0,
	left = 4,
}
config.hide_tab_bar_if_only_one_tab = true
config.font = wezterm.font("FiraCode Nerd Font")
config.color_scheme = "GruvboxDark"
config.window_background_opacity = 0.9
config.window_decorations = 'NONE'

-- and finally, return the configuration to wezterm
return config
