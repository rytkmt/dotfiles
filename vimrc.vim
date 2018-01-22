set encoding=utf-8
scriptencoding utf-8
" 日本語版のデフォルト設定ファイル(vimrc) - Vim7用試作
"
" Last Change: 12-Jan-2018.
" Maintainer:  Ryo Tsukamoto <r12tkmt@gmail.com>
"
augroup MyAutoCmd
  autocmd!
augroup END
augroup MyAutoLazyCmd
  autocmd!
augroup END


source $XDG_CONFIG_HOME/rc/options.rc.vim

" + dein {{{
if has('nvim')
  let s:dein_cache_path = expand('~/.vim/cache/nvim/dein')
else
  let s:dein_cache_path = expand('~/.vim/cache/vim/dein')
endif

let s:dein_dir = s:dein_cache_path .'/repos/github.com/Shougo/dein.vim'
if &runtimepath !~ '/dein.vim'
  if !isdirectory(s:dein_dir)
    execute '!git clone https://github.com/Shougo/dein.vim ' . s:dein_dir
  endif
  execute 'set runtimepath+=' . s:dein_dir
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
