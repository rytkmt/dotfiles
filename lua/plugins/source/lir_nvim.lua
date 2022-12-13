local actions = require'lir.actions'
local mark_actions = require 'lir.mark.actions'
local clipboard_actions = require'lir.clipboard.actions'

local lir = require('lir')
local utils = lir.utils
local config = lir.config
local Path = require('plenary.path')

local function lcd(path)
  vim.cmd(string.format(':lcd %s', path))
end

local no_confirm_patterns = {
  '^LICENSE$',
  '^Makefile$'
}

local need_confirm = function(filename)
  for _, pattern in ipairs(no_confirm_patterns) do
    if filename:match(pattern) then
      return false
    end
  end
  return true
end

local function input_newfile()
  local save_curdir = vim.fn.getcwd()
  lcd(lir.get_context().dir)
  local name = vim.fn.input('New file: ', '', 'file')
  lcd(save_curdir)

  if name == '' then
    return
  end

  if name == '.' or name == '..' then
    utils.error('Invalid file name: ' .. name)
    return
  end

  -- If I need to check, I will.
  if need_confirm(name) then
    -- '.' is not included or '/' is not included, then
    -- I may have entered it as a directory, I'll check.
    if not name:match('%.') and not name:match('/') then
      if vim.fn.confirm("Directory?", "&No\n&Yes", 1) == 2 then
        name = name .. '/'
      end
    end
  end

  local path = Path:new(lir.get_context().dir .. name)
  if string.match(name, '/$') then
    -- mkdir
    name = name:gsub('/$', '')
    path:mkdir({
      parents = true,
      mode = tonumber('700', 8),
      exists_ok = false
    })
  else
    -- touch
    path:touch({
      parents = true,
      mode = tonumber('644', 8),
    })
  end

  -- If the first character is '.' and show_hidden_files is false, set it to true
  if name:match([[^%.]]) and not config.values.show_hidden_files then
    config.values.show_hidden_files = true
  end

  actions.reload()

  -- Jump to a line in the parent directory of the file you created.
  local lnum = lir.get_context():indexof(name:match('^[^/]+'))
  if lnum then
    vim.cmd(tostring(lnum))
  end
end

require'lir'.setup {
  show_hidden_files = true,
  devicons_enable = true,
  mappings = {
    ['e']     = actions.edit,
    ['<CR>']  = actions.edit,
    ['o']     = actions.edit,
    ['l']     = actions.edit,
    ['s']     = actions.split,
    ['v']     = actions.vsplit,
    ['t']     = actions.tabedit,

    ['R']     = actions.reload,
    ['h']     = actions.up,
    ['<C-q>'] = actions.quit,
    ['<C-[>'] = actions.quit,
    ['q']     = actions.quit,

    ['a']     = input_newfile,
    -- ['ad']    = actions.mkdir,
    -- ['af']    = actions.newfile,
    ['r']     = actions.rename,
    ['@']     = actions.cd,
    ['Y']     = actions.yank_path,
    ['.']     = actions.toggle_show_hidden,
    ['d']     = actions.delete,

    ['+']     = function()
      mark_actions.toggle_mark()
      vim.cmd('normal! j')
    end,
    ['c']     = clipboard_actions.copy,
    ['m']     = clipboard_actions.cut,
    ['p']     = clipboard_actions.paste,
  },
  float = {
    winblend = 0,
    curdir_window = {
      enable = true,
      highlight_dirname = true
    },

    -- -- You can define a function that returns a table to be passed as the third
    -- -- argument of nvim_open_win().
    win_opts = function()
      local width = math.floor(vim.o.columns * 0.7)
      local height = math.floor(vim.o.lines * 0.7)
      return {
        border = require("lir.float.helper").make_border_opts({
          "╭", "─", "╮", "│", "╯", "─", "╰", "│",
        }, "Normal"),
        width = width,
        height = height,
        row = 5,
        col = math.floor((vim.o.columns - width) / 2),
      }
    end,
  },
  hide_cursor = false,
}

-- custom folder icon
require'nvim-web-devicons'.set_icon({
  lir_folder_icon = {
    icon = "",
    color = "#7ebae4",
    name = "LirFolderNode"
  }
})

-- use visual mode
function _G.LirSettings()
  -- vim.api.nvim_buf_set_keymap(0, 'x', 'J', ':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>', {noremap = true, silent = true})

  -- echo cwd
  vim.api.nvim_echo({{vim.fn.expand('%:p'), 'Normal'}}, false, {})
end

local function set_open_keymap(key, dir)
  vim.api.nvim_set_keymap("n", "[filer]" .. key, ":lua require'lir.float'.init(" .. dir .. ")<CR>", { noremap = false, silent = true, nowait = true })
end

set_open_keymap("d", "vim.fn.FindGitProjectRoot()")
set_open_keymap("b", "vim.fn.expand('%:p:h')")
set_open_keymap("h", "vim.env.HOME")
set_open_keymap("v", "vim.env.XDG_CONFIG_HOME")

vim.cmd [[augroup lir-settings]]
vim.cmd [[  autocmd!]]
vim.cmd [[  autocmd Filetype lir :lua LirSettings()]]
vim.cmd [[augroup END]]
