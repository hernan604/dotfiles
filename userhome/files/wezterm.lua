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
config.font = wezterm.font {
  -- ** GOHUFONT NEEDS TO BE THE OTB
  family = 'Gohu GohuFont', weight="Regular",
  harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
}
 

config.window_background_gradient = {
  colors = { '343434', '#000000' },
  orientation = {
    Radial = {
      -- Specifies the x coordinate of the center of the circle,
      -- in the range 0.0 through 1.0.  The default is 0.5 which
      -- is centered in the X dimension.
      cx = 0.75,

      -- Specifies the y coordinate of the center of the circle,
      -- in the range 0.0 through 1.0.  The default is 0.5 which
      -- is centered in the Y dimension.
      cy = 0.75,

      -- Specifies the radius of the notional circle.
      -- The default is 0.5, which combined with the default cx
      -- and cy values places the circle in the center of the
      -- window, with the edges touching the window edges.
      -- Values larger than 1 are possible.
      radius = 1.25,
    },
  },
}

 
-- For example, changing the color scheme:
config.color_scheme = 'Apple Classic'
-- config.color_scheme = 'Mathias'


config.keys = {
    {
        key="Backspace",
        action = wezterm.action.SendString("\b")
    },
    {
        key="Backspace",
        mods="SHIFT",
        action = wezterm.action.SendString("\b")
    }
}


-- and finally, return the configuration to wezterm
return config

