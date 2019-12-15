command! DeniteCurrentFileProjectDir call s:DeniteCurrentFileProjectDir()
function! s:DeniteCurrentFileProjectDir()
  let l:path = expand("%")
  if l:path == ""
    echom "invalid  current path"
  else
    let l:type = finddir('.git', expand('%:p').";") != '' ? 'file/rec/git' : 'file/rec'
    execute ":DeniteProjectDir " .l:type ." -path=".l:path
  endif
endfunction

"ファイル一覧
nnoremap [denite]f :<C-u>DeniteCurrentFileProjectDir<CR>
"ファイル履歴
nnoremap [denite]m :<C-u>Denite file_mru<CR>
" nnoremap [denite]c :<C-u>Denite file_rec<CR>
"バッファ一覧
nnoremap [denite]b :<C-u>Denite buffer<CR>

augroup denite_filter
  autocmd!
  autocmd FileType denite call s:denite_settings()
  function! s:denite_settings() abort
    nnoremap <buffer><expr> B ":set winblend=0<CR>"
    nnoremap <buffer><expr> b ":set winblend=18<CR>"
    nnoremap <silent><buffer><expr> i       denite#do_map('open_filter_buffer')
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
    nnoremap <silent><buffer> <C-j> j
    nnoremap <silent><buffer> <C-n> j
    nnoremap <silent><buffer> <C-k> k
    nnoremap <silent><buffer> <C-p> k
    nnoremap <silent><buffer> <C-q> :call denite#call_map('quit')<CR>
  endfunction

  autocmd FileType denite-filter call s:denite_filter_settings()
  function! s:denite_filter_settings() abort
    nnoremap <silent><buffer> <C-q> <C-o>:call denite#call_map('quit')<CR>
    inoremap <silent><buffer> <C-q> <C-o>:call denite#call_map('quit')<CR>
    imap <silent><buffer> <C-e> <CR><CR>
    imap <silent><buffer> <C-s> <CR>s
    imap <silent><buffer> <C-v> <CR>v
    imap <silent><buffer> <C-t> <CR>t
    imap <silent><buffer> <C-j> <CR>j
    imap <silent><buffer> <C-k> <CR>k
    imap <silent><buffer> <C-n> <Down>
    imap <silent><buffer> <C-p> <Up>
  endfunction
augroup END
