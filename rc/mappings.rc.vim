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
nnoremap [tab]m :<C-w>T
" ++ }}}
" ++ ウィンドウ操作 {{{

" ウィンドウ分割
nnoremap [window]s <C-w>s
nnoremap [window]v <C-w>v

" 新規タブに移動
nnoremap [window]t <C-w>T

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
nmap <C-Space><C-Space> :<C-u>noh<CR>
" ++ }}}
" ++ その他 {{{
nnoremap ZZ <Nop>
nnoremap <C-z> <Nop>

vnoremap d "_d
nnoremap d "_d
vnoremap D "_D
nnoremap D "_D
vnoremap x "_x
nnoremap x "_x
vnoremap s "_s
nnoremap s "_s
nnoremap t d
vnoremap t x
nnoremap tt dd
nnoremap tL d$
nnoremap T D
nnoremap <C-c> viws
nnoremap Yf :<C-u>redi! @"> \| echo expand("%:t") \| redi END<CR>
nnoremap Yp :<C-u>redi! @"> \| echo expand("%:p") \| redi END<CR>
nnoremap Yd :<C-u>redi! @"> \| echo expand("%:p:h") \| redi END<CR>
nnoremap Yh :<C-u>redi! @"> \| echo expand("%:p:h") \| redi END<CR>
nnoremap <ESC><ESC> :<C-u>noh<CR>
cmap <C-j> <LEFT>
cmap <C-k> <RIGHT>

" 逆に普通の行単位で移動したい時のために逆の map も設定しておく
nnoremap gj j
nnoremap gk k

" 行を移動
nnoremap <C-Up> "zdd<Up>"zP
nnoremap <C-Down> "zdd"zp
" 複数行を移動
vnoremap <C-Up> "zx<Up>"zP`[V`]
vnoremap <C-Down> "zx"zp`[V`]

" カーソル移動
noremap <S-h>   ^
noremap <S-j>  4gj
noremap <C-j>   }
noremap <S-k>  4gk
noremap <C-k>   {
noremap <S-l>   $

" 画面移動
noremap zl zL
noremap zh zH
noremap zj 4<C-e>
noremap zk 4<C-y>

" 削除
imap <C-h> <BS>
inoremap <C-d> <C-o>"_dd
inoremap <C-b> <C-o>"_db<C-o>x
inoremap <C-e> <C-o>"_de

inoremap <C-p> <C-r>"

" カーソル位置の単語を置換
nnoremap <expr> [map]s ':%s/\<' . expand('<cword>') . '\>/'
vnoremap <expr> [map]s ':<C-u>%s/\<' . expand('<cword>') . '\>/'
nnoremap <nowait> <expr> gc '`[' . getregtype()[0] . '`]'

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
nnoremap <expr> <C-h> ':h ' . expand('<cword>')

"メタ文字扱いのオプションをvery magicを初期値に
" nnoremap / /\v
" nnoremap ? ?\v
" キーマップ用
let mapleader = "\<Space>"
nmap <Tab> [map]
vmap <Tab> [map]
nmap [map] <Nop>

"=================================
"
"  q  w  e  r  t  y  u  i  o  p
"
"   a  s  d  f  g  h  j  k  l ;
"
"    z  x  c  v  b  n  m  ,  .
"
"=================================
map <Space> <Nop>
"単語ハイライト
nnoremap <silent> <Space><Space> "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>

" コピペ
vnoremap <Leader>c "*y
vnoremap <Leader>x "*d
nnoremap <Leader>v "*p
vnoremap <Leader>v "*p
nnoremap <Leader>V "*P
vnoremap <Leader>V "*P

nmap <Leader>z [other]
nmap <Leader>t [tab]
nmap <Leader>T [table]
nmap <Leader>w [window]
nmap <Leader>1 [ref]
nmap <Leader>q [quick]
nmap [quick] <Nop>
nmap <Leader>e [edit]
nmap [unite] <Nop>

nmap <Leader>u [unite]

nmap [filer] <Nop>
nmap <Leader>f [filer]

nmap [search] <Nop>
nmap <Leader>s [search]

nmap  [rails] <Nop>
nmap <Leader>r [rails]

nmap [ctag] <Nop>
vmap [ctag] <Nop>
nmap <Leader>g [ctag]
vmap <Leader>g [ctag]
nmap <Leader>p [ctrlp]
nmap [ctrlp] <Nop>

nnoremap [ft] <Nop>
nmap <Leader>; [ft]

nmap [denite] <Nop>
nmap <Leader>d [denite]

"=================================
" _
" 1  2  3  4  5  6  7  8  9  0
"  _  _  _  _  _     _        _
"  Q  W  E  R  T  y  U  i  o  P
"      _  _  _  _             _
"   a  S  D  F  G  h  j  k  l ;
"    _     _  _
"    Z  x  C  V  b  n  m  ,  .
"
"=================================

nnoremap [other]h :so $VIMRUNTIME/syntax/hitest.vim
nnoremap [other]v :<C-u>tabedit $XDG_CONFIG_HOME/vimrc.vim<CR>
nnoremap [other]d :<C-u>tabedit $XDG_CONFIG_HOME/dein.toml<CR>
nnoremap [other]o :<C-u>tabedit $XDG_CONFIG_HOME/rc/options.rc.vim<CR>
nnoremap [other]m :<C-u>tabedit $XDG_CONFIG_HOME/rc/mappings.rc.vim<CR>
nnoremap [other]l :<C-u>so ~/.vimrc<CR>:<C-u>so ~/.gvimrc<CR>
nnoremap [other]h :<C-u>tabedit $XDG_CONFIG_HOME/../lighthouse/colors/lighthouse.vim<CR>
nnoremap [edit]s :e ++enc=shift_jis<CR>
nnoremap [edit]u :e ++enc=utf-8<CR>
nnoremap [edit]e :e ++enc=euc-jp<CR>

if has('win32')
  let $MEMO = $HOME . '/workspace/sql.sql'
  let $TESTRB = $HOME . '/workspace/test.rb'
  nnoremap [other]q :<C-u>tabedit $MEMO<CR>
  nnoremap [other]t :<C-u>tabedit $TESTRB<CR>
endif
"if has('syntax')
"  autocmd MyAutoCmd BufWinEnter * let w:m1 = matchadd("ZenkakuSpace", '　')
"  autocmd MyAutoCmd WinEnter * let w:m1 = matchadd("ZenkakuSpace", '　')
"endif
" ++ }}}
" ++ ファイルタイプ別{{{
" +++ help{{{
autocmd MyAutoCmd FileType help nnoremap <buffer> q :q<CR>
" +++ }}}
" +++ railslog {{{
autocmd MyAutoCmd FileType railslog nmap <buffer> q bd!
" +++ }}}
" ++ }}}
" + ctags系 {{{

  source $XDG_CONFIG_HOME/rc/extensions/_ctags.rc.vim
  autocmd MyAutoCmd BufEnter,WinEnter * CtagsSet

  " nnoremap [ctag]u :<C-u>call UpdateTags()<CR>
  nnoremap [ctag]j <C-]>
  nnoremap [ctag]k <C-t>
  nnoremap [ctag]l :<C-u>tselect<CR>
  nnoremap [ctag]; :<C-u>tags<CR>
  nnoremap [ctag]v :vsp<CR>:exe("tjump " . expand("<cword>"))<CR>
  nnoremap [ctag]s :exe("stj " . expand("<cword>"))<CR>
  vnoremap [ctag]j g<C-]>
" + }}}
"+ 自作コマンド {{{

" 一時ファイルを作成して開く、Tempfileコマンドを定義
function! s:make_tempfile(...)
  exe "vs " .tempname()
  if exists("a:1")
    exe "set ft=" .a:1
  endif
  autocmd MyAutoCmd BufLeave <buffer> write
endfunction
command! Tempfile call s:make_tempfile()
command! TempfileRuby call s:make_tempfile("ruby")

" カレントディレクトリをエクスプローラーで開く
function! s:open_current_explorer()
  if has('mac')
    exe "silent ! open %:h"
  else
    exe "silent ! start %:h"
  endif
endfunction
command! OpenCurrentExplorer call s:open_current_explorer()

" キャメルケースに変換
function! s:to_camel_case(before_str)
  let l:arr = split(a:before_str, '_')
  let l:after_str = remove(l:arr, 0)
  for l:before_char in l:arr
    let l:after_str = l:after_str . substitute(l:before_char, "^.", "\\u\\0", "")
  endfor
  execute "normal viws" . l:after_str
endfunction
command! -nargs=? ToCamelCase call s:to_camel_case(<f-args>)
nnoremap <expr> Cc ':ToCamelCase ' . expand('<cword>') .'<CR>'

" パスカルケースに変換
function! s:to_pascal_case(before_str)
  let l:after_str = ""
  for l:before_char in split(a:before_str, '_')
    let l:after_str = l:after_str . substitute(l:before_char, "^.", "\\u\\0", "")
  endfor
  execute "normal viws" . l:after_str
endfunction
command! -nargs=? ToPascalCase call s:to_pascal_case(<f-args>)
nnoremap <expr> Cp ':ToPascalCase ' . expand('<cword>') .'<CR>'

" スネークケースに変換
function! s:to_snake_case(before_str)
  let l:before_str = substitute(a:before_str, "^.", "\\l\\0", "")
  let l:after_str = ""
  for l:i in range(0,strlen(l:before_str)-1)
    if l:before_str[l:i] ==# toupper(l:before_str[l:i])
      let l:after_str = l:after_str . substitute(l:before_str[l:i], "[A-Z]", "_\\l\\0", "")
    else
      let l:after_str = l:after_str . l:before_str[l:i]
    endif
  endfor
  execute "normal viws" . l:after_str
endfunction
command! -nargs=? ToSnakeCase call s:to_snake_case(<f-args>)
nnoremap <expr> Cs ':ToSnakeCase ' . expand('<cword>') .'<CR>'
"}}}
