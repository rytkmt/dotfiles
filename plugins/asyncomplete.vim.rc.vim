let g:asyncomplete_enable_for_all = 0
autocmd MyAutoCmd FileType git,snippet,toml,vim,ruby call asyncomplete#enable_for_buffer()

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <expr><C-j>  pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr><C-k>  pumvisible() ? "\<C-p>" : "\<C-k>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
imap <c-5> <Plug>(asyncomplete_force_refresh)
imap <expr><C-s>
\ deoplete#complete_common_string() != '' ?
\   deoplete#complete_common_string() : "\<Right>"
