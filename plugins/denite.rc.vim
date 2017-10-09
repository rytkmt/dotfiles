"+ コマンド {{{
"ファイル一覧
nmap [denite]f :<C-u>DeniteProjectDir file_rec<CR>
"ファイル履歴
nmap [denite]m :<C-u>Denite file_old<CR>
"バッファ一覧
nmap [denite]b :<C-u>Denite buffer<CR>
"+ }}}

"+ 設定 {{{
"++ キーマップ{{{
"ESCキーでdeniteを終了
call denite#custom#map('insert', '<esc>', '<denite:enter_mode:normal>', 'noremap')
call denite#custom#map('normal', '<esc>', '<denite:quit>', 'noremap')
"C-j,C-kで上下移動
call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')
"C-s,C-vでsplitで開く
call denite#custom#map('insert', '<C-s>', '<denite:do_action:split>', 'noremap')
call denite#custom#map('insert', '<C-v>', '<denite:do_action:vsplit>', 'noremap')
call denite#custom#map('insert', '<C-t>', '<denite:do_action:tabopen>', 'noremap')
"++ }}}
"+ }}}
