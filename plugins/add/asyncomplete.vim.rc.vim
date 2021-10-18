let g:asyncomplete_enable_for_all = 1
autocmd MyAutoCmd FileType git,snippet,toml,vim,ruby call asyncomplete#enable_for_buffer()

imap <c-5> <Plug>(asyncomplete_force_refresh)
imap <expr><C-s>
\ deoplete#complete_common_string() != '' ?
\   deoplete#complete_common_string() : "\<Right>"

inoremap <silent><expr> <C-l> pumvisible() ? asyncomplete#close_popup() : "\<Right>"
inoremap <expr> <CR> pumvisible() ? asyncomplete#close_popup() . "\<CR>" : "\<CR>"
