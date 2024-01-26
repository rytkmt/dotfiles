-- autofmt: 日本語文章のフォーマット(折り返し)プラグイン.
vim.opt.formatexpr="autofmt#japanese#formatexpr()"

-- [[ 表示 ]]

-- 行番号を非表示 (number:表示)
vim.opt.number = true
-- ルーラーを表示 (noruler:非表示)
vim.opt.ruler = true
-- タブや改行を表示 (list:表示)
vim.opt.list = true
-- どの文字でタブや改行を表示するかを設定
--vim.opt.listchars=tab:>-,extends:<,trail:-,eol:<
vim.opt.listchars = { tab = "> ", trail = "-", nbsp = "+" }
-- 長い行を折り返して表示 (nowrap:折り返さない)
vim.opt.wrap = false
-- 常にステータス行を表示 (詳細は:he laststatus)
vim.opt.laststatus = 2
-- コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
vim.opt.cmdheight = 2
-- コマンドをステータス行に表示
vim.opt.showcmd = true
-- タイトルを表示
vim.opt.title = true
-- vimが自動で生成する（読み込み時など）tab幅をスペース2つ文にする
vim.opt.shiftwidth = 2
-- 改行時などに、自動でインデントを設定してくれる
vim.opt.smartindent = true
-- UnicodeのAタイプ(Ambiguous)の文字幅（枠線のために => single、絵文字のため => double）
vim.opt.ambiwidth = "single"


-- [[ 検索関連 ]]

-- 検索時に大文字小文字を無視 (noignorecase:無視しない)
vim.opt.ignorecase = true
-- 大文字小文字の両方が含まれている場合は大文字小文字を区別
vim.opt.smartcase = true
-- インクリメンタルサーチを行う
vim.opt.incsearch = true
-- substitute中に変換後の文字に置き換えがプレビューされるのを無効化
vim.opt.inccommand = nil
-- 検索結果をハイライト
vim.opt.hlsearch = true


-- [[ 編集に関する設定 ]]

vim.g.editorconfig = false
-- vimスクリプトで\を指定した際のインデント量
vim.g.vim_indent_cont=2
-- タブの画面上での幅
vim.opt.tabstop = 2
-- タブをスペースに展開しない (expandtab:展開する)
vim.opt.expandtab = true
-- 自動的にインデントする (noautoindent:インデントしない)
vim.opt.autoindent = true
-- バックスペースでインデントや改行を削除できるようにする
vim.opt.backspace = { 'indent', 'eol', 'start' }
-- 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
vim.opt.wrapscan = true
-- 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
vim.opt.showmatch = true
-- 括弧入力時に対応する括弧に一瞬移動する時間（0.1の倍数）
vim.opt.matchtime = 2
-- コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
vim.opt.wildmenu = true
-- テキスト挿入中の自動折り返しを日本語に対応させる
vim.opt.formatoptions:append("mM")
-- 矩形ビジュアルモードで仮想編集を有効にする
vim.opt.virtualedit:append("block")
vim.opt.mouse = ""

-- [[ ファイル操作 ]]

-- バックアップファイルを作成しない (次行の先頭の " を削除すれば有効になる)
vim.opt.backup = false
-- swapファイルを作成しない
vim.opt.swapfile = false
-- undoファイルを作成しない
vim.opt.undofile = false


-- [[ その他 ]]

-- "0"で始まる数値を、8進数として扱わないようにする
vim.opt.nrformats:remove("octal")
-- ファイルの保存をしていなくても、べつのファイルを開けるようにする
vim.opt.hidden = true
vim.opt.history = 50
-- 新しい行を作った時に高度な自動インデントを行う
vim.opt.smarttab = true
-- カーソルを行頭、行末で止まらないようにする
vim.opt.whichwrap = "b,s,h,l,<,>,[,]"
-- 挿入モードのIMEのデフォルト値
vim.opt.iminsert = 0
-- 検索時のIMEのデフォルト値(-1はiminsertの値を参照するという意味)
vim.opt.imsearch = -1
-- Windows でもパスの区切り文字を / にする
-- vim.opt.shellslash = true
-- コマンドラインモードでTABキーによるファイル名補完を有効にする
vim.opt.wildmenu = true
vim.opt.wildmode= { "list:longest", "full" }
-- 画面分割時の位置
vim.opt.splitbelow = true
vim.opt.splitright = true
-- texのconcealを無効化（#^ω^）
vim.g.tex_conceal = ''
vim.opt.conceallevel = 0
-- 320列以上のものはシンタックス評価しない
vim.opt.synmaxcol = 320
-- vim.opt.colorcolumn=4,8,12
-- ヘルプの日本語化
vim.opt.helplang = { "ja", "en" }
vim.opt.wildignore:append({ "*.gif","*.png","*.jpg","*.jpeg","*.bak","tags","*.zip","*.jar","*.class","*.pdf","*.swf" })
vim.opt.updatetime = 0
-- 再描画に掛ける時間
vim.opt.redrawtime = 7000
-- 折りたたみのレベル
vim.opt.foldlevel = 99
-- 折りたたみの仕方
vim.opt.foldmethod = "manual"
-- バッファ終端以降の空行
vim.opt.fillchars = { eob = "-", diff = " " }


-- [[ loaded ]]
vim.g.did_install_default_menus  = 1
vim.g.did_install_syntax_menu    = 1
vim.g.loaded_man                 = 1
vim.g.loaded_2html_plugin        = 1
vim.g.loaded_gtags               = 1
vim.g.loaded_gtags_cscope        = 1
vim.g.loaded_gzip                = 1
vim.g.loaded_logiPat             = 1
vim.g.loaded_matchit             = 1
-- matchparen.nvimを使用するため標準のものは止める
vim.g.loaded_matchparen          = 1
vim.g.loaded_netrwFileHandlers   = 1
vim.g.loaded_netrwPlugin         = 1
vim.g.loaded_netrwSettings       = 1
vim.g.loaded_spellfile_plugin    = 1
vim.g.loaded_tarPlugin           = 1
vim.g.loaded_tutor_mode_plugin   = 1
vim.g.loaded_vimballPlugin       = 1
vim.g.loaded_zipPlugin           = 1
vim.g.skip_loading_mswin         = 1
