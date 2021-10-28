call ddc#custom#patch_global('sources', [
  \ 'around',
  \ 'ultisnips',
  \ 'buffer',
  \ ])

call ddc#custom#patch_global('backspaceCompletion', v:true)
call ddc#custom#patch_global('sourceOptions', {
    \ '_': {
    \   'matchers': ['matcher_fuzzy'],
    \   'sorters': ['sorter_rank'],
    \   'maxCandidates': 500,
    \ },
    \ 'nvim-lsp': {
    \   'mark': 'lsp',
    \   'forceCompletionPattern': '\.\w*|:\w*|->\w*'
    \ },
    \ 'around': {'mark': 'A'},
    \ 'ultisnips': {'mark': 'ulti'},
    \ 'buffer': {'mark': 'B', 'limitBytes': 2000000},
    \ })
call ddc#custom#patch_filetype(['ruby'], 'sources', ['nvim-lsp', 'around', 'ultisnips', ])

call ddc#custom#patch_global('sourceParams', {
    \ 'around': {'maxSize': 800},
    \ 'nvim-lsp': { 'kindLabels': { 'Class': 'c' } },
    \ })

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
  buf_set_keymap('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  buf_set_keymap('n', 'g[', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', 'g]', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  -- require('folding').on_attach()
end

require('lspconfig').solargraph.setup({
  on_attach = on_attach,

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
