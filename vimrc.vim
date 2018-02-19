set encoding=utf-8
scriptencoding utf-8
set fileencodings=utf-8
"
augroup MyAutoCmd
  autocmd!
augroup END

source $XDG_CONFIG_HOME/rc/options.rc.vim

" + dein {{{
if has('nvim')
  let s:dein_cache_path = expand('~/.vim/cache/nvim/dein')
else
  let s:dein_cache_path = expand('~/.vim/cache/vim/dein')
endif

let s:clone_repositories = ['Shougo/dein.vim', 'vim-jp/vimdoc-ja']
if &runtimepath !~ '/dein.vim'
  for s:repos in s:clone_repositories
    let s:repos_path = s:dein_cache_path . '/repos/github.com/' . s:repos
    if !isdirectory(s:repos_path)
      execute '!git clone https://github.com/' . s:repos . '.git ' . s:repos_path
    endif
    execute 'set runtimepath+=' . s:repos_path
  endfor
endif

syntax enable

if dein#load_state(s:dein_cache_path)
  call dein#begin(s:dein_cache_path)

  call dein#load_toml($XDG_CONFIG_HOME . '/dein.toml', {'lazy' : 0})
  call dein#load_toml($XDG_CONFIG_HOME . '/deinlazy.toml', {'lazy' : 1})
  call dein#end()
  call dein#save_state()
endif

if dein#check_install(['vimproc.vim'])
 call dein#install(['vimproc.vim'])
endif
if !has('vim_starting') && dein#check_install()
  call dein#install()
endif
" deinの読み込み後に行う
" filetype on
colorscheme lighthouse
filetype plugin indent on
set noimdisable
" }}}
"
source $XDG_CONFIG_HOME/rc/mappings.rc.vim
