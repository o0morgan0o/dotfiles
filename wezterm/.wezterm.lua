-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- remove alt + enter to use it in neovim
config.keys = {
	{ key = "Enter", mods = "ALT", action = wezterm.action.DisableDefaultAssignment },
	{ key = "n", mods = "CTRL|SHIFT", action = wezterm.action.DisableDefaultAssignment },
}

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'AdventureTime'
--

config.enable_scroll_bar = true
config.font = wezterm.font("JetBrains Mono")

-- config.color_scheme = 'Batman'
-- config.color_scheme = 'Dracula'

-- and finally, return the configuration to wezterm
return config
