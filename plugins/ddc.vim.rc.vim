call ddc#custom#patch_global('sources', [
  \ 'around',
  \ 'ultisnips',
  \ 'buffer',
  \ ])

call ddc#custom#patch_global('backspaceCompletion', v:true)
call ddc#custom#patch_global('sourceOptions', {
    \ '_': {
    \   'matchers': ['matcher_fuzzy'],
    \   'sorters': ['sorter_fuzzy'],
    \ },
    \ 'nvim-lsp': {
    \   'mark': 'lsp',
    \   'forceCompletionPattern': '\.\w*|:\w*|->\w*'
    \ },
    \ 'around': {'mark': 'A'},
    \ 'ultisnips': {'mark': 'ulti'},
    \ 'buffer': {'mark': 'B'},
    \ })
call ddc#custom#patch_filetype(['ruby'], 'sources', ['around', 'ultisnips', 'nvim-lsp'])
    " \ 'vim-lsp': {
    " \   'mark': 'lsp',
    " \   'minAutoCompleteLength': 1
    " \ },

call ddc#custom#patch_global('sourceParams', {
    \ 'around': {'maxSize': 500},
    \ 'nvim-lsp': { 'kindLabels': { 'Class': 'c' } },
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


lua << EOF
    local on_attach = function (client, bufnr)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true, silent = true})
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>vs | lua vim.lsp.buf.definition()<CR>', {noremap = true, silent = true})
    end
    require('lspconfig').solargraph.setup({on_attach = on_attach})
EOF


" nnoremap <silent> [lsp]s <plug>(lsp-status)
" nnoremap <silent> [lsp]t <plug>(lsp-type-definition)
" nnoremap <silent> [lsp]d :vsplit \| :LspDefinition<CR>
" nmap <silent> gd :vsplit \| [lsp]d
" nnoremap <silent> [lsp]u <plug>(lsp-peek-declaration)
" nnoremap <silent> [lsp]i <plug>(lsp-type-hierarchy)
" nnoremap <silent> [lsp]h <plug>(lsp-hover)
call ddc_nvim_lsp_doc#enable()
call ddc#enable()
