local colors = {
    black     = '#000000',
    white     = '#eeeeee',
    red       = '#ff7076',
    green     = '#72b072',
    blue      = '#6294d8',
    purple    = '#a08ce0',
    yellow    = '#d0b822',
    gray      = '#2f2f2f',
    darkgray  = '#202020',
    lightgray = '#838383',
    offwhite  = '#d0cbad'
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
  return 'C%-3v'
end

require'lualine'.setup{
  options = {
    theme  = custom_theme,
    component_separators = { left = '', right = '|'},
    -- section_separators = { left = '', right = ''},
    section_separators = { left = '', right = '' },
    disabled_filetypes = {},
    -- file_status = false
  },
  sections = {
    lualine_a = {
      { 'mode', padding = { left = 2, right = 2 }, separator = { left = ' ', right = '' } }
    },
    lualine_b = {'filename'},
    lualine_c = {'branch'},
    lualine_x = { function() return vim.call("FileDirUnderRootWithCache") end },
    lualine_y = {
      'filetype',
      'encoding',
      {
        'fileformat',
        symbols = {
          unix = 'LF', -- e712
          dos = 'CRLF', -- e70f
          mac = 'CR', -- e711
        }
      },
      function()
        return '%LL'
      end
    },
    lualine_z = {
      { location, padding = { left = 1, right = 0 }, separator = { left = '', right = ' ' } }
    }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {'filename'},
    lualine_c = {'branch'},
    lualine_x = {
      { 'filetype', colored = false }
    },
    lualine_y = {},
    lualine_z = {}
  },
  ...
}
