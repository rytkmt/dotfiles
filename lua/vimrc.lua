vim.o.encoding='utf-8'
vim.o.fileencodings='utf-8'

vim.cmd('augroup MyAutoCmd')
vim.cmd('autocmd!')
vim.cmd('augroup END')

vim.cmd('augroup vimrc-highlight')
vim.cmd('autocmd!')
vim.cmd('autocmd Syntax * if 1000 < line(\'$\') | syntax sync minlines=100 | endif')
vim.cmd('augroup END')

vim.cmd('so $XDG_CONFIG_HOME/rc/filetypes.rc.vim')
vim.cmd('so $XDG_CONFIG_HOME/rc/options.rc.vim')

-- dein {{{

local dein_cache_path = nil
if vim.fn.has('nvim') == 1 then
 dein_cache_path = vim.fn.expand('~/.vim/cache/nvim/dein')
else
 dein_cache_path = vim.fn.expand('~/.vim/cache/vim/dein')
end

vim.g['dein#install_github_api_token'] = vim.env.GITHUB_API_TOKEN

local dein_repo_dir = dein_cache_path..'/repos/github.com/Shougo/dein.vim'

if not string.match(vim.o.runtimepath, '/dein.vim') then
 if not (vim.fn.isdirectory(dein_repo_dir) ~= 1) then
   os.execute('git clone https://github.com/Shougo/dein.vim '..dein_repo_dir)
 end
 vim.o.runtimepath = dein_repo_dir..','..vim.o.runtimepath
end

vim.cmd('syntax enable')

if (vim.fn['dein#load_state'](dein_cache_path) == 1) then
 local xdg_dir = vim.env.XDG_CONFIG_HOME
 vim.fn['dein#begin'](dein_cache_path)
 vim.fn['dein#load_toml'](xdg_dir..'/dein.toml', { lazy = 0 })
 vim.fn['dein#load_toml'](xdg_dir..'/deinlazy.toml', { lazy = 1 })
 vim.fn['dein#end']()
 vim.fn['dein#save_state']()
end

if (vim.fn['dein#check_install']('vimproc.vim') ~= 0) then
vim.fn['dein#install']('vimproc.vim')
end

-- }}}

-- vim.cmd('so $XDG_CONFIG_HOME/vimrc.vim')

function set_colorscheme ()
  vim.cmd('colorscheme lighthouse')
end
pcall(set_colorscheme)

vim.cmd('filetype plugin indent on')

vim.cmd('set noimdisable')
vim.cmd('so $XDG_CONFIG_HOME/rc/mappings.rc.vim')
