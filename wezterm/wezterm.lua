local wezterm = require 'wezterm'

-- General config
local config = {
  -- color_scheme = "Tokyo Night Moon",
  color_scheme = "Catppuccin Mocha",
  font = wezterm.font("Hack Nerd Font", { weight = "Regular" }),
  font_size = 13,
  -- line_height = 1.2,
  -- cell_width = 0.9,
  use_fancy_tab_bar = false,
  -- force_reverse_video_cursor = true,
  hide_tab_bar_if_only_one_tab = true,
  adjust_window_size_when_changing_font_size = false,
  max_fps = 120,
  tab_max_width = 32,
  window_decorations = "RESIZE",
  enable_scroll_bar = true,
  scrollback_lines = 500000,
  show_new_tab_button_in_tab_bar = false,
  window_background_opacity = 0.9,
  macos_window_background_blur = 70,
  text_background_opacity = 0.9,
}

local a = wezterm.action

config.keys = {
  {
    key = 'd',
    mods = 'CMD',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'd',
    mods = 'CMD|SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  { key = 'n', mods = 'CMD', action = wezterm.action.RotatePanes 'Clockwise' },
  { key = 'LeftArrow', mods = 'CMD', action = wezterm.action({ ActivateTabRelative = -1 }) },
  { key = 'RightArrow', mods = 'CMD', action = wezterm.action({ ActivateTabRelative = 1 }) },
  {
    key = 'w',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentPane { confirm = false },
  },
}

return config
