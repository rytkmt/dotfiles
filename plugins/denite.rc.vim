
"ファイル一覧
nnoremap [denite]f :<C-u>DeniteProjectDir file/rec<CR>
"ファイル履歴
nnoremap [denite]m :<C-u>Denite file_mru<CR>
" nnoremap [denite]c :<C-u>Denite file_rec<CR>
"バッファ一覧
nnoremap [denite]b :<C-u>Denite buffer<CR>

"+ 初期設定 {{{
call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
 \ [ '.git/', 'tags', '.svn/', '.rbenv/' ])

call denite#custom#source('buffer', 'matchers',
 \ ['matcher/fuzzy', 'matcher/project_files'])

let s:default_options = {
 \ "split": "floating",
 \ "wincol": float2nr(&columns / 8),
 \ "winrow": float2nr(&lines / 10),
 \ "winheight": float2nr(&lines / 10 * 8),
 \ 'highlight_filter_background': 'DeniteFilter',
 \ 'prompt': '$ ',
 \ 'start_filter': v:true,
 \ }
call denite#custom#option('default', s:default_options)

call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')
"+ }}}

"+ FT設定 {{{
augroup denite_filter
  autocmd!
  autocmd FileType denite call s:denite_settings()
  function! s:denite_settings() abort
    nnoremap <silent><buffer><expr> <CR>    denite#do_map('do_action', 'open')
    nnoremap <silent><buffer><expr> e       denite#do_map('do_action', 'open')
    nnoremap <silent><buffer><expr> l       denite#do_map('do_action', 'open')
    nnoremap <silent><buffer><expr> L       denite#do_map('do_action', 'open')
    nnoremap <silent><buffer><expr> <C-s>   denite#do_map('do_action', 'split')
    nnoremap <silent><buffer><expr> s       denite#do_map('do_action', 'split')
    nnoremap <silent><buffer><expr> <C-v>   denite#do_map('do_action', 'vsplit')
    nnoremap <silent><buffer><expr> v       denite#do_map('do_action', 'vsplit')
    nnoremap <silent><buffer><expr> <C-t>   denite#do_map('do_action', 'tabopen')
    nnoremap <silent><buffer><expr> t       denite#do_map('do_action', 'tabopen')
    nnoremap <silent><buffer><expr> q       denite#do_map('quit')
    nnoremap <silent><buffer><expr> <ESC>   denite#do_map('quit')
  endfunction

  autocmd FileType denite-filter call s:denite_filter_settings()
  function! s:denite_filter_settings() abort
  endfunction
augroup END
"+ }}}
