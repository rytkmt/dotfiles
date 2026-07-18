vim.o.encoding='utf-8'
vim.o.fileencodings='utf-8'

vim.cmd('augroup MyAutoCmd')
vim.cmd('autocmd!')
vim.cmd('augroup END')

vim.cmd('augroup vimrc-highlight')
vim.cmd('autocmd!')
vim.cmd('autocmd Syntax * if 1000 < line(\'$\') | syntax sync minlines=100 | endif')
vim.cmd('augroup END')

require("rc.options")
require("rc.settings")
require("rc.ambwidth")
require("rc.lsp")
require("rc.commands")

-- lazy.nvim {{{
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(require("plugins_spec"), {
  defaults = { lazy = false },
  install = { colorscheme = { "lighthouse" } },
  checker = { enabled = false },
  change_detection = { notify = false },
  performance = {
    rtp = {
      paths = { vim.env.XDG_CONFIG_HOME },
    },
  },
})
-- }}}

pcall(require, "lsp")

local state, _ = pcall(require, "lighthouse")
if state then
  vim.cmd('colorscheme lighthouse')
end


vim.cmd('set noimdisable')
vim.cmd('so $XDG_CONFIG_HOME/rc/functions.rc.vim')
vim.cmd('so $XDG_CONFIG_HOME/rc/mappings.rc.vim')

vim.g.python3_host_prog = vim.env.HOME .. "/.venvs/neovim/bin/python"
