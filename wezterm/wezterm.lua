-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
-- For example, changing the color scheme:
config.color_scheme = 'AdventureTime'
-- 关闭窗口的bar

config.default_prog  = {'powershell'}
config.enable_scroll_bar = true
config.window_padding = {
  left = 2,
  right = 2,
  top = 0,
  bottom = 0,
}

--config.window_background_image = 'D:\\.dotfile\\wezterm\\background.png'
--config.window_background_image_hsb = {
    -- Darken the background image by reducing it to 1/3rd
  --brightness = 0.1,

  -- You can adjust the hue by scaling its value.
  -- a multiplier of 1.0 leaves the value unchanged.
  --hue = 1.0,

  -- You can adjust the saturation also.
  --saturation = 1.0,

--}

config.colors = {
  -- Colors from everforest theme for Vim:
  -- https://github.com/sainnhe/everforest
  -- https://github.com/sunaku/home/blob/master/.Xdefaults.d/colors/everforest.xrdb
  foreground = "#d3c6aa", -- background=dark palette2=fg
  background = "#323d43", -- softness=soft background=dark palette1=bg0
  cursor_border = "#f57d26", -- background=light palette2=orange
  cursor_bg = "#f57d26", -- background=light palette2=orange
  cursor_fg = "#edead5", -- bright white (taken from below)
  selection_bg = "#573e4c", -- Visual
  selection_fg = "#edead5", -- bright white (taken from below)
  ansi = {
    "#404c51", -- softness=medium background=dark palette1=bg2
    "#e67e80", -- background=dark palette2=red
    "#a7c080", -- background=dark palette2=green
    "#dbbc7f", -- background=dark palette2=yellow
    "#7fbbb3", -- background=dark palette2=blue
    "#d699b6", -- background=dark palette2=purple
    "#83c092", -- background=dark palette2=aqua
    "#dfdbc8", -- softness=medium background=light palette1=bg4
  },
  brights = {
    "#404c51", -- softness=medium background=dark palette1=bg2
    "#e67e80", -- background=dark palette2=red
    "#a7c080", -- background=dark palette2=green
    "#dbbc7f", -- background=dark palette2=yellow
    "#7fbbb3", -- background=dark palette2=blue
    "#d699b6", -- background=dark palette2=purple
    "#83c092", -- background=dark palette2=aqua
    "#dfdbc8", -- softness=medium background=light palette1=bg4
    -- "#525c62", -- softness=medium background=dark palette1=bg4
    -- "#f85552", -- background=light palette2=red
    -- "#8da101", -- background=light palette2=green
    -- "#dfa000", -- background=light palette2=yellow
    -- "#3a94c5", -- background=light palette2=blue
    -- "#df69ba", -- background=light palette2=purple
    -- "#35a77c", -- background=light palette2=aqua
    -- "#edead5", -- softness=medium background=light palette1=bg2
  },
}

config.disable_default_key_bindings = true
config.keys = {
  {mods="CTRL|SHIFT", key="F", action=wezterm.action{Search={CaseSensitiveString=""}}},
  {mods="CTRL|SHIFT", key="C", action=wezterm.action{CopyTo="Clipboard"}},
  {mods="CTRL|SHIFT", key="V", action=wezterm.action{PasteFrom="Clipboard"}},
  {mods="SHIFT", key="Insert", action=wezterm.action{PasteFrom="PrimarySelection"}},
  {mods="CTRL", key="-", action="DecreaseFontSize"},
  {mods="CTRL", key="=", action="IncreaseFontSize"},
  {mods="CTRL", key="0", action="ResetFontSize"},
  {key="F11", action="ToggleFullScreen"},

  -- 分屏
  { key = 'h',mods = 'ALT',action = wezterm.action.SplitHorizontal {  domain = 'CurrentPaneDomain'},},
  { key = 'v',mods = 'ALT',action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },},
  { key = 'LeftArrow',mods = 'CTRL',action = wezterm.action{ActivatePaneDirection="Left"},},
  { key = 'RightArrow',mods = 'CTRL',action = wezterm.action{ActivatePaneDirection="Right"},},
  { key = 'UpArrow',mods = 'CTRL',action = wezterm.action{ActivatePaneDirection="Up"},},
  { key = 'DownArrow',mods = 'CTRL',action = wezterm.action{ActivatePaneDirection="Down"},},
  
}
--config.window_background_opacity = 0.5
-- and finally, return the configuration to wezterm
return config
