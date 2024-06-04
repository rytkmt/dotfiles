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

-- packer {{{
local packer_dir = vim.env.HOME..'/.local/share/nvim/site/pack/packer/opt/packer.nvim'
if not string.match(vim.o.runtimepath, '/packer.nvim') then
  if vim.fn.isdirectory(packer_dir) ~= 1 then
    os.execute('git clone https://github.com/wbthomason/packer.nvim '..packer_dir)
  end
  vim.o.runtimepath = packer_dir..','..vim.o.runtimepath
end

require'plugins'
vim.cmd[[autocmd BufWritePost plugins.lua PackerCompile]]
-- }}}

local state, mod = pcall(require, "lighthouse")
if state then
  vim.cmd('colorscheme lighthouse')
end


vim.cmd('set noimdisable')
vim.cmd('so $XDG_CONFIG_HOME/rc/functions.rc.vim')
vim.cmd('so $XDG_CONFIG_HOME/rc/mappings.rc.vim')

local function is_wsl()
  return os.execute("uname -a | grep -i microsoft > /dev/null 2>&1") == 0
end
if is_wsl() then
  require("rc.wsl")
end

if vim.fn.has("python3") == 1 then
  vim.g.python3_host_prog = string.gsub(vim.fn.system("which python3"), "\n", "")
end
