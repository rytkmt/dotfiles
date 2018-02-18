let g:vimshell_max_command_history = 100
let g:vimshell_prompt = "% "
let g:vimshell_secondary_prompt = "> "
"
let g:vimshell_prompt_expr =
\ 'escape(getcwd(). " %", "\\[]()?! ")." "'
let g:vimshell_prompt_pattern = '^\%(\f\|\\.\)\+% '

nnoremap [other]s :sp<CR>:VimShellBufferDir<CR>
nnoremap [other]r ::VimShellInteractive irb<CR>
autocmd MyAutoCmd FileType vimshell nmap <buffer> o <C-k>a
autocmd MyAutoCmd FileType vimshell nmap <buffer> <S-o> <C-l><C-k>a
autocmd MyAutoCmd FileType vimshell imap <buffer> <C-l> <C-u>clear<CR>
