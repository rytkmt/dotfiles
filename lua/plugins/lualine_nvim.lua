local colors = {
    black     = '#000000',
    white     = '#eeeeee',
    red       = '#ffa0a0',
    green     = '#88cf88',
    blue      = '#92baff',
    magenta   = '#feacd0',
    cyan      = '#a0bfdf',
    gray      = '#2f2f2f',
    darkgray  = '#202020',
    lightgray = '#434343'
}

local custom_theme = {
  normal = {
    a = { bg = colors.blue, fg = colors.darkgray },
    b = { bg = colors.lightgray, fg = colors.blue },
    c = { bg = colors.gray, fg = colors.white },
  },
  insert = {
    a = { bg = colors.cyan, fg = colors.darkgray },
    b = { bg = colors.lightgray, fg = colors.cyan },
    c = { bg = colors.gray, fg = colors.white },
  },
  visual = {
    a = { bg = colors.magenta, fg = colors.darkgray },
    b = { bg = colors.lightgray, fg = colors.magenta },
    c = { bg = colors.gray, fg = colors.white },
  },
  replace = {
    a = { bg = colors.red, fg = colors.darkgray },
    b = { bg = colors.lightgray, fg = colors.red },
    c = { bg = colors.gray, fg = colors.white },
  },
  command = {
    a = { bg = colors.green, fg = colors.darkgray },
    b = { bg = colors.lightgray, fg = colors.green },
    c = { bg = colors.gray, fg = colors.white },
  },
  inactive = {
    a = { bg = colors.darkgray, fg = colors.lightgray },
    b = { bg = colors.darkgray, fg = colors.lightgray },
    c = { bg = colors.darkgray, fg = colors.lightgray },
  },
}
-- Change the background of lualine_c section for normal mode
-- custom_gruvbox.normal.c.bg = '#333333' -- rgb colors are supported
require'lualine'.setup{
  options = {
    theme  = custom_theme,
    component_separators = { left = '|', right = '|'},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {
      { 'filename', symbols = { modified = ' ', readonly = ' ' }, }
    },
    lualine_x = {
      'encoding',
      {
        'fileformat',
        symbols = {
          unix = 'LF', -- e712
          dos = 'CRLF', -- e70f
          mac = 'CR', -- e711
        }
      },
      'filetype'
    },
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {
      { 'filetype', colored = false }
    },
    lualine_y = {},
    lualine_z = {}
  },
  ...
}
