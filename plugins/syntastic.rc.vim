let g:syntastic_error_symbol = "-\u0078"
let g:syntastic_warning_symbol = "-\u0021"
let g:syntastic_style_error_symbol = "S\u0078"
let g:syntastic_style_warning_symbol = "S\u0021"

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 5
let g:syntastic_cursor_column = 0
let g:syntastic_enable_balloons = 0

" syntasticだとmriかrubocopかの2択になりそう。ただ同期チェックなのでALEに乗り換えを検討したい
" let g:syntastic_ruby_rubocop_exe = 'bundle exec rubocop'
" let g:syntastic_ruby_checkers = ["ruby", "rubocop"]
" autocmd FileType ruby if stridx(expand("%:p"), "rx_1") != -1 |
"  \ let b:syntastic_checkers = ["mri", "rubocop"] | endif

let g:syntastic_mode_map = {
\ 'mode': 'active',
\ 'active_filetypes': [
\   'ruby', 'vim', 'sql', 'yaml'
\ ],
\ 'passive_filetypes': [
\   'eruby'
\ ]}
