" swiftの自動補完on
let g:deoplete#sources#swift#daemon_autostart = 1

autocmd FileType swift imap <buffer> [ft]j <Plug>(deoplete_swift_jump_to_placeholder)
