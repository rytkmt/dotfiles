scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0: (この行に関しては:help modelineを参照)
"
" An example for a Japanese version vimrc file.
" 日本語版のデフォルト設定ファイル(vimrc) - Vim7用試作
"
" Last Change: 15-May-2017.
" Maintainer:  MURAOKA Taro <koron.kaoriya@gmail.com>
"
" 解説:
" このファイルにはVimの起動時に必ず設定される、編集時の挙動に関する設定が書
" かれています。GUIに関する設定はgvimrcに書かかれています。
"
" 個人用設定は_vimrcというファイルを作成しそこで行ないます。_vimrcはこのファ
" イルの後に読込まれるため、ここに書かれた内容を上書きして設定することが出来
" ます。_vimrcは$HOMEまたは$VIMに置いておく必要があります。$HOMEは$VIMよりも
" 優先され、$HOMEでみつかった場合$VIMは読込まれません。
"
" 管理者向けに本設定ファイルを直接書き換えずに済ませることを目的として、サイ
" トローカルな設定を別ファイルで行なえるように配慮してあります。Vim起動時に
" サイトローカルな設定ファイル($VIM/vimrc_local.vim)が存在するならば、本設定
" ファイルの主要部分が読み込まれる前に自動的に読み込みます。
"
" 読み込み後、変数g:vimrc_local_finishが非0の値に設定されていた場合には本設
" 定ファイルに書かれた内容は一切実行されません。デフォルト動作を全て差し替え
" たい場合に利用して下さい。
"
" 参考:
"   :help vimrc
"   :echo $HOME
"   :echo $VIM
"   :version
"---------------------------------------------------------------------------
" サイトローカルな設定($VIM/vimrc_local.vim)があれば読み込む。読み込んだ後に
" 変数g:vimrc_local_finishに非0な値が設定されていた場合には、それ以上の設定
" ファイルの読込を中止する。
if 1 && filereadable($VIM . '/vimrc_local.vim')
  unlet! g:vimrc_local_finish
  source $VIM/vimrc_local.vim
  if exists('g:vimrc_local_finish') && g:vimrc_local_finish != 0
    finish
  endif
endif

"---------------------------------------------------------------------------
" ユーザ優先設定($HOME/.vimrc_first.vim)があれば読み込む。読み込んだ後に変数
" g:vimrc_first_finishに非0な値が設定されていた場合には、それ以上の設定ファ
" イルの読込を中止する。
if 1 && exists('$HOME') && filereadable($HOME . '/.vimrc_first.vim')
  unlet! g:vimrc_first_finish
  source $HOME/.vimrc_first.vim
  if exists('g:vimrc_first_finish') && g:vimrc_first_finish != 0
    finish
  endif
endif

" plugins下のディレクトリをruntimepathへ追加する。
for s:path in split(glob($VIM.'/plugins/*'), '\n')
  if s:path !~# '\~$' && isdirectory(s:path)
    let &runtimepath = &runtimepath.','.s:path
  end
endfor
unlet! s:path

"---------------------------------------------------------------------------
" 日本語対応のための設定:
"
" ファイルを読込むにトライする文字エンコードの順序を確定する。漢字コード自
" 動判別機能を利用する場合には別途iconv.dllが必要。iconv.dllについては
" README_w32j.txtを参照。ユーティリティスクリプトを読み込むことで設定される。
"source $VIM/plugins/kaoriya/encode_japan.vim

" メッセージを日本語にする (Windowsでは自動的に判断・設定されている)
set encoding=utf-8
set fileencodings=utf-8
"set fileencodings=utf-8,iso-2022-jp,cp932,sjis,euc-jp
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
  set encoding=utf-8
  set ambiwidth=double
  if exists('$LANG') && $LANG ==# 'ja_JP.UTF-8'
    set langmenu=ja_ja.utf-8.macvim
  endif
endif
" 日本語入力用のkeymapの設定例 (コメントアウト)
if has('keymap')
  " ローマ字仮名のkeymap
  "silent! set keymap=japanese
  "インサートモード、検索モード時のIMEの初期値 0:off 1:on
  set iminsert=0 imsearch=0
endif
" 非GUI日本語コンソールを使っている場合の設定
if !has('gui_running') && &encoding != 'cp932' && &term == 'win32'
  set termencoding=cp932
endif

"---------------------------------------------------------------------------
" メニューファイルが存在しない場合は予め'guioptions'を調整しておく
if 1 && !filereadable($VIMRUNTIME . '/menu.vim') && has('gui_running')
  set guioptions+=M
endif

"---------------------------------------------------------------------------
" Bram氏の提供する設定例をインクルード (別ファイル:vimrc_example.vim)。これ
" 以前にg:no_vimrc_exampleに非0な値を設定しておけばインクルードはしない。
if 1 && (!exists('g:no_vimrc_example') || g:no_vimrc_example == 0)
  if &guioptions !~# "M"
    " vimrc_example.vimを読み込む時はguioptionsにMフラグをつけて、syntax on
    " やfiletype plugin onが引き起こすmenu.vimの読み込みを避ける。こうしない
    " とencに対応するメニューファイルが読み込まれてしまい、これの後で読み込
    " まれる.vimrcでencが設定された場合にその設定が反映されずメニューが文字
    " 化けてしまう。
    set guioptions+=M
    source $VIMRUNTIME/vimrc_example.vim
    set guioptions-=M
  else
    source $VIMRUNTIME/vimrc_example.vim
  endif
endif

"---------------------------------------------------------------------------
" 検索の挙動に関する設定:
"
" 検索時に大文字小文字を無視 (noignorecase:無視しない)
set ignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase
"===========================================================================
"閉括弧が入力された時、対応する括弧を強調する
set showmatch

"インクリメンタルサーチを行う
set incsearch

" 文脈によって解釈が異なる全角文字の幅を、2に固定する
set ambiwidth=double

" vimが自動で生成する（読み込み時など）tab幅をスペース2つ文にする
set shiftwidth=2

" 改行時などに、自動でインデントを設定してくれる
set smartindent

" 可視化した空白文字の表示形式について。
"if has('unix') || has('mac')
"  set listchars=tab:»\ ,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
"endif

"全角スペースをハイライト表示
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction
   
if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif

" "0"で始まる数値を、8進数として扱わないようにする
set nrformats-=octal

" ファイルの保存をしていなくても、べつのファイルを開けるようにする
set hidden

set history=50

" 文字のないところにカーソル移動できるようにする
" set virtualedit=block

"新しい行を作った時に高度な自動インデントを行う
set smarttab

" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

" 行を強調表示
set cursorline

" 列を強調表示
set cursorcolumn

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
"===========================================================================
"---------------------------------------------------------------------------
" 編集に関する設定:
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
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM

"---------------------------------------------------------------------------
" GUI固有ではない画面表示の設定:
"
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

"---------------------------------------------------------------------------
" ファイル操作に関する設定:
"
" バックアップファイルを作成しない (次行の先頭の " を削除すれば有効になる)
set nobackup
" swapファイルを作成しない
set noswapfile
" undoファイルを作成しない
set noundofile

"---------------------------------------------------------------------------
" ファイル名に大文字小文字の区別がないシステム用の設定:
"   (例: DOS/Windows/MacOS)
"
if filereadable($VIM . '/vimrc') && filereadable($VIM . '/ViMrC')
  " tagsファイルの重複防止
  set tags=./tags,tags
endif

"---------------------------------------------------------------------------
" コンソールでのカラー表示のための設定(暫定的にUNIX専用)
if has('unix') && !has('gui_running')
  let s:uname = system('uname')
  if s:uname =~? "linux"
    set term=builtin_linux
  elseif s:uname =~? "freebsd"
    set term=builtin_cons25
  elseif s:uname =~? "Darwin"
    set term=beos-ansi
  else
    set term=builtin_xterm
  endif
  unlet s:uname
endif

"---------------------------------------------------------------------------
" コンソール版で環境変数$DISPLAYが設定されていると起動が遅くなる件へ対応
if !has('gui_running') && has('xterm_clipboard')
  set clipboard=exclude:cons\\\|linux\\\|cygwin\\\|rxvt\\\|screen
endif

"---------------------------------------------------------------------------
" プラットホーム依存の特別な設定

" WinではPATHに$VIMが含まれていないときにexeを見つけ出せないので修正
if has('win32') && $PATH !~? '\(^\|;\)' . escape($VIM, '\\') . '\(;\|$\)'
  if !exists("g:restarted")
    let $PATH = $VIM . ';' . $PATH
  endif
endif

if has('mac')
  " Macではデフォルトの'iskeyword'がcp932に対応しきれていないので修正
  set iskeyword=@,48-57,_,128-167,224-235
endif

"---------------------------------------------------------------------------
" KaoriYaでバンドルしているプラグインのための設定

" autofmt: 日本語文章のフォーマット(折り返し)プラグイン.
set formatexpr=autofmt#japanese#formatexpr()

" vimdoc-ja: 日本語ヘルプを無効化する.
if kaoriya#switch#enabled('disable-vimdoc-ja')
  let &rtp = join(filter(split(&rtp, ','), 'v:val !~ "[/\\\\]plugins[/\\\\]vimdoc-ja"'), ',')
endif

" vimproc: 同梱のvimprocを無効化する
" if kaoriya#switch#enabled('disable-vimproc')
"   let &rtp = join(filter(split(&rtp, ','), 'v:val !~ "[/\\\\]plugins[/\\\\]vimproc$"'), ',')
" endif

" Copyright (C) 2009-2013 KaoriYa/MURAOKA Taro

"---------------------------
" Start Neobundle Settings.
"---------------------------
" bundleで管理するディレクトリを指定
set runtimepath+=$VIM/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('$VIM/bundle/'))

" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'

" 今後このあたりに追加のプラグインをどんどん書いて行きます！！"

" NERDTreeを設定
" NeoBundle 'scrooloose/nerdtree'

" ファイラ
NeoBundle 'Shougo/vimfiler'
" === カラースキーマ ===

" mycolor
NeoBundle 'rytkmt/rytkmt_vim_settings'
" " solarized
"   NeoBundle 'altercation/vim-colors-solarized'
" " mustang
"   NeoBundle 'croaker/mustang-vim'
" " wombat
"   NeoBundle 'jeffreyiacono/vim-colors-wombat'
" " jellybeans
"   NeoBundle 'nanotech/jellybeans.vim'
" " lucius
"   NeoBundle 'vim-scripts/Lucius'
" " zenburn
"   NeoBundle 'vim-scripts/Zenburn'
" " mrkn256
"   NeoBundle 'mrkn/mrkn256.vim'
" " railscasts
"   NeoBundle 'jpo/vim-railscasts-theme'
" " pyte
"   NeoBundle 'therubymug/vim-pyte'
" " molokai
"   NeoBundle 'tomasr/molokai'
" " dracula
"   NeoBundle 'dracula/vim'
" " moriarty
"   NeoBundle 'aliou/moriarty.vim'
" " wwdc16
"   NeoBundle 'lifepillar/vim-wwdc16-theme'
" " leerkan
"   NeoBundle 'visi-pivi-sivi/leerkan-vim-colors'
" " wombat-256mod
"   NeoBundle 'michalbachowski/vim-wombat256mod'
" " ego
"   NeoBundle 'geetarista/ego.vim'
" " buddy
"   NeoBundle 'DrSpatula/vim-buddy'
" " tropikos
"   NeoBundle 'blackgate/tropikos-vim-theme'
" " penultimate
"   NeoBundle 'ivan-cukic/vim-colors-penultimate'
" " desertink
"   NeoBundle 'toupeira/vim-desertink'
" " wattslandia
"   NeoBundle 'thewatts/wattslandia'
" " znake
"   NeoBundle 'znake/znake-vim'
" " nerv-ous
"   NeoBundle 'vim-scripts/NERV-ous'
" " radicalgoodspeed
"   NeoBundle 'svjunic/RadicalGoodSpeed.vim'
" " rdark
"   NeoBundle 'vim-scripts/rdark'
" " lumberjack
"   NeoBundle 'yamafaktory/lumberjack.vim'
" " flattown
"   NeoBundle 'blerins/flattown'
" " lizard
"   NeoBundle 'gilsondev/lizard'
" " monokai
"   NeoBundle 'lsdr/monokai'
" " darkspectrum
"   NeoBundle 'vim-scripts/darkspectrum'
" " badwolf
"   NeoBundle 'sjl/badwolf'

" =====================

NeoBundle 'Shougo/unite.vim'

" Unite の file_mruを使用するため
NeoBundle 'Shougo/neomru.vim'

" Unite の history/yankを使用するため
NeoBundle 'Shougo/neoyank.vim'

" カラースキーム一覧表示に Unite.vim を使う
NeoBundle 'ujihisa/unite-colorscheme'

" HTMLを簡単作成 生成したい任意を入力後<C-y>
NeoBundle 'mattn/emmet-vim'

" ステータスラインをカッコよく
NeoBundle 'itchyny/lightline.vim'

"閉じカッコなどの入力補完
NeoBundle 'cohama/lexima.vim'

"railsプロジェクト内での移動
NeoBundle 'tpope/vim-rails'

" ビジュアルモードの拡張
NeoBundle 'terryma/vim-expand-region'

"ruby用の％移動
NeoBundle 'vim-scripts/ruby-matchit'

" ========== textobject S ==========

" textobj のベース
NeoBundle "kana/vim-textobj-user"

" snake_case 上の word
" a,w, i,w
NeoBundle "h1mesuke/textobj-wiw"

" 関数内
" af, if
NeoBundle "kana/vim-textobj-function"

" カーソル行
" al, il
NeoBundle "kana/vim-textobj-line"
" ========== textobject E ==========
"grepの拡張
NeoBundle 'vim-scripts/grep.vim'

"インデントを見やすく
NeoBundle 'Yggdroot/indentLine'

" コメントON/OFFを手軽に実行
NeoBundle 'tomtom/tcomment_vim'

" ログファイルを色づけしてくれる
NeoBundle 'vim-scripts/AnsiEsc.vim'

" 行末の半角スペースを可視化
NeoBundle 'bronson/vim-trailing-whitespace'

" mapのサブモード
NeoBundle 'kana/vim-submode'

" 置換のプレビュー
NeoBundle 'osyo-manga/vim-over'

" yankの履歴の前後
NeoBundle 'LeafCage/yankround.vim'
" 設定はhttp://qiita.com/akase244/items/ce5e2e18ad5883e98a77を参照
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw 64',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
NeoBundle 'Shougo/vimshell.vim'

"tagsの更新
" NeoBundle 'soramugi/auto-ctags.vim'

"プロジェクトのrootに移動
NeoBundle 'airblade/vim-rooter'

"sessionに保存し現在の状態のまま再起動
NeoBundle 'tyru/restart.vim'

"ruby true:false などの入れ替え
NeoBundle 'AndrewRadev/switch.vim'

"コマンド出力をバッファにキャプチャ :Capture {command}
NeoBundle 'tyru/capture.vim'

"囲み文字の変更
NeoBundle 'tpope/vim-surround'

call neobundle#end()

" Required:
filetype plugin indent on

" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
NeoBundleCheck

"-------------------------
" End Neobundle Settings.
"-------------------------

" "NERDTreeのブックマーを表示
" let g:NERDTreeShowBookmarks=1

" "NERDTreeを起動
" autocmd vimenter * NERDTree



"submodeを抜け出すときのコマンドを有効に
let g:submode_keep_leaving_key=1
let g:submode_timeout=0

"ヤンクした値がdやxで消えないように（復活させる）
noremap PP "0p

"検索のハイライトを消す
noremap <ESC><ESC> :<C-u>noh<CR>

" 表示行単位で上下移動するように
" nnoremap j gj
" nnoremap k gk
" nnoremap <Down> gj
" nnoremap <Up>   gk

" 逆に普通の行単位で移動したい時のために逆の map も設定しておく
nnoremap gj j
nnoremap gk k

" カーソル移動
inoremap <C-a> <Esc>^i
inoremap <C-e> <Esc>$a
inoremap <C-j> <Esc>ji
inoremap <C-k> <Esc>ki
noremap <S-h>   ^
noremap <S-j>   gjgjgjgj
noremap <C-j>   }
noremap <S-k>   gkgkgkgk
noremap <C-k>   {
noremap <S-l>   $
noremap m %

"メタ文字扱いのオプションをvery magicを初期値に
nnoremap / /\v
nnoremap ? ?\v
" キーマップ用
let mapleader = "\<Space>"
map <Space> <Nop>

" コピペ
nmap <Leader>c "*yy
nmap <Leader>v "*p

" カラースキーマテスト
nmap <Leader>z [test]
nnoremap [test]h :so $VIMRUNTIME/syntax/hitest.vim
" ========== タブ操作 S ==========
nmap <Leader>t [tab]
" タブを閉じる
nnoremap [tab]q :<C-u>tabc<CR>
call submode#enter_with('tab_close', 'n', '', '<Leader>tq', ':<C-u>tabc<CR>')
call submode#map('tab_close', 'n', '', 'q', ':<C-u>tabc<CR>')
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
" タブ移動サブモード
call submode#enter_with('tab_move', 'n', '', '<Leader>th', 'gT')
call submode#enter_with('tab_move', 'n', '', '<Leader>tl', 'gt')
call submode#enter_with('tab_move', 'n', '', '<Leader>tH', ':<C-u>tabr<CR>')
call submode#enter_with('tab_move', 'n', '', '<Leader>tL', ':<C-u>tabl<CR>')
call submode#map('tab_move', 'n', '', 'h', 'gT')
call submode#map('tab_move', 'n', '', 'H', ':<C-u>tabr<CR>')
call submode#map('tab_move', 'n', '', 'l', 'gt')
call submode#map('tab_move', 'n', '', 'L', ':<C-u>tabl<CR>')
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

" ========== タブ操作 E ==========

" ========= ウィンドウ操作 S =========
nmap <Leader>w [window]

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
call submode#enter_with('window_move', 'n', '', '<Leader>wh', '<C-w>h')
call submode#enter_with('window_move', 'n', '', '<Leader>wl', '<C-w>l')
call submode#map('window_move', 'n', '', 'h', '<C-w>h')
call submode#map('window_move', 'n', '', 'l', '<C-w>l')
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
call submode#enter_with('window_size', 'n', '', '<Leader>wd', '10<C-w>-')
call submode#enter_with('window_size', 'n', '', '<Leader>wu', '10<C-w>+')
call submode#enter_with('window_size', 'n', '', '<Leader>wU', '<C-w>_')
call submode#enter_with('window_size', 'n', '', '<Leader>w.', '12<C-w>>')
call submode#enter_with('window_size', 'n', '', '<Leader>w,', '12<C-w><')
call submode#enter_with('window_size', 'n', '', '<Leader>wm,', '<C-w><Bar>')
call submode#enter_with('window_size', 'n', '', '<Leader>w=,', '<C-w>=')
call submode#map('window_size', 'n', '', 'd', '10<C-w>-')
call submode#map('window_size', 'n', '', 'u', '10<C-w>+')
call submode#map('window_size', 'n', '', '.', '12<C-w>>')
call submode#map('window_size', 'n', '', ',', '12<C-w><')
call submode#map('window_size', 'n', '', 'm', '<C-w><Bar>')
call submode#map('window_size', 'n', '', '=', '<C-w>=')
" ========= ウィンドウ操作 E =========

"ヤンク文字で検索
cmap <S-Space> <C-r>"
"挿入モード終了
imap <C-Space> <ESC>
vmap <nowait> <C-Space> <ESC>
" ========== NeoBundle S ==========
let g:neobundle#log_filename = $VIM . '/neobundle.log'
" ========== NeoBundle E ==========
" ========== Unite S ==========
nnoremap [unite] <Nop>
nmap <Leader>u [unite]

" let g:unite_source_history_yank_enable =1
"最近開いたファイル履歴の保存数
let g:unite_source_file_mru_limit = 50

"nnoremap <silent> [unite]f :<C-u>Unite<Space>file<CR>
" nnoremap <silent> [unite]g :<C-u>Unite<Space>grep<CR>
nnoremap <silent> [unite]b :<C-u>Unite<Space>buffer<CR>
" nnoremap <silent> [unite]b :<C-u>Unite<Space>bookmark<CR>
call unite#custom_default_action('source/bookmark/directory' , 'lcd')
"nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
" nnoremap <silent> [unite]y :<C-u>Unite<Space>history/yank<CR>
"nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
"nnoremap <silent> [unite]c :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" nnoremap <silent> [unite]r :UniteResume search-buffer<CR>
" nnoremap <silent> [unite]f :<C-u>Unite<Space>file/new<CR>
" nnoremap <silent> [unite]d :<C-u>Unite<Space>directory/new<CR>
"uniteを開いている間のキーマッピング
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  "ESCでuniteを終了
  nmap <buffer> <ESC> <Plug>(unite_exit)
  "ctrl+jで縦に分割して開く
  nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  "ctrl+jで横に分割して開く
  nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  "ctrl+oでその場所に開く
  nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
  inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
endfunction


" ========== Unite E ==========
" ========== VimFiler S ==========
  let g:vimfiler_tab_idx = 1
  function! _VimFilerOpen()
  if !exists("t:tab_name")
    let t:tab_name = g:vimfiler_tab_idx
    let g:vimfiler_tab_idx = g:vimfiler_tab_idx + 1
  endif

  let s:vimfiler_default_dir = ''
  if has('win32')
    let s:vimfiler_default_dir = 'C:/Users/r_tsukamoto.ILL/workspace'
  else
    let s:vimfiler_default_dir = '/Applications/MacVim.app/Contents/Resources/vim/bundle/rytkmt_vim_settings'
  endif
  exe ":VimFilerExplorer -buffer-name=" . t:tab_name . " " . s:vimfiler_default_dir
endfunction
" VimFilerを起動
autocmd vimenter * call _VimFilerOpen()

let g:vimfiler_no_default_key_mappings = 1
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '*'
nmap <Leader>f :<C-u>call _VimFilerOpen()<CR>

augroup vimfiler
  autocmd!
  autocmd FileType vimfiler call s:vimfiler_settings()
augroup END

function! s:vimfiler_settings()
  " 移動
  nmap <buffer> j <Plug>(vimfiler_loop_cursor_down)
  nmap <buffer> k <Plug>(vimfiler_loop_cursor_up)
  nmap <buffer> l <Plug>(vimfiler_smart_l)
  nmap <buffer> h <Plug>(vimfiler_smart_h)
  nmap <buffer> o <Plug>(vimfiler_smart_l)
  nmap <buffer> O <Plug>(vimfiler_expand_tree_recursive)
  nmap <buffer> u <Plug>(vimfiler_switch_to_parent_directory)
  nmap <buffer> ~ <Plug>(vimfiler_switch_to_home_directory)
  nmap <buffer> \ <Plug>(vimfiler_switch_to_root_directory)
  nmap <buffer> & <Plug>(vimfiler_switch_to_project_directory)
  nmap <buffer> q <Plug>(vimfiler_hide)

  " 特殊
  " 隠しファイル表示・非表示
  nmap <buffer> . <Plug>(vimfiler_toggle_visible_ignore_files)
  " 外部のプログラムで実行
  nmap <buffer> X <Plug>(vimfiler_execute_system_associated)
  " エクスプローラーで開く
  nmap <buffer> E <Plug>(vimfiler_execute_external_filer)
  " シェルの起動
  nmap <buffer> H <Plug>(vimfiler_popup_shell)
  " 外部コマンドの実行
  nmap <buffer> ! <Plug>(vimfiler_execute_shell_command)
  " 追加アクション
  nmap <buffer> A <Plug>(vimfiler_choose_action)
  " ヘルプ
  nmap <buffer> ? <Plug>(vimfiler_help)
  " findコマンド
  nmap <buffer> F <Plug>(vimfiler_find)
  " cd
  nmap <buffer> cd <Plug>(vimfiler_cd_vim_current_dir)
  " safeモード切り替え
  nmap <buffer> gs <Plug>(vimfiler_toggle_safe_mode)
  nmap <buffer> gS <Plug>(vimfiler_toggle_simple_mode)
  nnoremap <silent><buffer> b :<C-u>Unite<Space>bookmark<CR>

  " マーク
  nmap <buffer> <S-Space> <Plug>(vimfiler_toggle_mark_current_line)
  vmap <buffer> <Space> <Plug>(vimfiler_toggle_mark_selected_lines)
  nmap <buffer> * <Plug>(vimfiler_toggle_mark_all_lines)
  nmap <buffer> C <Plug>(vimfiler_clear_mark_all_lines)

  " ファイル編集
  nmap <buffer> mc <Plug>(vimfiler_copy_file)
  nmap <buffer> mm <Plug>(vimfiler_move_file)
  nmap <buffer> md <Plug>(vimfiler_delete_file)
  nmap <buffer> mr <Plug>(vimfiler_rename_file)

  " ファイル作成
  nmap <buffer> ad <Plug>(vimfiler_make_directory)
  nmap <buffer> af <Plug>(vimfiler_new_file)

  " ファイルクリップ
  nmap <buffer> cc <Plug>(vimfiler_clipboard_copy_file)
  nmap <buffer> cm <Plug>(vimfiler_clipboard_move_file)
  nmap <buffer> cp <Plug>(vimfiler_clipboard_paste)
  nmap <buffer> yy <Plug>(vimfiler_yank_full_path)


  " オープンは，<CR>(enter キー)
  nmap <buffer><expr> <CR> vimfiler#smart_cursor_map(
          \ "\<Plug>(vimfiler_cd_file)",
          \ "\<Plug>(vimfiler_open_file_in_another_vimfiler)")

  " マークは，<S-Space>
  nmap <silent><buffer> <S-Space> <Plug>(vimfiler_toggle_mark_current_line)
  vmap <silent><buffer> <S-Space> <Plug>(vimfiler_toggle_mark_selected_lines)

  " ウィンドウを分割して開く
  nmap <silent><buffer><expr> s vimfiler#do_switch_action('split')
  nmap <silent><buffer><expr> v vimfiler#do_switch_action('vsplit')

  " 閉じる，<Esc> 2 回叩き
  nmap <buffer> <Esc><Esc> <Plug>(vimfiler_exit)
endfunction
"ゴミ箱の使用
let g:unite_kind_file_use_trashbox = 1
" ========== VimFiler E ==========
" ========== vimproc S ==========
set updatetime=100


augroup vimproc-async-receive-test
augroup END


" コマンド終了時に呼ばれる関数
function! s:receive_vimproc_result(callback, ...)
    if !has_key(s:, "vimproc")
        return
    endif
    let vimproc = s:vimproc
    try
        if !vimproc.stdout.eof
            let s:result .= vimproc.stdout.read()
        endif
        if !vimproc.stderr.eof
            let s:result .= vimproc.stderr.read()
        endif
        if !(vimproc.stdout.eof && vimproc.stderr.eof)
            return 0
        endif
    catch
        echom v:throwpoint
    endtry

    let a:arg_str = ''
    let a:args = []
    call add(a:args, 's:result')
    if len(a:000) > 0
      for var in a:000
        call add(a:args, var)
      endfor
    endif
    let a:arg_str = "(" . join(a:args, ', "') . '")'
    " 終了時に呼ぶ
    exe "call " . a:callback . a:arg_str
    
    augroup vimproc-async-receive-test
        autocmd!
    augroup END

    call vimproc.stdout.close()
    call vimproc.stderr.close()
    call vimproc.waitpid()
    unlet s:vimproc
    unlet s:result
endfunction

function! s:system_async(cmd, callback, ...)
    let cmd = a:cmd
    echom "----async----"
    echom cmd
    let vimproc = vimproc#pgroup_open(cmd)
    call vimproc.stdin.close()
    
    let s:vimproc = vimproc
    let s:result = ""
 
    let a:arg_str = ''
    let a:args = []
    call add(a:args, a:callback)
    if len(a:000) > 0
      for var in a:000
        call add(a:args, var)
      endfor
    endif
    let a:arg_str = join(a:args, '", "')
echom "---arg_str---"
echom a:arg_str
    augroup vimproc-async-receive-test
        execute "autocmd! CursorHold,CursorHoldI * call"
\               "s:receive_vimproc_result(\"" . a:arg_str . "\")"
    augroup END
endfunction

" function Test()
"   call s:system_async('pwd', 'Test2', '/Applications/MacVim.app/Contents')
" endfunction
"
" function Test2(result, dir)
"   echom a:result
"   echom a:dir
" endfunction
" ========== vimproc E ==========
" ========== restart S ==========
" 終了時に保存するセッションオプションを設定する
" :Restart 時に変数の定義を行う
command!
	\   -bar
	\   RestartWithSession
	\   | let g:restart_sessionoptions = 'blank,curdir,folds,help,localoptions,tabpages'
	\   | VimFilerClose explorer
	\   | Restart --cmd "let g:restarted = 1"
nnoremap res :<C-u>RestartWithSession<CR>
" ========== restart E ==========
" ========== yankround S ==========
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
nnoremap <silent> [unite]y :<C-u>Unite<Space>yankround<CR>
"yankのペーストにハイライトを使用するか
let g:yankround_use_region_hl = 1
autocmd ColorScheme * highlight YankRoundRegion gui=underline guifg=White guibg=Black
" ========== yankround E ==========
" ========== grep.vim S ============
nnoremap [grep] <Nop>
nmap <Leader>g [grep]
nnoremap [grep]r :<C-u>Rgrep<CR>
nnoremap [grep]e :<C-u>Regrep<CR>
if has("win32")
  " Windows環境用のコード
  let Grep_Path = 'C:\git_bin\grep.exe'
  let Fgrep_Path = 'C:\git_bin\grep.exe -F'
  let Egrep_Path = 'C:\git_bin\grep.exe -E'
  let Grep_Find_Path = 'C:\git_bin\find.exe'
  let Grep_Xargs_Path = 'C:\git_bin\xargs.exe'
  let Grep_Shell_Quote_Char = '"'
  let Grep_Skip_Dirs = '.svn'
  let Grep_Default_Options = '-I -G'
  let Grep_Skip_Files = '*.bak *~ *.log'
endif
  " ========== grep.vim E ============
" ============ indentLine S ============
let g:indentLine_color_gui = '#303640'
let g:indentLine_char = '¦' "use ¦, ┆ or │
" ============ indentLine E ============
" ============ vim-over S ============
nnoremap <Leader>r :<C-u>OverCommandLine<CR>%s/\v
" ============ vim-over E ============
" ============vim-expand-region S ============
let g:expand_region_text_objects = {
      \ 'i,w'  :0,
      \ 'a,w'  :0,
      \ 'iw'  :0,
      \ 'i['  :0,
      \ 'i"'  :0,
      \ 'i'''  :0,
      \ 'i('  :0,
      \ 'i<'  :0,
      \ 'i{'  :0,
      \ 'a['  :0,
      \ 'a"'  :0,
      \ 'a'''  :0,
      \ 'a('  :0,
      \ 'a<'  :0,
      \ 'a{'  :0,
      \ 'iW'  :0,
      \ 'if'  :0,
      \ 'il'  :0,
      \ }
vmap <silent> v <Plug>(expand_region_expand)
map <silent> c <Plug>(expand_region_shrink)
" ============vim-expand-region E ============
" ========== NERDTree S ==========
"作業スペース
" if has("win32")
"   cd C:\Users\r_tsukamoto.ILL\workspace
" endif

" nnoremap [nerdtree] <Nop>
" nmap <Leader>n [nerdtree]
" nnoremap [nerdtree]n :<C-u>NERDTree<CR>
"
" autocmd FileType nerdtree call s:nerdtree_settings()
" function! s:nerdtree_settings()
"   nnoremap [nerdtree]b :<C-u>Bookmark<Space>
"   nnoremap [nerdtree]r :<C-u>BookmarkToRoot<Space>
"   nnoremap [nerdtree]o :<C-u>OpenBookmark<Space>
"   nnoremap [nerdtree]c :<C-u>ClearBookmarks<Space>
" endfunction
" ========== NERDTree E ==========


" ========== vim-trailing-whitespace S ===========
autocmd VimEnter,ColorScheme,BufWinEnter * :hi ExtraWhiteSpace guibg=#990000
" ========== vim-trailing-whitespace E ===========

" ========== vim-rooter S ===========
let g:rooter_manual_only = 1 "FindRootDirectory()
let g:rooter_patterns = ['Rakefile', '.svn/', '.git/']
" ========== vim-rooter E ===========

" ========== switch S ==========
let g:switch_mapping = "-"
" string に記号が含まれている場合は
" string → 'string'
" の変換はうまくいかないかも
" ========== switch E ===========
" function SetGemsTags(update)
"
"   if has('win32')
"     let s:gempaths = []
"     let s:gempath_tmp = split(system('gem environment gempath'), ';')[1]
"     let s:gempath_tmp = strpart(s:gempath_tmp, 0, strlen(s:gempath_tmp) - 1)
"     call add(s:gempaths, s:gempath_tmp)
"   else
"     let s:gempath_str = split(system('! gem environment gempath'), '\r')[0]
"     let s:gempaths = split(s:gempath_str, ':')
"   endif
"
"   let g:gem_tags = []
"   for gem_path in s:gempaths
"     let s:gem_root = gem_path . '/gems'
"     if(isdirectory(s:gem_root))
"       exe "cd " . s:gem_root
"       if !filereadable(s:gem_root . '/tags')
"         call s:system_async ":silent Ctags"
"       endif
"
"       call add(g:gem_tags, s:gem_root . '/tags')
"     endif
"   endfor
" endfunction
"
function CheckTags(do_update)
  let s:root_temp = FindRootDirectory()
  let s:tags_change = 0
"
  "Rakefileの存在でrailsプロジェクトか判断
  if filereadable(s:root_temp .'/Rakefile')
    "gemsのtagの更新
    if !exists('g:gem_tags')
      call SetGemTags(a:do_update)
      let s:tags_change = 1
    endif

    "projectが変わったときだけタグのセットをする
    if exists('g:project_root') && s:root_temp == g:project_root && a:do_update == 0
    else
      let g:project_root = s:root_temp
      let a:project_tag_path = s:root_temp . '/tags'
      if filereadable(a:project_tag_path) && a:do_update == 1
        " if has('win32')
        "   call system("DEL " . a:project_tag_path)
        " else
        "   call system("rm " . a:project_tag_path)
        " endif
      endif

      "tagsがあればセット
      if filereadable(a:project_tag_path)
        let g:project_tag = a:project_tag_path
      "tagsがなければ作成
      else
        " if has('win32')
        "   echom 'up'
        "   call s:system_async("CD " . s:root_temp . " && ctags -R", "SetProjectTag", a:project_tag_path)
        " else
        "   call s:system_async("cd " . s:root_temp . " | ctags -R", "SetProjectTag", a:project_tag_path)
        " endif
        " " SetProjectTagで更新されるためクリア
        " let s:tags_change = 0
      endif
    endif

    if exists('s:tags_change') && s:tags_change > 0
      call SetTags()
    endif
  endif
endfunction

function SetProjectTags(result, tag_path)
  echom a:result

  let g:project_tag = a:tag_path
  call SetTags()
endfunction

function SetTags()
  let s:tags = []
  if exists('g:gem_tags')
    let s:tags = s:tags + g:gem_tags
  endif
  if exists('g:project_tag')
    call add(s:tags, g:project_tag)
  endif

  if !(s:tags == [])
    let $CTAGS_STR = join(s:tags, ',')
    set tags=$CTAGS_STR
    silent !unlet '$CTAGS_STR'
  endif
endfunction
"
" function UpdateTags()
"   let s:root_temp = FindRootDirectory()
"
"   "Rakefileの存在でrailsプロジェクトか判断
"   if filereadable(s:root_temp .'/Rakefile')
"     "gemsのtagの更新
"     if !exists('g:gem_tags')
"       call SetGemsTags()
"     endif
"
"     "projectが変わったときだけタグのセットをする
"     let g:project_root = s:root_temp
"     exe "cd " .g:project_root
"     exe ":silent Ctags"
"
"     let s:tags = copy(g:gem_tags)
"     call add(s:tags, g:project_root . '/tags')
"     let $CTAGS_STR = join(s:tags, ',')
"     set tags=$CTAGS_STR
"     silent !unlet '$CTAGS_STR'
"   endif
"
" endfunction

function! SetGemTags(do_update)
  " 更新 ではなく、かつ既にgem用のtag配列が存在すれば処理しない
  if(a:do_update == 0 && exists("g:gem_tags"))
    return
  endif

  " 既にgem用タグの更新中であれば処理しない
  if(exists("g:gem_update_target_count") && g:gem_update_target_count > 0)
    return
  endif

  let a:gempaths = []
  if has('win32')
    let a:gempaths = split(system('gem environment gempath'), ';')
  else
    " 配列で返るため明示的に0指定(要素は1つのため問題なし)
    let a:gempaths = split(split(system('! gem environment gempath'), '\r')[0], ':')
  endif

  let g:gem_tags = []
  let g:gem_update_target_count = 0
  for gem_path in a:gempaths
    let a:gem_root = substitute(gem_path, '\n', '', 'g') . '/gems'
    let a:gem_tag_path = a:gem_root . '/tags'
    if(isdirectory(a:gem_root))
      if filereadable(a:gem_tag_path) && a:do_update == 1
        " if has('win32')
        "   call system("DEL " . a:gem_tag_path)
        " else
        "   call system("rm " . a:gem_tag_path)
        " endif
      endif
      if filereadable(a:gem_tag_path)
        call add(g:gem_tags, a:gem_tag_path)
      else
        " let g:gem_update_target_count = g:gem_update_target_count + 1
        " if has('win32')
        "   echom 'down'
        "   call s:system_async("CD " . a:gem_root . " && ctags -R", "AddGemTags", a:gem_tag_path)
        " else
        "   call s:system_async("cd " . a:gem_root . " | ctags -R", "AddGemTags", a:gem_tag_path)
        " endif
      endif
    endif
  endfor
endfunction

function! AddGemTags(result, tag_path)
  echom a:result
  call add(g:gem_tags, a:tag_path)
  let g:gem_update_target_count = g:gem_update_target_count - 1
endfunction







autocmd BufEnter * call CheckTags(0)

nnoremap [ctag] <Nop>
nmap <Leader>j [ctag]
" nnoremap [ctag]u :<C-u>call UpdateTags()<CR>
nnoremap [ctag]j <C-]>
nnoremap [ctag]k <C-t>
nnoremap [ctag]l :<C-u>tselect<CR>
nnoremap [ctag]; :<C-u>tags<CR>
