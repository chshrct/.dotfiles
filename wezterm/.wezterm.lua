local wezterm = require("wezterm")
local config = {}

-- shell
config.default_prog = { "pwsh" }
-- color scheme
config.color_scheme = "rose-pine-moon"

-- font
config.font = wezterm.font("MesloLGS Nerd Font")
config.font_size = 9

-- cursor
config.force_reverse_video_cursor = true

-- background
config.window_background_opacity = 0.9

--tab bar
config.hide_tab_bar_if_only_one_tab = true

return config
