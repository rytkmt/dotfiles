local colors = {
    black     = '#000000',
    white     = '#eeeeee',
    red       = '#ff7076',
    green     = '#88bf88',
    blue      = '#82aaff',
    purple    = '#be8ce8',
    yellow    = '#c2c042',
    gray      = '#2f2f2f',
    darkgray  = '#202020',
    lightgray = '#838383',
    offwhite  = '#d8d8c6'
}

local function mode_color(color)
  return {
    a = { bg = color, fg = colors.darkgray },
    b = { bg = colors.gray, fg = colors.white },
    c = { bg = colors.gray, fg = color },
    x = { bg = colors.gray, fg = colors.offwhite },
  }
end

local custom_theme = {
  normal = mode_color(colors.green),
  insert = mode_color(colors.blue),
  visual = mode_color(colors.purple),
  replace = mode_color(colors.red),
  command = mode_color(colors.yellow),
  inactive = {
    a = { bg = colors.darkgray, fg = colors.lightgray },
    b = { bg = colors.darkgray, fg = colors.lightgray },
    c = { bg = colors.darkgray, fg = colors.lightgray },
  },
}

local function location()
  return 'L%-3l| C%-3v'
end

require'lualine'.setup{

  options = {
    theme  = custom_theme,
    component_separators = { left = '', right = '|'},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
      { 'filename', symbols = { modified = ' ', readonly = ' ' }, }
    },
    lualine_c = {'branch'},
    lualine_x = { function() return vim.call("FileDirUnderRootWithCache") end },
    lualine_y = {
      'filetype',
      'encoding',
      {
        'fileformat',
        symbols = {
          unix = 'LF', -- e712
          dos = 'CRLF', -- e70f
          mac = 'CR', -- e711
        }
      }
    },
    lualine_z = { location }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {
      { 'filename', symbols = { modified = ' ', readonly = ' ' }, }
    },
    lualine_c = {'branch'},
    lualine_x = {
      { 'filetype', colored = false }
    },
    lualine_y = {},
    lualine_z = {}
  },
  ...
}
