local wezterm = require 'wezterm'

return {
  -- Smart tab bar [distraction-free mode]
  hide_tab_bar_if_only_one_tab = true,

  -- Color scheme
  -- https://wezfurlong.org/wezterm/config/appearance.html


  window_background_opacity = 0.95,
  initial_cols = 150,
  initial_rows = 40,

  animation_fps = 60,
   max_fps = 60,
   front_end = 'WebGpu',
   webgpu_power_preference = 'HighPerformance',

  -- Font configuration
  -- https://wezfurlong.org/wezterm/config/fonts.html
  font = wezterm.font('Hack Nerd Font'),
  font_size = 12.0,

  -- color_scheme = 'Solarized (dark) (terminal.sexy)',
  -- color_scheme = 'Solarized Darcula',
  -- color_scheme = 'BlulocoDark',
  -- default_prog = { 'zsh' },
  color_scheme = 'tokyonight_moon',

  window_frame = {
      -- The font used in the tab bar.
      -- Roboto Bold is the default; this font is bundled
      -- with wezterm.
      -- Whatever font is selected here, it will have the
      -- main font setting appended to it to pick up any
      -- fallback fonts you may have used there.
      font = wezterm.font { family = 'Roboto', weight = 'Bold' },

      -- The size of the font in the tab bar.
      -- Default to 10.0 on Windows but 12.0 on other systems
      font_size = 12.0,

      -- The overall background color of the tab bar when
      -- the window is focused
      active_titlebar_bg = '#333333',

      -- The overall background color of the tab bar when
      -- the window is not focused
      inactive_titlebar_bg = '#333333',
  },

  colors = {
      tab_bar = {
          -- The color of the strip that goes along the top of the window
          -- (does not apply when fancy tab bar is in use)
          background = '#0b0022',

          -- The active tab is the one that has focus in the window
          active_tab = {
              -- The color of the background area for the tab
              bg_color = '#2b2042',
              -- The color of the text for the tab
              fg_color = '#c0c0c0',

              -- Specify whether you want "Half", "Normal" or "Bold" intensity for the
              -- label shown for this tab.
              -- The default is "Normal"
              intensity = 'Normal',

              -- Specify whether you want "None", "Single" or "Double" underline for
              -- label shown for this tab.
              -- The default is "None"
              underline = 'None',

              -- Specify whether you want the text to be italic (true) or not (false)
              -- for this tab.  The default is false.
              italic = false,

              -- Specify whether you want the text to be rendered with strikethrough (true)
              -- or not for this tab.  The default is false.
              strikethrough = false,
          },

          -- Inactive tabs are the tabs that do not have focus
          inactive_tab = {
              bg_color = '#1b1032',
              fg_color = '#808080',

              -- The same options that were listed under the `active_tab` section above
              -- can also be used for `inactive_tab`.
          },

          -- You can configure some alternate styling when the mouse pointer
          -- moves over inactive tabs
          inactive_tab_hover = {
              bg_color = '#3b3052',
              fg_color = '#909090',
              italic = true,

              -- The same options that were listed under the `active_tab` section above
              -- can also be used for `inactive_tab_hover`.
          },

          -- The new tab button that let you create new tabs
          new_tab = {
              bg_color = '#1b1032',
              fg_color = '#808080',

              -- The same options that were listed under the `active_tab` section above
              -- can also be used for `new_tab`.
          },

          -- You can configure some alternate styling when the mouse pointer
          -- moves over the new tab button
          new_tab_hover = {
              bg_color = '#3b3052',
              fg_color = '#909090',
              italic = true,

              -- The same options that were listed under the `active_tab` section above
              -- can also be used for `new_tab_hover`.
          },
      },
  },

  -- window_background_image = '/Users/lemon/.config/wezterm/images/astro-jelly.jpg',
  -- window_background_image_hsb = {},

  -- Disable ligatures
  -- https://wezfurlong.org/wezterm/config/font-shaping.html
  -- harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },

  leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 },
  keys = {
    {
      key = 'd',
      mods = 'CMD',
      action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
      key = 'D',
      mods = 'CMD',
      action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
        key = 'w',
        mods = 'CMD',
        action = wezterm.action.CloseCurrentPane { confirm = true },
    },
    {
        key = 'b',
        mods = 'CTRL',
        action = wezterm.action.RotatePanes 'CounterClockwise',
    },
    { key = 'n', mods = 'CTRL', action = wezterm.action.RotatePanes 'Clockwise' },
  },
}
