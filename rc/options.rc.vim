" vimスクリプトで\を指定した際のインデント量
let g:vim_indent_cont = 1
" + kaoriya default settings {{{
" ++ plugins下のディレクトリをruntimepathへ追加 {{{
for s:path in split(glob($VIM.'/plugins/*'), '\n')
  if s:path !~# '\~$' && isdirectory(s:path)
    let &runtimepath = &runtimepath.','.s:path
  end
endfor
unlet! s:path
" ++ }}}
" ++ 日本語対応のための設定: {{{
"
" ファイルを読込むにトライする文字エンコードの順序を確定する。漢字コード自
" 動判別機能を利用する場合には別途iconv.dllが必要。iconv.dllについては
" README_w32j.txtを参照。ユーティリティスクリプトを読み込むことで設定される。
"source $VIM/plugins/kaoriya/encode_japan.vim

" メッセージを日本語にする (Windowsでは自動的に判断・設定されている)
if !(has('win32') || has('mac')) && has('multi_lang')
  if !exists('$LANG') || $LANG.'X' ==# 'X'
    if !exists('$LC_CTYPE') || $LC_CTYPE.'X' ==# 'X'
      language ctype ja_JP.eucJP
    endif
    if !exists('$LC_MESSAGES') || $LC_MESSAGES.'X' ==# 'X'
      language messages ja_JP.eucJP
    endif
  endif
endif
" MacOS Xメニューの日本語化 (メニュー表示前に行なう必要がある)
if has('mac')
  " set encoding=utf-8
  set ambiwidth=double
  if exists('$LANG') && $LANG ==# 'ja_JP.UTF-8'
    set langmenu=ja_ja.utf-8.macvim
  endif
endif
" 非GUI日本語コンソールを使っている場合の設定
if !has('gui_running') && &encoding != 'cp932' && &term == 'win32'
  set termencoding=cp932
endif
" ++ }}}
"  ++ その他設定{{{
if 1 && !filereadable($VIMRUNTIME . '/menu.vim') && has('gui_running')
  set guioptions+=M
endif
" コンソール版で環境変数$DISPLAYが設定されていると起動が遅くなる件へ対応
if !has('gui_running') && has('xterm_clipboard')
  set clipboard=exclude:cons\\\|linux\\\|cygwin\\\|rxvt\\\|screen
endif
if has('nvim')
  set clipboard+=unnamed
endif

" プラットホーム依存の特別な設定

" WinではPATHに$VIMが含まれていないときにexeを見つけ出せないので修正
if has('win32') && $PATH !~? '\(^\|;\)' . escape($VIM, '\\') . '\(;\|$\)'
  if !exists("g:restarted")
    let $PATH = $VIM . ';' . $PATH
  endif
endif

" ++ }}}
" + }}}
if has('mac')
  " Macではデフォルトの'iskeyword'がcp932に対応しきれていないので修正
  set iskeyword=@,48-57,_,128-167,224-235
endif

" autofmt: 日本語文章のフォーマット(折り返し)プラグイン.
set formatexpr=autofmt#japanese#formatexpr()

if has('nvim')
  if has('patch-7.4.1778')
    try
      set guicolors
    catch
    endtry
  endif
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  " 256色
  set t_Co=256
  set termguicolors
  " 背景色
  set background=dark
endif
" ++ 検索の挙動に関する設定:{{{
" 検索時に大文字小文字を無視 (noignorecase:無視しない)
set ignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase
"インクリメンタルサーチを行う
set incsearch
"検索結果をハイライト
set hlsearch
" ++ }}}
" ++ 編集に関する設定: {{{
"
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
" 括弧入力時に対応する括弧に一瞬移動する時間（0.1の倍数）
set matchtime=2
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM

set virtualedit+=block
" ++ }}}
" ++ GUI固有ではない画面表示の設定: {{{
" 行番号を非表示 (number:表示)
set number
" ルーラーを表示 (noruler:非表示)
set ruler
" タブや改行を表示 (list:表示)
set list
" どの文字でタブや改行を表示するかを設定
"set listchars=tab:>-,extends:<,trail:-,eol:<
set listchars=tab:>\ ,trail:-,nbsp:+
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
" 文脈によって解釈が異なる全角文字の幅を、2に固定する
set ambiwidth=double
" vimが自動で生成する（読み込み時など）tab幅をスペース2つ文にする
set shiftwidth=2
" 改行時などに、自動でインデントを設定してくれる
set smartindent
"vim設定をグループ化して閉じる
autocmd MyAutoCmd FileType vim setlocal foldmethod=marker
" ++ }}}
" ++ ファイル操作に関する設定: {{{
"
" バックアップファイルを作成しない (次行の先頭の " を削除すれば有効になる)
set nobackup
" swapファイルを作成しない
set noswapfile
" undoファイルを作成しない
set noundofile
" ++ }}}
" ++ その他：{{{
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

" 画面分割時の位置
set splitbelow
set splitright

"" texのconcealを無効化（#^ω^）
let g:tex_conceal=''
set conceallevel=0

" ヘルプの日本語化
set helplang=ja,en

" ++ }}}
" ++ ファイルタイプ別 {{{
" +++ quickfix {{{
source $XDG_CONFIG_HOME/rc/extensions/quickfix.vim
" +++ }}}
" ++ }}}
