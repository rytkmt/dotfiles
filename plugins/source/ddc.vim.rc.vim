call ddc#custom#patch_global('sources', [
  \ 'around',
  \ 'vsnip',
  \ 'buffer',
  \ ])
call ddc#custom#patch_global('ui', 'native')

call ddc#custom#patch_global('backspaceCompletion', v:true)
call ddc#custom#patch_global('sourceOptions', {
    \ '_': {
    \   'matchers': ['matcher_fuzzy'],
    \   'sorters': ['sorter_rank'],
    \   'maxItems': 30,
    \   'converters': ['converter_remove_overlap'],
    \ },
    \ 'nvim-lsp': {
    \   'mark': 'lsp',
    \   'forceCompletionPattern': '\.\w*|:\w*|->\w*'
    \ },
    \ 'around': {'mark': 'A'},
    \ 'buffer': {'mark': 'B'},
    \ })

call ddc#custom#patch_global('sourceParams', {
    \ 'around': {'maxSize': 200},
    \ 'nvim-lsp': { 'kindLabels': { 'Class': 'c' } },
    \ })

call ddc#custom#patch_filetype(['ruby'], 'sources', ['nvim-lsp', 'vsnip', 'around', 'buffer' ])
call ddc#custom#patch_filetype(['markdown'], 'sources', ['gemojione', 'vsnip', 'around', 'buffer' ])
call ddc#custom#patch_filetype(['markdown'], 'keywordPattern', '[a-zA-Z_:]\w*')
call ddc#custom#patch_filetype(['markdown'], 'sourceOptions', {
    \ '_': {
    \   'matchers': ['matcher_fuzzy'],
    \   'sorters': ['sorter_rank'],
    \   'maxItems': 30,
    \ },
    \ 'nvim-lsp': {
    \   'mark': 'lsp',
    \   'forceCompletionPattern': '\.\w*|:\w*|->\w*'
    \ },
    \ 'around': {'mark': 'A'},
    \ 'buffer': {'mark': 'B'},
    \ })
    " \ 'gemojione': { 'mark': 'G' },

" imap <expr><C-s> "\<Right>\<C-R>=UltiSnips#ExpandSnippet()\<CR>"

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
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local opts = { noremap=true, silent=true }
  -- buf_set_keymap('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>vs | lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gs', '<cmd>sp | lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  buf_set_keymap('n', 'g[', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', 'g]', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  -- require('folding').on_attach()
end
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require('lspconfig').solargraph.setup({
 on_attach = on_attach,
 capabilities = capabilities,

 settings = {
   solargraph = {
     auto_format = false,
     diagnostics = false,
     formatting = false,
     folding = false,
     hover = false,
     reference = false,
     rename = false,
     symbols = false,
     useBundler = false
   }
 }
})
EOF


" nnoremap <silent> [lsp]s <plug>(lsp-status)
" nnoremap <silent> [lsp]t <plug>(lsp-type-definition)
" nnoremap <silent> [lsp]d :vsplit \| :LspDefinition<CR>
" nmap <silent> gd :vsplit \| [lsp]d
" nnoremap <silent> [lsp]u <plug>(lsp-peek-declaration)
" nnoremap <silent> [lsp]i <plug>(lsp-type-hierarchy)
" nnoremap <silent> [lsp]h <plug>(lsp-hover)
call ddc#enable()
