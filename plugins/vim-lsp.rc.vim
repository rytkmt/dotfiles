
let g:lsp_log_file = ''
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:asyncomplete_popup_delay = 200
let g:lsp_text_edit_enabled = 0
let g:lsp_textprop_enabled = 1
let g:lsp_virtual_text_enabled = 0

nmap [lsp]s <plug>(lsp-status)
nmap [lsp]t <plug>(lsp-type-definition)
nnoremap [lsp]d :vsplit \| :LspDefinition<CR>
nmap gd [lsp]d
nmap [lsp]u <plug>(lsp-peek-declaration)
nmap [lsp]i <plug>(lsp-type-hierarchy)
nmap [lsp]h <plug>(lsp-hover)
" hook_source だとうまく動かなかった
if executable('solargraph')
  " gem install solargraph
  au User lsp_setup call lsp#register_server({
    \ 'name': 'solargraph',
    \ 'cmd': {server_info->[&shell, &shellcmdflag, 'solargraph stdio']},
    \ 'initialization_options': {"diagnostics": "true"},
    \ 'whitelist': ['ruby'],
    \ })
endif

hi LspErrorHighlight guifg=#d03535 gui=underline
hi LspError guifg=#d03535 gui=underline
