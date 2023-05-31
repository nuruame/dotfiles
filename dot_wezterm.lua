local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end


-- font settings
config.font = wezterm.font_with_fallback {
  'Envy Code R',
  'kyo',
}
config.font_size = 16.0

-- tab bar settings
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.show_tab_index_in_tab_bar = false

-- window settings
config.window_padding = {
  left = '20pt',
  right = '20pt',
  top = '20pt',
  bottom = '20pt'
}
config.window_background_opacity = 1.00
config.default_cursor_style = "SteadyBar"

-- color settings
config.colors = {
  foreground = '#e8e3e3',
  background = '#151515',

  cursor_bg = '#e8e3e3',
  cursor_fg = '#151515',
  cursor_border = '#e8e3e3',

  selection_fg = '#151515',
  selection_bg = '#e8e3e3',

  ansi = {
    '#151515',
    '#B66467',
    '#8C977D',
    '#D9BC8C',
    '#8DA3B9',
    '#A988B0',
    '#8AA6A2',
    '#E8E3E3',
  },
  brights = {
    '#424242',
    '#B66467',
    '#8C977D',
    '#D9BC8C',
    '#8DA3B9',
    '#A988B0',
    '#8AA6A2',
    '#E8E3E3',
  }
}

return config;
