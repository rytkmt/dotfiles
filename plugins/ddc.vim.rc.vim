call ddc#custom#patch_global('sources', [
  \ 'around',
  \ 'ultisnips',
  \ 'buffer',
  \ ])

call ddc#custom#patch_global('backspaceCompletion', v:true)
call ddc#custom#patch_global('sourceOptions', {
    \ '_': {
    \   'matchers': ['matcher_head'],
    \   'sorters': ['sorter_rank'],
    \ },
    \ 'vim-lsp': {
    \   'mark': 'lsp',
    \   'minAutoCompleteLength': 1
    \ },
    \ 'around': {'mark': 'A'},
    \ 'ultisnips': {'mark': 'ulti'},
    \ 'buffer': {'mark': 'B'},
    \ })
call ddc#custom#patch_filetype(['ruby'], 'sources', ['around', 'ultisnips', 'vim-lsp'])

call ddc#custom#patch_global('sourceParams', {
    \ 'around': {'maxSize': 500},
    \ })

imap <expr><C-s>
\ ddc#map#complete_common_string() != '' ?
\   "\<C-R>=UltiSnips#ExpandSnippet()\<CR>" : "\<Right>"

" inoremap <silent> <C-l> <Right>
" inoremap <expr> <CR> pumvisible() ? asyncomplete#close_popup() . "\<CR>" : "\<CR>"
imap <silent><expr> <C-l> pumvisible() ? "\<C-s>" : "\<Right>"

" inoremap <expr> <CR> pumvisible() ? asyncomplete#close_popup() . "\<CR>" : "\<CR>"

" <TAB>: completion.
" inoremap <silent><expr> <TAB>
" \ pumvisible() ? '<C-n>' :
" \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
" \ '<TAB>' : ddc#map#manual_complete()
"
" " <S-TAB>: completion back.
" inoremap <expr><S-TAB>  pumvisible() ? '<C-p>' : '<C-h>'

call ddc#enable()
