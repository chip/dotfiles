local wezterm = require 'wezterm'

return {
  font = wezterm.font_with_fallback {
    {
      family = 'Victor Mono',
      weight = 'Bold',
      style = 'Normal',
    },
    { family = 'Fira Code', weight = 'Bold' },
    'Noto Color Emoji',
  },
  font_size = 24.0,
  -- window_background_image = '/Users/chip/wallpapers/isaac-martin-Apkr4nfK1mU-unsplash.jpeg',
  -- window_background_image = '/Users/chip/wallpapers/tianhao-wang-wr8sMt9E3bU-unsplash.jpeg',
  -- window_background_image = '/Users/chip/wallpapers/justin-smith-eHK0PGncD3k-unsplash.jpeg',
  -- window_background_image = '/Users/chip/wallpapers/andrew-ridley-jR4Zf-riEjI-unsplash.jpeg',
  window_background_image_hsb = {
    -- Darken the background image by reducing it to 1/3rd
    brightness = 0.1,

    -- You can adjust the hue by scaling its value.
    -- a multiplier of 1.0 leaves the value unchanged.
    hue = 1.0,

    -- You can adjust the saturation also.
    saturation = 1.0,
  },

  window_background_opacity = 0.85,
  text_background_opacity = 0.2,

  window_frame = {
    -- The font used in the tab bar.
    -- Roboto Bold is the default; this font is bundled
    -- with wezterm.
    -- Whatever font is selected here, it will have the
    -- main font setting appended to it to pick up any
    -- fallback fonts you may have used there.
    -- font = wezterm.font { family = 'Roboto', weight = 'Bold' },
    -- font = wezterm.font('JetBrains Mono', { weight = "Bold", italic = false }),

    -- The size of the font in the tab bar.
    -- Default to 10. on Windows but 12.0 on other systems
    font_size = 12.0,

    -- The overall background color of the tab bar when
    -- the window is focused
    active_titlebar_bg = '#333333',

    -- The overall background color of the tab bar when
    -- the window is not focused
    inactive_titlebar_bg = '#333333',
  },

  color_scheme = "SpaceGray",

  colors = {
    -- The default text color
    -- foreground = 'silver',
    -- The default background color
    -- background = 'black',
    -- Overrides the cell background color when the current cell is occupied by the
    -- cursor and the cursor style is set to Block
    -- cursor_bg = '#52ad70',
    -- Overrides the text color when the current cell is occupied by the cursor
    -- cursor_fg = 'black',

    tab_bar = {
      -- The color of the inactive tab bar edge/divider
      inactive_tab_edge = '#575757',
    },
  },
}
