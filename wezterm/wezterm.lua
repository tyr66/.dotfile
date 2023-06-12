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

-- For example, changing the color scheme:
config.color_scheme = 'AdventureTime'
-- 关闭窗口的bar
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.default_prog  = {'powershell'}
config.enable_scroll_bar = true
config.window_padding = {
  left = 2,
  right = 2,
  top = 0,
  bottom = 0,
}
config.window_background_image = 'D:\\.dotfile\\wezterm\\background.png'
config.window_background_image_hsb = {
    -- Darken the background image by reducing it to 1/3rd
  brightness = 0.1,

  -- You can adjust the hue by scaling its value.
  -- a multiplier of 1.0 leaves the value unchanged.
  hue = 1.0,

  -- You can adjust the saturation also.
  saturation = 1.0,

}
--config.window_background_opacity = 0.5
-- and finally, return the configuration to wezterm
return config