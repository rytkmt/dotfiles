scriptencoding utf-8
" 日本語版のデフォルト設定ファイル(vimrc) - Vim7用試作
"
" Last Change: 08-Jul-2017.
" Maintainer:  Ryo Tsukamoto <r12tkmt@gmail.com>
"
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
  " set iminsert=0 imsearch=0
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
" ++ }}}
" ++ KaoriYaでバンドルしているプラグインのための設定 {{{

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
" ++ }}}
" + }}}
" + vim standard settings {{{
" ++ 検索の挙動に関する設定:{{{
" 検索時に大文字小文字を無視 (noignorecase:無視しない)
set ignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase
"インクリメンタルサーチを行う
set incsearch
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
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM
" ++ }}}
" ++ GUI固有ではない画面表示の設定: {{{
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
"閉括弧が入力された時、対応する括弧を強調する
set showmatch
" 文脈によって解釈が異なる全角文字の幅を、2に固定する
set ambiwidth=double
" vimが自動で生成する（読み込み時など）tab幅をスペース2つ文にする
set shiftwidth=2
" 改行時などに、自動でインデントを設定してくれる
set smartindent
"vim設定をグループ化して閉じる
autocmd FileType vim setlocal foldmethod=marker
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
" ++ }}}
" + }}}
" + Start Neobundle Settings. {{{
if(!(isdirectory($VIM . '/bundle')))
  exe ':! mkdir $VIM/bundle'
endif

if(isdirectory($VIM . '/bundle') && !(isdirectory($VIM . '/bundle/neobundle.vim')))
  exe ':! git clone https://github.com/Shougo/neobundle.vim.git ' . $VIM . '/bundle/neobundle.vim'
endif

" bundleで管理するディレクトリを指定
set runtimepath+=$VIM/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand($VIM . '/bundle/'))

" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'

" ファイラ
NeoBundle 'Shougo/vimfiler'
" ++ カラースキーマ {{{
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
" }}}

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
" NeoBundle 'cohama/lexima.vim'
"railsプロジェクト内での移動
NeoBundle 'tpope/vim-rails'
" ビジュアルモードの拡張
NeoBundle 'terryma/vim-expand-region'
"ruby用の％移動
" NeoBundle 'vim-scripts/ruby-matchit'
" bug-fixのpull requestがあったので下記を読み込み
NeoBundle 'stevemadere/ruby-matchit'
"%移動の対応するもののハイライト
NeoBundle 'vimtaku/hl_matchit.vim'
" ++ textobject {{{
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
" }}}
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
"ruby true:false などの入れ替え
NeoBundle 'AndrewRadev/switch.vim'
"コマンド出力をバッファにキャプチャ :Capture {command}
NeoBundle 'tyru/capture.vim'
"囲み文字の変更
NeoBundle 'tpope/vim-surround'
"入力補完
NeoBundle 'Shougo/neocomplete.vim'
"()、{}、if endの補完
NeoBundle "kana/vim-smartinput"
NeoBundle "cohama/vim-smartinput-endwise"
"閉じタグの補完
NeoBundle "alvan/vim-closetag"
"色表示
NeoBundle "gko/vim-coloresque"

"辞書
NeoBundle 'thinca/vim-ref'

"commandのエイリアス
NeoBundle 'tyru/vim-altercmd'

call neobundle#end()

" Required:
filetype plugin indent on

" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
NeoBundleCheck
" + }}}
" コマンド{{{
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
"挿入モード終了
imap <C-Space> <ESC>
vmap <nowait> <C-Space> <ESC>
" ++ }}}
" ++ その他 {{{
"ヤンクした値がdやxで消えないように（復活させる）
nnoremap PP "0p
vnoremap PP "0p

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
"検索のハイライトを消す
noremap <ESC><ESC> :<C-u>noh<CR>

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
noremap m %

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

nmap <Leader>z [test]
nmap <Leader>t [tab]
nmap <Leader>w [window]

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
"     _     _  _     _
"  q  W  e  R  T  y  U  i  o  p
"      _     _  _
"   a  S  d  F  G  h  j  k  l
"    _     _  _
"    Z  x  C  V  b  n  m
"
"=================================

nnoremap [test]h :so $VIMRUNTIME/syntax/hitest.vim
nnoremap [test]s :sp<CR>:VimShellBufferDir<CR>
nnoremap [test]r ::VimShellInteractive irb<CR>
nnoremap [test]v :<C-u>tabedit $MYVIMRC<CR>
if has('win32')
  let $MEMO = $HOME . '/workspace/sql.sql'
  nnoremap [test]q :<C-u>tabedit $MEMO<CR>
endif
if has('syntax')
  autocmd BufWinEnter * let w:m1 = matchadd("ZenkakuSpace", '　')
  autocmd WinEnter * let w:m1 = matchadd("ZenkakuSpace", '　')
endif
" ++ }}}
" +}}}
if neobundle#tap('vim-submode') "{{{
  "submodeを抜け出すときのコマンドを有効に
  let g:submode_keep_leaving_key=1
  let g:submode_timeout=0

  " タブ操作サブモード
  call submode#enter_with('tab_close', 'n', '', '<Leader>tq', ':<C-u>tabc<CR>')
  call submode#map('tab_close', 'n', '', 'q', ':<C-u>tabc<CR>')
  call submode#enter_with('tab_move', 'n', '', '<Leader>th', 'gT')
  call submode#enter_with('tab_move', 'n', '', '<Leader>tl', 'gt')
  call submode#enter_with('tab_move', 'n', '', '<Leader>tH', ':<C-u>tabr<CR>')
  call submode#enter_with('tab_move', 'n', '', '<Leader>tL', ':<C-u>tabl<CR>')
  call submode#map('tab_move', 'n', '', 'h', 'gT')
  call submode#map('tab_move', 'n', '', 'H', ':<C-u>tabr<CR>')
  call submode#map('tab_move', 'n', '', 'l', 'gt')
  call submode#map('tab_move', 'n', '', 'L', ':<C-u>tabl<CR>')

  " ウィンドウ操作サブモード
  call submode#enter_with('window', 'n', '', '<Leader>wh', '<C-w>h')
  call submode#enter_with('window', 'n', '', '<Leader>wl', '<C-w>l')
  call submode#map('window', 'n', '', 'h', '<C-w>h')
  call submode#map('window', 'n', '', 'l', '<C-w>l')
  call submode#enter_with('window', 'n', '', '<Leader>wd', '10<C-w>-')
  call submode#enter_with('window', 'n', '', '<Leader>wu', '10<C-w>+')
  call submode#enter_with('window', 'n', '', '<Leader>wU', '<C-w>_')
  call submode#enter_with('window', 'n', '', '<Leader>w.', '12<C-w>>')
  call submode#enter_with('window', 'n', '', '<Leader>w,', '12<C-w><')
  call submode#enter_with('window', 'n', '', '<Leader>w=,', '<C-w>=')
  call submode#map('window', 'n', '', 'd', '10<C-w>-')
  call submode#map('window', 'n', '', 'u', '10<C-w>+')
  call submode#map('window', 'n', '', 'm', '<C-w><Bar>')
  call submode#map('window', 'n', '', '.', '12<C-w>>')
  call submode#map('window', 'n', '', ',', '12<C-w><')
  call submode#map('window', 'n', '', '=', '<C-w>=')
  call neobundle#untap()
endif "}}}
if neobundle#tap('vim-smartinput-endwise') "{{{
  call smartinput_endwise#define_default_rules()
  call neobundle#untap()
endif "}}}
if neobundle#tap('vim-closetag') "{{{
  let g:closetag_filenames = "*.html,*.xhtml,*.phtml"
  call neobundle#untap()
endif "}}}
if neobundle#tap('neocomplete.vim') "{{{
  " 起動時に有効化
  let g:neocomplete#enable_at_startup = 1
  " 大文字が入力されるまで大文字小文字の区別を無視する
  let g:neocomplete#enable_smart_case = 1
  " _(アンダースコア)区切りの補完を有効化
  let g:neocomplete#enable_underbar_completion = 1
  let g:neocomplete#enable_camel_case_completion  =  1
  " ポップアップメニューで表示される候補の数
  let g:neocomplete#max_list = 20
  " シンタックスをキャッシュするときの最小文字長
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  " 補完を表示する最小文字数
  let g:neocomplete#auto_completion_start_length = 2
  " preview window を閉じない
  let g:neocomplete#enable_auto_close_preview = 0
  autocmd InsertLeave * silent! pclose!

  let g:neocomplete#max_keyword_width = 10000

  if !exists('g:neocomplete#delimiter_patterns')
      let g:neocomplete#delimiter_patterns= {}
    endif
    let g:neocomplete#delimiter_patterns.ruby = ['::']
  let s:neco_dicts_dir = $VIM . '/bundle/rytkmt_vim_settings/dicts'
  if isdirectory(s:neco_dicts_dir)
    let g:neocomplete#sources#dictionary#dictionaries = {
    \   'ruby': s:neco_dicts_dir . '/ruby.dict'
    \ }
  endif
  unlet s:neco_dicts_dir
  let g:neocomplete#data_directory = $HOME . '/.vim/cache/neocomplete'
  "候補の選択
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  " autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  " autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

  call neobundle#untap()
endif "}}}
if(neobundle#tap('unite.vim')) "{{{
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
  call neobundle#untap()
endif "}}}
if(neobundle#tap('vimfiler')) "{{{
  let g:vimfiler_tab_idx = 1
  let g:vimfiler_is_new = 0
  function! _VimFilerOpen(init, type)
    if !exists("t:tab_name")
      let t:tab_name = g:vimfiler_tab_idx
      let g:vimfiler_tab_idx = g:vimfiler_tab_idx + 1
      let g:vimfiler_is_new = 1
    endif

    let l:vimfiler_default_dir = ''

    if(a:type == 1 && (a:init || g:vimfiler_is_new))
      if has('win32')
        let l:vimfiler_default_dir = 'C:/Users/r_tsukamoto.ILL/workspace'
      else
        let l:vimfiler_default_dir = '/Users/Ryo/programs/vim/rytkmt_vim_settings'
      endif
    elseif(a:type == 2)
      let l:vimfiler_default_dir = expand("%:p:h")
    endif

    exe ":VimFilerExplorer -fnamewidth=200 -buffer-name=" . t:tab_name . " " . l:vimfiler_default_dir
  endfunction
  " VimFilerを起動
  autocmd vimenter * call _VimFilerOpen(1,1)

  let g:vimfiler_no_default_key_mappings = 1
  " let g:vimfiler_tree_leaf_icon = ' '
  " let g:vimfiler_tree_opened_icon = '▾'
  " let g:vimfiler_tree_closed_icon = '▸'
  " let g:vimfiler_file_icon = '-'
  let g:vimfiler_marked_file_icon = '*'
  nmap [filer]f :<C-u>call _VimFilerOpen(0,1)<CR>
  nmap [filer]d :<C-u>call _VimFilerOpen(1,1)<CR>
  nmap [filer]b :<C-u>call _VimFilerOpen(1,2)<CR>

  augroup vimfiler
    autocmd!
    autocmd FileType vimfiler call s:vimfiler_settings()
  augroup END

  function! s:vimfiler_settings()
    setlocal nonumber
    setlocal nocursorcolumn
    echom vimfiler#helper#_get_file_directory()
    " 移動
    nmap <buffer> j <Plug>(vimfiler_loop_cursor_down)
    nmap <buffer> k <Plug>(vimfiler_loop_cursor_up)
    nmap <buffer> l <Plug>(vimfiler_smart_l)
    " オープンは，<CR>(enter キー)
    nmap <buffer> <CR> <Plug>(vimfiler_smart_l)
    nmap <buffer><expr> L vimfiler#smart_cursor_map(
            \ "\<Plug>(vimfiler_cd_file)",
            \ "\<Plug>(vimfiler_open_file_in_another_vimfiler)")
    nmap <buffer> h <Plug>(vimfiler_smart_h)
    nmap <buffer> x <Plug>(vimfiler_smart_h)
    nmap <buffer> o <Plug>(vimfiler_smart_l)
    nmap <buffer> O <Plug>(vimfiler_expand_tree_recursive)
    nmap <buffer> u <Plug>(vimfiler_switch_to_parent_directory)
    nmap <buffer> ~ <Plug>(vimfiler_switch_to_home_directory)
    nmap <buffer> \ <Plug>(vimfiler_switch_to_root_directory)
    nmap <buffer> & <Plug>(vimfiler_switch_to_project_directory)

    " 閉じる
    nmap <buffer> q <Plug>(vimfiler_hide)
    nmap <buffer> Q <Plug>(vimfiler_exit)

    " 特殊
    " 隠しファイル表示・非表示
    nmap <buffer> . <Plug>(vimfiler_toggle_visible_ignore_files)
    " 外部のプログラムで実行
    nmap <buffer> X <Plug>(vimfiler_execute_system_associated)
    " エクスプローラーで開く
    nmap <buffer> E <Plug>(vimfiler_execute_external_filer)
    " シェルの起動
    nmap <buffer> SH <Plug>(vimfiler_popup_shell)
    " 外部コマンドの実行
    nmap <buffer> ! <Plug>(vimfiler_execute_shell_command)
    " 追加アクション
    nmap <buffer> A <Plug>(vimfiler_choose_action)
    " ブックマーク
    nmap <silent><buffer><expr> B vimfiler#do_action('bookmark')
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
    " maskモード
    nmap <buffer> M <Plug>(vimfiler_set_current_mask)

    " マーク
    nmap <buffer> <S-Space> <Plug>(vimfiler_toggle_mark_current_line)
    vmap <buffer> <Space> <Plug>(vimfiler_toggle_mark_selected_lines)
    nmap <buffer> * <Plug>(vimfiler_toggle_mark_all_lines)
    nmap <buffer> C <Plug>(vimfiler_clear_mark_all_lines)

    " ファイル編集
    nmap <buffer> mc <Plug>(vimfiler_copy_file)
    nmap <buffer> mm <Plug>(vimfiler_move_file)
    nmap <buffer> md <Plug>(vimfiler_delete_file)
    nmap <buffer> df <Plug>(vimfiler_delete_file)
    nmap <buffer> mr <Plug>(vimfiler_rename_file)

    " ファイル作成
    nmap <buffer> ad <Plug>(vimfiler_make_directory)
    nmap <buffer> af <Plug>(vimfiler_new_file)

    " ファイルクリップ
    nmap <buffer> cc <Plug>(vimfiler_clipboard_copy_file)
    nmap <buffer> cm <Plug>(vimfiler_clipboard_move_file)
    nmap <buffer> cp <Plug>(vimfiler_clipboard_paste)
    nmap <buffer> yy <Plug>(vimfiler_yank_full_path)



    " マークは，<S-Space>
    nmap <silent><buffer> <S-Space> <Plug>(vimfiler_toggle_mark_current_line)
    vmap <silent><buffer> <S-Space> <Plug>(vimfiler_toggle_mark_selected_lines)

    " ウィンドウを分割して開く
    nmap <silent><buffer><expr> s vimfiler#do_switch_action('split')
    nmap <silent><buffer><expr> v vimfiler#do_switch_action('vsplit')

    " 全角スペースのハイライトをオフ
    let b:zenkaku_hilight_off = 1

    " 無視リスト
    let g:vimfiler_ignore_pattern = ['^\.git$', '^\.DS_Store$', '^\.svn']
  endfunction
  "ゴミ箱の使用
  let g:unite_kind_file_use_trashbox = 1
  call neobundle#untap()
endif "}}}
if(neobundle#tap('lightline.vim')) "{{{
  let g:lightline = {
  \  'active': {
  \    'left': [['mode', 'paste'], ['filename']],
  \    'right': [['row'], ['fileencoding'], ['projecttag']]
  \  },
  \  'inactive': {
  \    'left': [['filename']],
  \    'right': [['row'], ['fileencoding'], ['projecttag']]
  \  },
  \  'component_function': {
  \    'mode': 'LightlineMode',
  \    'paste' : 'LightlinePaste',
  \    'readonly' : 'LightlineReadonly',
  \    'filename' : 'LightlineFilename',
  \    'modified' : 'LightlineModified',
  \    'row' : 'LightlineRow',
  \    'fileencoding': 'LightlineFileencoding',
  \    'projecttag': 'LightlineProjecttag'
  \  }
  \}
  let s:default_palette = g:lightline#colorscheme#default#palette
  let s:p = s:default_palette
  function! LightlineMode()
    return &ft == 'vimfiler' ? '' : lightline#mode()
  endfunction
  function! LightlinePaste()
    return &ft == 'vimfiler' ? '' : &paste ? "PASTE" : ""
  endfunction
  function! LightlineReadonly()
    return &ft != 'vimfiler' && &ft !~? 'help' && &readonly ? 'RO' : ''
  endfunction
  function! LightlineFilename()
      return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? len(b:vimfiler.current_dir) > 1 ? split(b:vimfiler.current_dir, "/")[-1] : '' :
        \  &ft == 'unite' ? unite#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
  endfunction
  function! LightlineModified()
    return &modifiable && &modified ? '+' : ''
  endfunction
  function! LightlineRow()
    return &ft == 'vimfiler' ? '' : line(".") . "/" . line("$")
  endfunction
  function! LightlineFileencoding()
    return &ft == 'vimfiler' ? '' : &encoding
  endfunction
  function! LightlineProjecttag()
    return exists('w:project_tag') ? 'T' : ''
  endfunction
  let s:p.normal.right[2] = ['#323232', '#d75f00', 1, 1]
	let g:lightline#colorscheme#yourcolorscheme#palette = s:p
  call neobundle#untap()
endif "}}}
if(neobundle#tap('vimproc.vim')) "{{{
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
              let s:vimproc_result .= vimproc.stdout.read()
          endif
          if !vimproc.stderr.eof
              let s:vimproc_result .= vimproc.stderr.read()
          endif
          if !(vimproc.stdout.eof && vimproc.stderr.eof)
              return 0
          endif
      catch
          echom v:throwpoint
      endtry

      let a:arg_str = ''
      let a:args = []
      call add(a:args, 's:vimproc_result')
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
      unlet s:vimproc_result
  endfunction

  function! s:system_async(cmd, callback, ...)
      let cmd = a:cmd
      echom "----async----"
      echom cmd
      let vimproc = vimproc#pgroup_open(cmd)
      call vimproc.stdin.close()

      let s:vimproc = vimproc
      let s:vimproc_result = ""

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
  call neobundle#untap()
endif "}}}
if(neobundle#tap('yankround.vim')) "{{{
  nmap p <Plug>(yankround-p)
  vmap p <Plug>(yankround-p)
  nmap P <Plug>(yankround-P)
  vmap P <Plug>(yankround-P)
  nmap gp <Plug>(yankround-gp)
  vmap gp <Plug>(yankround-gp)
  nmap gP <Plug>(yankround-gP)
  vmap gP <Plug>(yankround-gP)
  nmap <C-p> <Plug>(yankround-prev)
  vmap <C-p> <Plug>(yankround-prev)
  nmap <C-n> <Plug>(yankround-next)
  vmap <C-n> <Plug>(yankround-next)
  nnoremap <silent> [unite]y :<C-u>Unite<Space>yankround<CR>
  "yankのペーストにハイライトを使用するか
  let g:yankround_use_region_hl = 1
  autocmd ColorScheme * highlight YankRoundRegion gui=underline guifg=White guibg=Black
  call neobundle#untap()
endif "}}}
if(neobundle#tap('grep.vim')) "{{{
  nnoremap [search]r :<C-u>Rgrep<CR>
  nnoremap [search]e :<C-u>Regrep<CR>
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
  call neobundle#untap()
endif "}}}
if(neobundle#tap('indentLine')) "{{{
  let g:indentLine_color_gui = '#303640'
  let g:indentLine_char = '¦' "use ¦, ┆ or │
  call neobundle#untap()
endif "}}}
if(neobundle#tap('hl_matchit.vim')) "{{{
  let g:hl_matchit_enable_on_vim_startup = 1
  let g:hl_matchit_hl_groupname = 'MatchParen'
  let g:hl_matchit_speed_level = 1
  let g:hl_matchit_allow_ft = 'ruby,vim' " blah..blah..
  call neobundle#untap()
endif "}}}"
if(neobundle#tap('vim-expand-region')) "{{{
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
  vmap <silent> c <Plug>(expand_region_shrink)
  nmap <silent> c <Plug>(expand_region_shrink)
  call neobundle#untap()
endif "}}}
if(neobundle#tap('vim-trailing-whitespace')) "{{{
  autocmd VimEnter,ColorScheme,BufWinEnter * :hi ExtraWhiteSpace guibg=#990000
  call neobundle#untap()
endif "}}}
if(neobundle#tap('vim-rooter')) "{{{
  let g:rooter_manual_only = 1 "FindRootDirectory()
  let g:rooter_patterns = ['Rakefile', '.svn/', '.git/']
  call neobundle#untap()
endif "}}}
if(neobundle#tap('switch.vim')) "{{{
  let g:switch_mapping = "-"
  let g:switch_custom_definitions =
    \ [
    \   switch#NormalizedCase(['if', 'unless']),
    \   switch#NormalizedCase(['==', '!='])
    \ ]
  call neobundle#untap()
endif "}}}
if(neobundle#tap('vim-ref')) "{{{
  " vim-ref のバッファを q で閉じられるようにする
  autocmd FileType ref-* nnoremap <buffer> <silent> q :<C-u>close<CR>

  " 辞書定義
  let g:ref_source_webdict_sites = {
  \   'je': {
  \     'url': 'http://dictionary.infoseek.ne.jp/jeword/%s',
  \   },
  \   'ej': {
  \     'url': 'http://dictionary.infoseek.ne.jp/ejword/%s',
  \   },
  \ }

  " デフォルトサイト
  let g:ref_source_webdict_sites.default = 'ej'

  " 出力に対するフィルタ
  " 最初の数行を削除
  function! g:ref_source_webdict_sites.je.filter(output)
    return join(split(a:output, "\n")[15 :], "\n")
  endfunction

  function! g:ref_source_webdict_sites.ej.filter(output)
    return join(split(a:output, "\n")[15 :], "\n")
  endfunction
endif "}}}
if(neobundle#tap('vim-altercmd')) "{{{
  call altercmd#load()
  CAlterCommand ej Ref webdict ej
  CAlterCommand je Ref webdict je
endif "}}}
" + ctags系 {{{
  function s:CheckProject()
    if(!neobundle#is_installed('vim-rooter') || !neobundle#is_installed('vimproc.vim'))
      return
    endif

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
        call s:ChangeProject()
      endif
    else
      if exists('w:project_tag')
        unlet w:project_tag
      endif
    endif
  endfunction

  function s:SetGemPaths()
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

  function s:SetGemTags()
    let g:gem_tags = []
    for gem_path in g:gem_paths
      if filereadable(gem_path . '/tags')
        call add(g:gem_tags, gem_path . '/tags')
      endif
    endfor
  endfunction

  function s:ChangeProject()
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

  function s:GenerateProjectTag()
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

  function s:GeneratedProjectTag()
    echom 'tag generate!!!'
  endfunction
  autocmd BufEnter,WinEnter * call s:CheckProject()

  " nnoremap [ctag]u :<C-u>call UpdateTags()<CR>
  nnoremap [ctag]j <C-]>
  nnoremap [ctag]k <C-t>
  nnoremap [ctag]l :<C-u>tselect<CR>
  nnoremap [ctag]; :<C-u>tags<CR>
  nnoremap [ctag]v :vsp<CR>:exe("tjump " . expand("<cword>"))<CR>
  nnoremap [ctag]s :exe("stj " . expand("<cword>"))<CR>
  vnoremap [ctag]j g<C-]>
" + }}}
