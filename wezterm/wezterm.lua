local wezterm = require 'wezterm'

-- Kanagawa with nice tab bars
local kanagawa_custom = wezterm.color.get_builtin_schemes()["kanagawabones"]
kanagawa_custom.tab_bar = {
  background = "black",
  active_tab = {
    bg_color = "#1f1f28",
    fg_color = "#dcd7ba",
  },
  inactive_tab = {
    bg_color = "black",
    fg_color = "79797c",
  },
  new_tab = {
    bg_color = "black",
    fg_color = "79797c",
  },
}

-- Switch theme based on appearance
local function colorscheme(appearance)
  -- if appearance:find "Dark" then
    -- return "kanagawa_custom"
  -- else
    -- return "Catppuccin Latte"
  -- end
  -- return "Gruvbox Material (Gogh)"
  return "Tokyo Night Moon"
end

-- General config
local config = {
  color_schemes = {
    ["kanagawa_custom"] = kanagawa_custom,
  },
  color_scheme = colorscheme(wezterm.gui.get_appearance()),
  -- font = wezterm.font 'Hack Nerd Font',
  font_size = 13,
  -- line_height = 1.2,
  -- cell_width = 0.9,
  use_fancy_tab_bar = false,
  force_reverse_video_cursor = true,
  hide_tab_bar_if_only_one_tab = true,
  adjust_window_size_when_changing_font_size = false,
  max_fps = 120,
  tab_max_width = 32,
  window_decorations = "RESIZE",
  window_background_opacity = 0.9,
  enable_scroll_bar = true,
  scrollback_lines = 500000,
}

local a = wezterm.action

local function map(things)
  local t = {}
  for key in string.gmatch(things, '([^,]+)') do
    table.insert(t, a.SendKey { key = key })
  end
  return t
end

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
