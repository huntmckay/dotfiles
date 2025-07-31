local wezterm = require 'wezterm'
local config = wezterm.config_builder()

local theme = wezterm.plugin.require('https://github.com/neapsix/wezterm').main

local function get_appearance()
  if wezterm.gui then
    return wezterm.gui:get_appearance()
  end
  return 'Dark'
end

local function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'OneDark (base16)'
  end
end

config.color_scheme = scheme_for_appearance(get_appearance())
config.enable_wayland = false
config.window_background_opacity = 1.0
config.text_background_opacity = 0.3
config.font = wezterm.font 'Mononoki Nerd Font Mono'
-- config.window_background_image = wezterm.home_dir .. '/Pictures/slurry.jpg'
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"

wezterm.log_info("wezterm config loaded")

return config
