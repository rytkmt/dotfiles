if !&compatible
  set nocompatible
endif

augroup MyAutoCmd
  autocmd!
augroup END

" + standard settings {{{
syntax enable
if has('patch-7.4.1778')
  set guicolors
endif
if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
" 256色
set t_Co=256
set termguicolors
" 背景色
set background=dark
" 検索時に大文字小文字を無視 (noignorecase:無視しない)
set ignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase
"インクリメンタルサーチを行う
set incsearch
"検索結果をハイライト
set hlsearch
" タブの画面上での幅
set tabstop=2
" タブをスペースに展開しない (expandtab:展開する)
set expandtab
" 自動的にインデントする (noautoindent:インデントしない)
set autoindent
" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan
" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM
" 行番号を非表示 (number:表示)
set number
" ルーラーを表示 (noruler:非表示)
set ruler
" タブや改行を表示 (list:表示)
set list
" どの文字でタブや改行を表示するかを設定
"set listchars=tab:>-,extends:<,trail:-,eol:<
" 長い行を折り返して表示 (nowrap:折り返さない)
set nowrap
" 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2
" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=2
" コマンドをステータス行に表示
set showcmd
" タイトルを表示
set title
"閉括弧が入力された時、対応する括弧を強調する
set showmatch
" 文脈によって解釈が異なる全角文字の幅を、2に固定する
set ambiwidth=double
" vimが自動で生成する（読み込み時など）tab幅をスペース2つ文にする
set shiftwidth=2
" 改行時などに、自動でインデントを設定してくれる
set smartindent
"vim設定をグループ化して閉じる
autocmd MyAutoCmd FileType vim setlocal foldmethod=marker
" バックアップファイルを作成しない (次行の先頭の " を削除すれば有効になる)
set nobackup
" swapファイルを作成しない
set noswapfile
" undoファイルを作成しない
set noundofile
" "0"で始まる数値を、8進数として扱わないようにする
set nrformats-=octal
" ファイルの保存をしていなくても、べつのファイルを開けるようにする
set hidden

set history=50
"新しい行を作った時に高度な自動インデントを行う
set smarttab
" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
" 行を強調表示
set cursorline
" 列を強調表示
" set cursorcolumn
" power_line に必須
set t_Co=256
" 挿入モードのIMEのデフォルト値
set iminsert=0
" 検索時のIMEのデフォルト値(-1はiminsertの値を参照するという意味)
set imsearch=-1
" Windows でもパスの区切り文字を / にする
set shellslash
" コマンドラインモードでTABキーによるファイル名補完を有効にする
set wildmenu wildmode=list:longest,full
" }}}
" + dein {{{
if has('nvim')
  let s:dein_cache_path = expand('~/.vim/cache/nvim/dein')
else
  let s:dein_cache_path = expand('~/.vim/cache/vim/dein')
endif

let s:dein_dir = s:dein_cache_path
                 \ .'/repos/github.com/Shougo/dein.vim'
if &runtimepath !~ '/dein.vim'
  if !isdirectory(s:dein_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' . s:dein_dir
  endif
  execute 'set runtimepath+=' . fnamemodify(s:dein_dir, ':p')
endif

if dein#load_state(s:dein_cache_path)
  call dein#begin(s:dein_cache_path)

  call dein#load_toml($XDG_CONFIG_HOME . '/nvim/dein.toml', {'lazy' : 0})
  call dein#load_toml($XDG_CONFIG_HOME . '/nvim/deinlazy.toml', {'lazy' : 1})
  call dein#end()
  call dein#save_state()
endif

if dein#check_install(['vimproc.vim'])
  call dein#install(['vimproc.vim'])
endif
" }}}
" + command mapping {{{
" ++ タブ操作 {{{
" タブを閉じる
nnoremap [tab]q :<C-u>tabc<CR>
" 開いているタブ以外を閉じる
nnoremap [tab]o :<C-u>tabo<CR>
" 新規タブ
nnoremap [tab]n :<C-u>tabnew<CR>
" タブの詳細一覧
nnoremap [tab]s :<C-u>tabs<CR>
" タブ移動（左）
nnoremap [tab]h gT<CR>
" タブ移動（左端）
nnoremap [tab]H :<C-u>tabr<CR>
" タブ移動（右）
nnoremap [tab]l gt<CR>
" タブ移動（右端）
nnoremap [tab]L :<C-u>tabl<CR>
" タブ移動（番号）
nnoremap [tab]1 :<C-u>tabn 1<CR>
nnoremap [tab]2 :<C-u>tabn 2<CR>
nnoremap [tab]3 :<C-u>tabn 3<CR>
nnoremap [tab]4 :<C-u>tabn 4<CR>
nnoremap [tab]5 :<C-u>tabn 5<CR>
nnoremap [tab]6 :<C-u>tabn 6<CR>
nnoremap [tab]7 :<C-u>tabn 7<CR>
nnoremap [tab]8 :<C-u>tabn 8<CR>
nnoremap [tab]9 :<C-u>tabn 9<CR>
nnoremap [tab]10 :<C-u>tabn 10<CR>
nnoremap [tab]m :<C-u>call <SID>move_buf_to_new_tab()<CR>

" 作業ウィンドウを別タブで開く
function! s:move_buf_to_new_tab()
  let move_buf_to_new_tab_path = expand("%:p")
  try
    q
  catch
    return
  endtry
  execute "tabe " . move_buf_to_new_tab_path
endfunction
" ++ }}}
" ++ ウィンドウ操作 {{{

" ウィンドウ遷移
nnoremap [window]h <C-w>h
nnoremap [window]j <C-w>j
nnoremap [window]k <C-w>k
nnoremap [window]l <C-w>l
" ウィンドウ移動
nnoremap [window]H <C-w>H
nnoremap [window]J <C-w>J
nnoremap [window]K <C-w>K
nnoremap [window]L <C-w>L
" 高さ変更
nnoremap [window]d 10<C-w>-
nnoremap [window]u 10<C-w>+
" 高さ最大
nnoremap [window]U <C-w>_
" 幅変更
nnoremap [window]. 12<C-w>>
nnoremap [window], 12<C-w><
" 幅最大化
nnoremap [window]m <C-w><Bar>
" 幅揃える
nnoremap [window]= <C-w>=

"ヤンク文字で検索
cmap <S-Space> <C-r>"
cmap <C-Space> <C-r>*
"挿入モード終了
imap <C-Space> <ESC>
vmap <nowait> <C-Space> <ESC>
" ++ }}}
" ++ その他 {{{
"ヤンクした値がdやxで消えないように（復活させる）
nnoremap PP "0p
vnoremap PP "0p
nnoremap ZZ <Nop>

vnoremap d "_d
nnoremap dd "_dd
nnoremap de "_de
nnoremap dL "_d$
nnoremap dw "_dw
inoremap <C-d> <C-o>"_dd
nnoremap s "_s
vnoremap s "_s
nnoremap D "_D
noremap x "_x
nnoremap tt dd
nnoremap te de
nnoremap tL d$
nnoremap tw dw
nnoremap T D
vnoremap t x
nnoremap y%f :<C-u>redi! @"> \| echo expand("%:t") \| redi END<CR>
nnoremap y%p :<C-u>redi! @"> \| echo expand("%:p") \| redi END<CR>
nnoremap y%d :<C-u>redi! @"> \| echo expand("%:p:h") \| redi END<CR>
noremap <ESC><ESC> :<C-u>noh<CR>
cmap <C-j> <LEFT>
cmap <C-k> <RIGHT>

" 逆に普通の行単位で移動したい時のために逆の map も設定しておく
nnoremap gj j
nnoremap gk k

" カーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
noremap <S-h>   ^
noremap <S-j>  4gj
noremap <C-j>   }
noremap <S-k>  4gk
noremap <C-k>   {
noremap <S-l>   $
noremap zl zL
noremap zh zH
noremap zj 4<C-e>
noremap zk 4<C-y>

nnoremap <silent> い i
nnoremap <silent> あ a
nnoremap <silent> お o
nnoremap <silent> っｄ dd
nnoremap <silent> う u
nnoremap <silent> ：ｗｑ :wq

" ruby if endの%移動
source $VIMRUNTIME/macros/matchit.vim
augroup matchit
  au!
  au FileType ruby let b:match_words = '\<\(module\|class\|def\|begin\|do\|if\|unless\|case\)\>:\<\(elsif\|when\|rescue\)\>:\<\(else\|ensure\)\>:\<end\>'
augroup END
nmap m %
vmap m %
" マーク
nnoremap M m
nnoremap MM :<C-u>marks<CR>
" 前回変更点をVモードで選択
nnoremap gv `[v]`
nnoremap <C-h> :h<Space>

"メタ文字扱いのオプションをvery magicを初期値に
nnoremap / /\v
nnoremap ? ?\v
" キーマップ用
let mapleader = "\<Space>"
map <Space> <Nop>

" コピペ
vmap <Leader>c "*y
nmap <Leader>v "*p
vmap <Leader>v "*p

nmap <Leader>z [other]
nmap <Leader>t [tab]
nmap <Leader>w [window]
nmap <Leader>q [ref]
nmap <Leader>e [edit]

nmap [unite] <Nop>
nmap <Leader>u [unite]


nmap [filer] <Nop>
nmap <Leader>f [filer]

nmap [search] <Nop>
nmap <Leader>s [search]

nmap <Leader>r [replace]

nmap [ctag] <Nop>
vmap [ctag] <Nop>
nmap <Leader>g [ctag]
vmap <Leader>g [ctag]

"=================================
"     _  _  _  _     _
"  q  W  E  R  T  y  U  i  o  p
"      _     _  _
"   a  S  d  F  G  h  j  k  l
"    _     _  _
"    Z  x  C  V  b  n  m
"
"=================================

nnoremap [other]h :so $VIMRUNTIME/syntax/hitest.vim
nnoremap [other]s :sp<CR>:VimShellBufferDir<CR>
nnoremap [other]r ::VimShellInteractive irb<CR>
nnoremap [other]v :<C-u>tabedit $MYVIMRC<CR>
nnoremap [other]l :<C-u>so ~/.vimrc<CR>:<C-u>so ~/.gvimrc<CR>
nnoremap [edit]s :e ++enc=shift_jis<CR>
nnoremap [edit]u :e ++enc=utf-8<CR>
nnoremap [edit]e :e ++enc=euc-jp<CR>

if has('win32')
  let $MEMO = $HOME . '/workspace/sql.sql'
  nnoremap [other]q :<C-u>tabedit $MEMO<CR>
endif
"if has('syntax')
"  autocmd MyAutoCmd BufWinEnter * let w:m1 = matchadd("ZenkakuSpace", '　')
"  autocmd MyAutoCmd WinEnter * let w:m1 = matchadd("ZenkakuSpace", '　')
"endif
autocmd MyAutoCmd FileType help nnoremap q :q<CR>
" ++ }}}
" }}}
" * ctags {{{
  function! s:CheckProject()
    " if(!neobundle#is_installed('vim-rooter') || !neobundle#is_installed('vimproc.vim'))
    "   return
    " endif

    let l:open_project = FindRootDirectory()

    "Rakefileの存在でrailsプロジェクトか判断
    if filereadable(l:open_project .'/Rakefile')
      if !exists('g:gem_paths')
        call s:SetGemPaths()
      endif

      if !exists('g:gem_paths') && len(g:gem_paths) > 0 && !exists('g:gem_tags')
        call s:SetGemTags()
      endif

      if !exists('w:current_project') || w:current_project != l:open_project
        let w:current_project = l:open_project
        exe ':cd ' . w:current_project
        call s:ChangeProject()
      endif
    else
      if exists('w:project_tag')
        unlet w:project_tag
      endif
    endif
  endfunction

  function! s:SetGemPaths()
    let l:gem_paths = []
    if has('win32')
      let l:gem_paths = split(system('gem environment gempath'), ';')
    else
      " 配列で返るため明示的に0指定(要素は1つのため問題なし)
      let l:gem_paths = split(split(system('! gem environment gempath'), '\r')[0], ':')
    endif

    let g:gem_paths = []
    for gem_path in l:gem_paths
      let l:gem_root = substitute(gem_path, '\n', '', 'g') . '/gems'
      if isdirectory(l:gem_root)
        call add(g:gem_paths, l:gem_root)
      endif
    endfor
  endfunction

  function! s:SetGemTags()
    let g:gem_tags = []
    for gem_path in g:gem_paths
      if filereadable(gem_path . '/tags')
        call add(g:gem_tags, gem_path . '/tags')
      endif
    endfor
  endfunction

  function! s:ChangeProject()
    if !exists('w:current_project')
      return
    endif
    if exists('w:project_tag')
      unlet w:project_tag
    endif

    if filereadable(w:current_project . '/tags')
      let w:project_tag = w:current_project . '/tags'
    endif

    let l:set_tags = []
    if exists('w:project_tag')
      call add(l:set_tags, w:project_tag)
    endif

    if exists('g:gem_tags') && len(g:gem_tags) > 0
      for gem_tag in g:gem_tags
        call add(l:set_tags, gem_tag)
      endfor
    endif

    if len(l:set_tags) > 0
      let &l:tags=join(l:set_tags, ',')
    endif
  endfunction

  function! s:GenerateProjectTag()
    let l:project = FindRootDirectory()
    if filereadable(l:project .'/Rakefile')
      " tagファイルを削除
      try
        if filereadable(l:project . '/tags')
          if has('win32')
            call system("DEL " . l:project . '/tags')
          else
            call system("rm " . l:project . '/tags')
          endif
        endif
      catch
        echom 'can not delete tags'
        return
      endtry

      " tagファイルを作成
      if has('win32')
        echom 'up'
        call s:system_async("CD " . l:project . " && ctags -R", 's:GeneratedProjectTag')
      else
        call s:system_async("cd " . l:project . " | ctags -R", 's:GeneratedProjectTag')
      endif
    else
      echom 'nnot found rails project'
    endif
  endfunction

  function! s:GeneratedProjectTag()
    echom 'tag generate!!!'
  endfunction
  autocmd MyAutoCmd BufEnter,WinEnter * call s:CheckProject()

  " nnoremap [ctag]u :<C-u>call UpdateTags()<CR>
  nnoremap [ctag]j <C-]>
  nnoremap [ctag]k <C-t>
  nnoremap [ctag]l :<C-u>tselect<CR>
  nnoremap [ctag]; :<C-u>tags<CR>
  nnoremap [ctag]v :vsp<CR>:exe("tjump " . expand("<cword>"))<CR>
  nnoremap [ctag]s :exe("stj " . expand("<cword>"))<CR>
  vnoremap [ctag]j g<C-]>
" }}}
colorscheme lucius
filetype plugin indent on
